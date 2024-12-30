import '../../../features/organizer/utils/organizer_exports.dart';

class ItemDtoListViewPage<T extends ItemEntity> extends StatelessWidget {
  final OrganizerItems<ItemEntity> itemDtoList;
  final Widget Function(T) itemCardBuilder;
  final bool Function(T) getValue;
  final void Function(BuildContext, T, bool) updateItemUserLink;

  const ItemDtoListViewPage({
    super.key,
    required this.itemDtoList,
    required this.itemCardBuilder,
    required this.getValue,
    required this.updateItemUserLink,
  });

  @override
  Widget build(BuildContext context) {
    if (itemDtoList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ListView.builder(
        itemCount: itemDtoList.size(),
        itemBuilder: (context, index) => _buildCheckboxListTitle(itemDtoList, index, context),
      );
    }
  }

  Widget _buildCheckboxListTitle(
      OrganizerItems<ItemEntity> itemDtoList, int index, BuildContext context) {
    final itemDto = itemDtoList.getAt(index) as T;
    return CheckboxListTile(
      title: itemCardBuilder(itemDto),
      value: getValue(itemDto),
      onChanged: (bool? value) {
        updateItemUserLink(context, itemDto, value!);
      },
    );
  }
}
