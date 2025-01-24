import 'dart:async';

import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/update_items_of_item_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';

import '../../../utils/organizer_exports.dart';

class ItemLinkItemsUpdatePage<T extends ItemEntity> extends StatefulWidget {
  final ItemLinkParams params;
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
  late OrganizerCubit<T> itemCubit;

  @override
  void initState() {
    super.initState();
    _initializeDataWithErrorHandling();
  }

  Future<void> _initializeDataWithErrorHandling() async {
    selectedItemsBloc = context.read<OrganizerLinkBloc<T>>();
    selectedItemsChecked = widget.initSelectedItems as OrganizerItems<T>;

    itemCubit = context.read<OrganizerCubit<T>>();
    itemCubit.getEntitiesFromUser(widget.params.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrganizerCubit<T>, OrganizerCubitState<T>>(
      listener: (context, state) {
        if (state.status == OrganizerCubitStatus.loaded) {
          _updateAllItems(state.entities as OrganizerItems<T>);
        }
      },
      child: AppContentScreen(
        appBarTitle: TaskStrings().screenEditTitle,
        body: _buildUncheckedListView(),
        menuOptions: (context, userId) => _getMenuItems(context),
        onSearchSubmitted: () {},
      ),
    );
  }

  List<PopupMenuEntry> _getMenuItems(BuildContext context) {
    final updatedItems = UpdateLinkParams<T>(
      itemLinkParams: widget.params,
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
    if (items.isEmpty) {
      _buildLoading();
    }
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

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

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

  void _updateAllItems(OrganizerItems<T> items) {
    setState(() {
      allItemsChecked = OrganizerItems.empty();
      allItemsUnchecked = items.copyWithRemoveItemsWithSameId(selectedItemsChecked);
    });
  }
}
