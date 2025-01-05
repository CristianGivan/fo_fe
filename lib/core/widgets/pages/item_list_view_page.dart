import '../../../features/organizer/utils/organizer_exports.dart';

class ItemListViewPage<T extends ItemEntity> extends StatelessWidget {
  final OrganizerItems<T> itemDtoList;
  final Widget Function(T) itemCardBuilder;
  final bool Function(T) value;
  final void Function(BuildContext, T, bool) updateItemUserLink;

  const ItemListViewPage({
    super.key,
    required this.itemDtoList,
    required this.itemCardBuilder,
    required this.value,
    required this.updateItemUserLink,
  });

  @override
  Widget build(BuildContext context) {
    if (itemDtoList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ListView.builder(
        itemCount: itemDtoList.size(),
        itemBuilder: (context, index) => _buildCheckboxListTitle(context, index),
      );
    }
  }

  Widget _buildCheckboxListTitle(BuildContext context, int index) {
    final itemDto = itemDtoList.getAt(index);
    return CheckboxListTile(
      title: itemCardBuilder(itemDto),
      value: value(itemDto),
      onChanged: (bool? value) {
        updateItemUserLink(context, itemDto, value!);
      },
    );
  }
}
