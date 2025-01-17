import 'dart:async';

import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/cubit/tag_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/update_items_of_item_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';

import '../../../features/organizer/utils/organizer_exports.dart';

class ItemLinkItemsUpdatePage<T extends ItemEntity> extends StatefulWidget {
  final ItemsLinkParams params;
  final OrganizerItems<T> initSelectedItems;

  const ItemLinkItemsUpdatePage({super.key, required this.params, required this.initSelectedItems});

  @override
  _ItemLinkItemsUpdatePageState createState() => _ItemLinkItemsUpdatePageState<T>();
}

class _ItemLinkItemsUpdatePageState<T extends ItemEntity> extends State<ItemLinkItemsUpdatePage> {
  OrganizerItems<T> selectedItemsChecked = OrganizerItems.empty();
  OrganizerItems<T> selectedItemsUnchecked = OrganizerItems.empty();
  OrganizerItems<T> allItemsChecked = OrganizerItems.empty();
  OrganizerItems<T> allItemsUnchecked = OrganizerItems.empty();
  late OrganizerLinkBloc<T> selectedItemsBloc;
  late TagCubit itemCubit;

  @override
  void initState() {
    super.initState();
    _initializeDataWithErrorHandling();
  }

  Future<void> _initializeDataWithErrorHandling() async {
    selectedItemsBloc = context.read<OrganizerLinkBloc<T>>();
    itemCubit = context.read<TagCubit>();
    selectedItemsChecked = widget.initSelectedItems as OrganizerItems<T>;

    try {
      final tagsState = itemCubit.state;
      if (tagsState.status != OrganizerCubitStatus.loaded) {
        await itemCubit.getEntitiesFromUser(widget.params.forUserId);
      }
      final cubitStateEntities = itemCubit.state.entities as OrganizerItems<T>;

      setState(() {
        allItemsUnchecked = cubitStateEntities.copyWithRemoveItemsWithSameId(selectedItemsChecked);
      });
    } catch (error) {
      _showErrorDialog(context, "Failed to initialize data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenEditTitle,
      body: _buildUncheckedListView(),
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

  Widget _buildUncheckedListView() {
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
}
