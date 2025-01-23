import '../../../../features/organizer/utils/organizer_exports.dart';

class ItemListViewPage<T extends DtoEntity> extends StatelessWidget {
  final OrganizerItems<T> itemsDto;
  final Widget Function(T) itemCardBuilder;
  final bool Function(T) value;
  final void Function(BuildContext, T, bool) onChange;

  const ItemListViewPage({
    super.key,
    required this.itemsDto,
    required this.itemCardBuilder,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    if (itemsDto.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ListView.builder(
        itemCount: itemsDto.size(),
        itemBuilder: (context, index) => _buildCheckboxListTitle(context, index),
      );
    }
  }

  Widget _buildCheckboxListTitle(BuildContext context, int index) {
    final itemDto = itemsDto.getAt(index);
    return CheckboxListTile(
      title: itemCardBuilder(itemDto),
      value: value(itemDto),
      onChanged: (bool? value) {
        onChange(context, itemDto, value!);
      },
    );
  }
}
