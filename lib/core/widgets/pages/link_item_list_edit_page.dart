import 'dart:async';

import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/update_items_of_item_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';

import '../../../features/organizer/utils/organizer_exports.dart';

class LinkItemListEditPage<T extends OrganizerItemEntity> extends StatefulWidget {
  final ItemParams params;

  const LinkItemListEditPage({super.key, required this.params});

  @override
  _LinkItemListEditPageState createState() => _LinkItemListEditPageState<T>();
}

class _LinkItemListEditPageState<T extends OrganizerItemEntity>
    extends State<LinkItemListEditPage> {
  OrganizerItems<T> selectedItemsChecked = OrganizerItems.empty();
  OrganizerItems<T> selectedItemsUnchecked = OrganizerItems.empty();
  OrganizerItems<T> allItemsChecked = OrganizerItems.empty();
  OrganizerItems<T> allItemsUnchecked = OrganizerItems.empty();

  @override
  void initState() {
    super.initState();
    _initializeDataWithErrorHandling();
  }

  Future<void> _initializeDataWithErrorHandling() async {
    try {
      await _loadTaskUserLinkItemsWithErrorHandling();
      await _loadUserItemsWithErrorHandling();

      setState(() {
        allItemsUnchecked = allItemsUnchecked.copyWithRemoveItemsWithSameId(selectedItemsChecked);
      });
    } catch (error) {
      debugPrint("Error during data initialization: $error");
      _showErrorDialog(context, "Failed to initialize data: $error");
    }
  }

  Widget _showNotAuthenticatedDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Not Authenticated'),
      content: const Text('Please log in to continue.'),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            context.pushNamed(AuthRouterNames.authRouteName);
          },
        ),
      ],
    );
  }

  void _updateSelectedItems(OrganizerItems<T> items) {
    setState(() {
      selectedItemsChecked = items;
      selectedItemsUnchecked = OrganizerItems.empty();
    });
  }

  void _updateAllItems(OrganizerItems<T> items) {
    setState(() {
      allItemsChecked = OrganizerItems.empty();
      allItemsUnchecked = items.copyWithRemoveItemsWithSameId(selectedItemsChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: _buildListSectionsWithListeners(),
      menuOptions: (context, userId) => _getMenuItems(context),
      onSearchSubmitted: () {},
    );
  }

  List<PopupMenuEntry> _getMenuItems(BuildContext context) {
    final params = UpdateItemsOfItemParams<T>(
      itemId: widget.params.id,
      itemType: widget.params.itemType,
      addedItems: allItemsChecked,
      removedItems: selectedItemsUnchecked,
    );
    return UpdateItemsOfItemActionsMenu.getMenuItems(context, params);
  }

  Widget _buildListSectionsWithListeners() {
    return MultiBlocListener(
      listeners: [
        BlocListener<TaskUserLinkBloc, OrganizerBlocState>(
          listener: (context, state) {
            if (state.status == OrganizerBlocStatus.loaded) {
              _updateSelectedItems(state.displayedItems as OrganizerItems<T>);
            }
          },
        ),
        BlocListener<UserBloc, UserBlocState>(
          listener: (context, state) {
            if (state is UserItemsLoadedBlocState) {
              _updateAllItems(state.userItems as OrganizerItems<T>);
            }
          },
        ),
      ],
      child: _buildUncheckedListView(allItemsUnchecked),
    );
  }

  Widget _buildUncheckedListView(OrganizerItems<T> items) {
    return Column(
      children: [
        _buildListSection("Selected_Checked", selectedItemsChecked, true, false),
        _buildListSection("All_Checked", allItemsChecked, true, true),
        _buildListSection("Selected_Unchecked", selectedItemsUnchecked, false, false),
        _buildListSection("All_Unchecked", allItemsUnchecked, false, true),
      ],
    );
  }

  Widget _buildListSection(String title, OrganizerItems<T> items, bool isChecked, bool isAllItems) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          Expanded(
            child: ListView.builder(
              itemCount: items.size(),
              itemBuilder: (context, index) {
                final item = items.getAt(index);
                return CheckboxListTile(
                  title: Text(item.subject),
                  value: isChecked,
                  onChanged: (bool? value) {
                    if (value != null) {
                      _onItemCheckedChanged(item, value, isAllItems);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onItemCheckedChanged(T item, bool isChecked, bool isAllItems) {
    setState(() {
      if (isAllItems) {
        if (isChecked) {
          allItemsUnchecked = allItemsUnchecked.copyWithRemovedItem(item);
          allItemsChecked = allItemsChecked.copyWithAddedItem(item);
        } else {
          allItemsChecked = allItemsChecked.copyWithRemovedItem(item);
          allItemsUnchecked = allItemsUnchecked.copyWithAddedItem(item);
        }
      } else {
        if (isChecked) {
          selectedItemsUnchecked = selectedItemsUnchecked.copyWithRemovedItem(item);
          selectedItemsChecked = selectedItemsChecked.copyWithAddedItem(item);
        } else {
          selectedItemsChecked = selectedItemsChecked.copyWithRemovedItem(item);
          selectedItemsUnchecked = selectedItemsUnchecked.copyWithAddedItem(item);
        }
      }
    });
  }

  Future<void> _loadTaskUserLinkItemsWithErrorHandling() async {
    final taskUserLinkBloc = context.read<TaskUserLinkBloc>();

    if (taskUserLinkBloc.state.status != OrganizerBlocStatus.loaded) {
      final completer = Completer<void>();

      taskUserLinkBloc.add(GetItemsOfItemBlocEvent(widget.params));

      final subscription = taskUserLinkBloc.stream.listen(
        (state) {
          if (state.status == OrganizerBlocStatus.loaded) {
            completer.complete();
          } else if (state.status == OrganizerBlocStatus.error) {
            completer.completeError(state.errorMessage ?? "Failed to load linked items.");
          }
        },
        onError: (error) {
          completer.completeError("Stream error: $error");
        },
      );

      try {
        await completer.future; // Wait for the desired state or an error
      } catch (error) {
        debugPrint("Error while loading linked items: $error");
        _showErrorDialog(context, error.toString());
      } finally {
        await subscription.cancel(); // Clean up the stream subscription
      }
    } else {
      debugPrint("Linked items are already loaded. Skipping fetch.");
      // You can optionally handle already-loaded state here if needed
      _updateSelectedItems(taskUserLinkBloc.state.displayedItems as OrganizerItems<T>);
    }
  }

  Future<void> _loadUserItemsWithErrorHandling() async {
    final completer = Completer<void>();

    final authLogBloc = context.read<AuthLogBloc>();
    late final int loginUserId;

    if (authLogBloc.state is AuthAuthenticatedBlocState) {
      final state = authLogBloc.state as AuthAuthenticatedBlocState;
      loginUserId = state.userEntity.id;
    } else {
      _showNotAuthenticatedDialog(context);
      return;
    }

    final userBloc = context.read<UserBloc>();
    userBloc.add(GetLinkedUserItemsBlocEvent(UserParams(userId: loginUserId)));

    final subscription = userBloc.stream.listen(
      (state) {
        if (state is UserItemsLoadedBlocState) {
          completer.complete();
        } else if (state is UserErrorBlocState) {
          completer.completeError(state.errorMessage ?? "Failed to load user items.");
        }
      },
      onError: (error) {
        completer.completeError("Stream error: $error");
      },
    );

    try {
      await completer.future;
    } catch (error) {
      debugPrint("Error while loading user items: $error");
      _showErrorDialog(context, error.toString());
    } finally {
      await subscription.cancel();
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
