import 'dart:async';

import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item/item_card.dart';

import '../../../utils/organizer_exports.dart';

class ItemLinkEntitiesUpdatePage<T extends ItemEntity> extends StatefulWidget {
  final ItemLinkParams itemLinkParams;
  final OrganizerItems<T> initSelectedItems;

  const ItemLinkEntitiesUpdatePage(
      {super.key, required this.itemLinkParams, required this.initSelectedItems});

  @override
  _ItemLinkEntitiesUpdatePageState createState() => _ItemLinkEntitiesUpdatePageState<T>();
}

class _ItemLinkEntitiesUpdatePageState<T extends ItemEntity>
    extends State<ItemLinkEntitiesUpdatePage> {
  OrganizerItems<T> selectedItemsChecked = OrganizerItems.empty();
  OrganizerItems<T> selectedItemsUnchecked = OrganizerItems.empty();
  OrganizerItems<T> allItemsChecked = OrganizerItems.empty();
  OrganizerItems<T> allItemsUnchecked = OrganizerItems.empty();
  late OrganizerLinkBloc<T> selectedItemsBloc;
  late OrganizerCubit<T> itemCubit;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    selectedItemsBloc = context.read<OrganizerLinkBloc<T>>();
    selectedItemsChecked = widget.initSelectedItems as OrganizerItems<T>;

    itemCubit = context.read<OrganizerCubit<T>>();
    itemCubit.getAllEntitiesFromUser(widget.itemLinkParams.userId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrganizerCubit<T>, OrganizerCubitState<T>>(
          listener: (context, state) {
            if (state.status == OrganizerCubitStatus.loaded) {
              _updateAllItems(state.entities as OrganizerItems<T>);
            }
          },
        ),
        BlocListener<OrganizerLinkBloc<T>, OrganizerBlocState<T>>(
          listener: (context, state) {
            // Handle OrganizerLinkBloc state changes here
            if (state.status == OrganizerBlocStatus.loaded) {
              _updateSelectedItems(state.displayedItems);
            }
          },
        ),
      ],
      child: AppContentScreen(
        appBarTitle: TaskStrings().screenEditTitle,
        body: _buildUncheckedListView(),
        menuOptions: (context, userId) => _getMenuItems(context),
        onSearchSubmitted: () {},
      ),
    );
  }

  void _updateSelectedItems(OrganizerItems<T> items) {
    setState(() {
      selectedItemsChecked = items.copyWithRemovedItems(selectedItemsUnchecked);
    });
  }

  void _updateAllItems(OrganizerItems<T> items) {
    setState(() {
      allItemsChecked = OrganizerItems.empty();
      allItemsUnchecked = items.copyWithRemoveItemsWithSameId(selectedItemsChecked);
    });
  }

  List<PopupMenuEntry> _getMenuItems(BuildContext context) {
    ItemLinkParams itemLinkParams =
        widget.itemLinkParams.copyWith(organizerLinkBloc: selectedItemsBloc);
    final updatedItems = UpdateLinkParams<T>(
      itemLinkParams: itemLinkParams,
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
        child: ItemListViewPage<T>(
            items: items,
            itemCardBuilder: (item) => ItemCard<T>(item),
            value: (item) => isChecked,
            onChange: (context, item, value) => _onItemCheckedChanged(item, value, isAllItems)));
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
