import '../../../features/organizer/utils/organizer_exports.dart';

class LinkItemListViewPage<T extends ItemEntity> extends StatelessWidget {
  final OrganizerItems<T> itemList;
  final Widget Function(T) itemCardBuilder;

  const LinkItemListViewPage({
    super.key,
    required this.itemList,
    required this.itemCardBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ListView.builder(
        itemCount: itemList.size(),
        itemBuilder: (context, index) => _buildListTitle(index, context),
      );
    }
  }

//todo -refactor- it will be changed to a smaller list
  Widget _buildListTitle(int index, BuildContext context) {
    final item = itemList.getAt(index);
    return ListTile(
        // title: item.subject,
        );
    // return CheckboxListTile(
    //   title: itemCardBuilder(itemDto),
    //   value: getValue(itemDto),
    //   onChanged: (bool? value) {
    //     updateItemUserLink(context, itemDto, value!);
    //   },
    // );
  }
}
