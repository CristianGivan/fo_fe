import '../../../features/organizer/utils/organizer_exports.dart';

class LinkItemListEditPage<T extends ItemEntity> extends StatefulWidget {
  final ItemsTypeEnum itemsType;

  const LinkItemListEditPage({
    super.key,
    required this.itemsType,
  });

  @override
  _LinkItemListEditPageState<T> createState() => _LinkItemListEditPageState<T>();
}

class _LinkItemListEditPageState<T extends ItemEntity> extends State<LinkItemListEditPage<T>> {
  late OrganizerItems<T> allItems;
  late OrganizerItems<T> selectedItems;

  @override
  void initState() {
    super.initState();
    allItems = _getAllItems(widget.itemsType);
    selectedItems = _getSelectedItems(widget.itemsType);
  }

  OrganizerItems<T> _getAllItems(ItemsTypeEnum itemsType) {
    final OrganizerItems<T> allItems;
    allItems = OrganizerItems.empty();
    // Add logic to populate allItems based on itemsType
    return allItems;
  }

  OrganizerItems<T> _getSelectedItems(ItemsTypeEnum itemsType) {
    final OrganizerItems<T> selectedItems;
    selectedItems = OrganizerItems.empty();
    // Add logic to populate selectedItems based on itemsType
    return selectedItems;
  }

  void _updateItems() {
    setState(() {
      allItems = _getAllItems(widget.itemsType);
      selectedItems = _getSelectedItems(widget.itemsType);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (allItems.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allItems.size(),
              itemBuilder: (context, index) => _buildCheckboxListTitle(context, index),
            ),
          ),
          ElevatedButton(
            onPressed: _updateItems,
            child: Text('Update Items'),
          ),
        ],
      );
    }
  }

  Widget _buildCheckboxListTitle(BuildContext context, int index) {
    final item = allItems.getAt(index);
    return CheckboxListTile(
      title: Text(item.toString()),
      value: _isSelected(item),
      onChanged: (bool? value) => setState(() {
        _updateState(context, item, value!);
      }),
    );
  }

  bool _isSelected(T item) => selectedItems.contains(item);
  
 void _updateState(BuildContext context, T item, bool isSelected) {
    setState(() {
        if (isSelected) {
          selectedItems = selectedItems.copyWithAddedItem(item);
        } else {
          selectedItems = selectedItems.copyWithRemovedItem(item);
        }
      });
  }
}