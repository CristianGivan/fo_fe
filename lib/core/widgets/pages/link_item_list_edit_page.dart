import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';

import '../../../features/organizer/utils/organizer_exports.dart';

class LinkItemListEditPage extends StatefulWidget {
  final TaskParams params;

  const LinkItemListEditPage({Key? key, required this.params}) : super(key: key);

  @override
  _LinkItemListEditPageState createState() => _LinkItemListEditPageState();
}

class _LinkItemListEditPageState extends State<LinkItemListEditPage> {
  OrganizerItems<OrganizerItemEntity> selectedItemsChecked = OrganizerItems.empty();
  OrganizerItems<OrganizerItemEntity> selectedItemsUnchecked = OrganizerItems.empty();
  OrganizerItems<OrganizerItemEntity> allItemsChecked = OrganizerItems.empty();
  OrganizerItems<OrganizerItemEntity> allItemsUnchecked = OrganizerItems.empty();

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
      _updateSelectedItems(taskUserLinkBloc.state.displayedItems);
    }
  }

  void _loadUserItems() {
    final userBloc = context.read<UserBloc>();
    if (userBloc.state is UserItemsLoadedBlocState) {
      final state = userBloc.state as UserItemsLoadedBlocState;
      _updateAllItems(state.userItems);
    } else {
      userBloc.add(GetLinkedUserItemsBlocEvent(user: UserEntity(name: "name", id: 3)));
    }
  }

  void _updateSelectedItems(OrganizerItems<OrganizerItemEntity> items) {
    setState(() {
      selectedItemsChecked = items;
      selectedItemsUnchecked = OrganizerItems.empty();
    });
  }

  void _updateAllItems(OrganizerItems<OrganizerItemEntity> items) {
    setState(() {
      allItemsChecked = items;
      allItemsUnchecked = OrganizerItems.empty();
    });
  }

  void _onItemCheckedChanged(OrganizerItemEntity item, bool isChecked) {
    setState(() {
      if (isChecked) {
        selectedItemsUnchecked = selectedItemsUnchecked.copyWithRemovedItem(item);
        selectedItemsChecked = selectedItemsChecked.copyWithAddedItem(item);
      } else {
        selectedItemsChecked = selectedItemsChecked.copyWithRemovedItem(item);
        selectedItemsUnchecked = selectedItemsUnchecked.copyWithAddedItem(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: MultiBlocListener(
        listeners: [
          BlocListener<TaskUserLinkBloc, OrganizerBlocState<OrganizerItemEntity>>(
            listener: (context, state) {
              if (state.status == OrganizerBlocStatus.loaded) {
                _updateSelectedItems(state.displayedItems);
              }
            },
          ),
          BlocListener<UserBloc, UserBlocState>(
            listener: (context, state) {
              if (state is UserItemsLoadedBlocState) {
                _updateAllItems(state.userItems);
              }
            },
          ),
        ],
        child: Column(
          children: [
            _buildListSection("Selected Items (Checked)", selectedItemsChecked, true),
            _buildListSection("Selected Items (Unchecked)", selectedItemsUnchecked, false),
            _buildListSection("All Items (Checked)", allItemsChecked, true),
            _buildListSection("All Items (Unchecked)", allItemsUnchecked, false),
          ],
        ),
      ),
      menuOptions: (context, userId) => [],
      onSearchSubmitted: () {},
    );
  }

  Widget _buildListSection(
      String title, OrganizerItems<OrganizerItemEntity> items, bool isChecked) {
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
                      _onItemCheckedChanged(item, value);
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
}
