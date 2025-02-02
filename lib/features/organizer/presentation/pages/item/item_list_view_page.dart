import '../../../utils/organizer_exports.dart';

class ItemListViewPage<T extends ItemEntity> extends StatelessWidget {
  final OrganizerItems<T> items;
  final Widget Function(T) itemCardBuilder;
  final bool Function(T) value;
  final void Function(BuildContext, T, bool) onChange;

  const ItemListViewPage({
    super.key,
    required this.items,
    required this.itemCardBuilder,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ListView.builder(
        itemCount: items.size(),
        itemBuilder: (context, index) => _buildCheckboxListTitle(context, index),
      );
    }
  }

  Widget _buildCheckboxListTitle(BuildContext context, int index) {
    final item = items.getAt(index);
    return CheckboxListTile(
      title: itemCardBuilder(item),
      value: value(item),
      onChanged: (bool? value) {
        onChange(context, item, value!);
      },
    );
  }
}
