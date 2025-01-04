import '../../../features/organizer/utils/organizer_exports.dart';

class LinkItemListEditPage<T extends ItemEntity> extends StatelessWidget {
  final OrganizerItems<T> itemList;
  final Widget Function(T) itemCardBuilder;
  final bool Function(T) getValue;
  final void Function(BuildContext, T, bool) updateItemUserLink;

  const LinkItemListEditPage({
    super.key,
    required this.itemList,
    required this.itemCardBuilder,
    required this.getValue,
    required this.updateItemUserLink,
  });

  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ListView.builder(
        itemCount: itemList.size(),
        itemBuilder: (context, index) => _buildCheckboxListTitle(itemList, index, context),
      );
    }
  }

//todo -refactor- it will be changed to a smaller list
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
