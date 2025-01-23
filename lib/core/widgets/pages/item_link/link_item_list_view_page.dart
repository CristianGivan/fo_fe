import '../../../../features/organizer/utils/organizer_exports.dart';

class LinkItemListViewPage<T extends ItemEntity> extends StatelessWidget {
  final OrganizerItems<T> itemList;

  const LinkItemListViewPage({
    super.key,
    required this.itemList,
  });

  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return SingleChildScrollView(
        child: Column(
          children:
              itemList.map((item) => _buildListTitle(itemList.indexOf(item), context)).toList(),
        ),
      );
    }
  }

  Widget _buildListTitle(int index, BuildContext context) {
    final item = itemList.getAt(index);
    return Center(child: Text(item.subject));
  }
}
