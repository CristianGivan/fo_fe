import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_user_update_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';

import '../../../features/organizer/utils/organizer_exports.dart';

class LinkItemListEditPage<T extends OrganizerItemEntity> extends StatefulWidget {
  final TaskParams params;

  const LinkItemListEditPage({Key? key, required this.params}) : super(key: key);

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
    _initializeData();
  }

  void _initializeData() {
    _loadTaskUserLinkItems();
    _loadUserItems();
  }

  void _loadTaskUserLinkItems() {
    final taskUserLinkBloc = context.read<TaskUserLinkBloc>();
    if (taskUserLinkBloc.state.status != OrganizerBlocStatus.loaded) {
      taskUserLinkBloc.add(GetLinkItemsByItemIdBlocEvent(widget.params));
    } else {
      _updateSelectedItems(taskUserLinkBloc.state.displayedItems as OrganizerItems<T>);
    }
  }

  void _loadUserItems() {
    final authLogBloc = context.read<AuthLogBloc>();
    late final int loginUserId;
    // if (false) {
    if (authLogBloc.state is AuthAuthenticatedBlocState) {
      final state = authLogBloc.state as AuthAuthenticatedBlocState;
      loginUserId = state.userEntity.id;
    } else {
      loginUserId = -1;
      _showNotAuthenticatedDialog(context);
    }

    final userBloc = context.read<UserBloc>();
    // todo -td- reinitialization of all blocs on log off
    // if (userBloc.state is UserItemsLoadedBlocState) {
    //   final state = userBloc.state as UserItemsLoadedBlocState;
    //   _updateAllItems(state.userItems);
    // } else {
    userBloc.add(GetLinkedUserItemsBlocEvent(UserParams(userId: loginUserId)));
    // }
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
      allItemsUnchecked = items.copyWithRemovedItems(selectedItemsChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: _buildListSectionsWithListeners(),
      menuOptions: (context, userId) => TaskUserUpdateActionsMenu.getMenuItems(
          context,
          UpdateLinkItemsOfItemParams<T>(
            itemId: widget.params.taskEntity.id,
            itemType: widget.params.itemType,
            addedItems: allItemsChecked,
            removedItems: selectedItemsUnchecked,
          )),
      onSearchSubmitted: () {},
    );
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
}
