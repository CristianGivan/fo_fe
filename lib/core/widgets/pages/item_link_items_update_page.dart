import 'dart:async';

import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/update_items_of_item_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';

import '../../../features/organizer/utils/organizer_exports.dart';

class ItemLinkItemsUpdatePage<T extends DtoEntity> extends StatefulWidget {
  final ItemsLinkParams params;
  final OrganizerItems<T> initSelectedItems;

  const ItemLinkItemsUpdatePage({super.key, required this.params, required this.initSelectedItems});

  @override
  _ItemLinkItemsUpdatePageState createState() => _ItemLinkItemsUpdatePageState<T>();
}

class _ItemLinkItemsUpdatePageState<T extends DtoEntity> extends State<ItemLinkItemsUpdatePage> {
  OrganizerItems<T> selectedItemsChecked = OrganizerItems.empty();
  OrganizerItems<T> selectedItemsUnchecked = OrganizerItems.empty();
  OrganizerItems<T> allItemsChecked = OrganizerItems.empty();
  OrganizerItems<T> allItemsUnchecked = OrganizerItems.empty();
  late OrganizerLinkBloc<T> selectedItemsBloc;
  late OrganizerBloc allItemsBloc;

  @override
  void initState() {
    super.initState();
    _initializeDataWithErrorHandling();
  }

  Future<void> _initializeDataWithErrorHandling() async {
    selectedItemsBloc = context.read<OrganizerLinkBloc<T>>();
    // allItemsBloc = createItemBloc(widget.params.itemType);

    try {
      selectedItemsChecked = widget.initSelectedItems as OrganizerItems<T>;
      //todo how to have the loading bara id is not loaded
      _loadUserItemsWithErrorHandling();

      setState(() {
        allItemsUnchecked = allItemsUnchecked.copyWithRemoveItemsWithSameId(selectedItemsChecked);
      });
    } catch (error) {
      _showErrorDialog(context, "Failed to initialize data: $error");
    }
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
    final updatedItems = UpdateItemsOfItemParams<T>(
      itemId: widget.params.id,
      itemType: widget.params.itemType,
      addedItems: allItemsChecked,
      removedItems: selectedItemsUnchecked,
    );
    return UpdateItemsOfItemActionsMenu.getMenuItems(context, updatedItems);
  }

  Widget _buildListSectionsWithListeners() {
    return MultiBlocListener(
      listeners: [
        BlocListener<ItemUserLinkBloc, OrganizerBlocState>(
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
                  title: Text(item.entity.subject),
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

  Future<void> _loadUserItemsWithErrorHandling() async {
    final completer = Completer<void>();

    final authLogBloc = context.read<AuthLogBloc>();
    late final int loginUserId;

    if (authLogBloc.state is AuthAuthenticatedBlocState) {
      final state = authLogBloc.state as AuthAuthenticatedBlocState;
      loginUserId = state.userEntity.id;
    } else {
      DialogManager.showNotAuthenticatedDialog(context);
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
