import 'package:fo_fe/features/organizer/presentation/pages/item_list_link_page.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/items_type.dart';
import 'package:fo_fe/features/organizer/utils/other/items_type_selection.dart';

class ItemWithItemsPage<T extends OrganizerItemEntity, E extends OrganizerItemEntity>
    extends StatelessWidget {
  final OrganizerItems<E> items;
  final T item;
  final ItemsTypeEnum type;

  const ItemWithItemsPage({
    super.key,
    required this.items,
    required this.item,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final itemsType = ItemsTypeSelection.getItemType(type);
    return Column(
      children: [
        if (items.isEmpty)
          Center(child: Text('No ${itemsType.type} Available'))
        else
          ItemListLinkPage<E>(
              items: items,
              //todo -t- to be updated with another widget
              itemTextBuilder: itemsType.itemTextBuilder),
        ElevatedButton(
          onPressed: () => _handleUpdateUserItems(context, itemsType),
          child: Text('Update ${itemsType.type}'),
        ),
      ],
    );
  }

  Future<void> _handleUpdateUserItems(BuildContext context, ItemsType itemsType) async {
    final navigator = NavigatorFactory.getNavigator<E>(
      routeName: itemsType.routeName,
    );
    await navigator.navigateAndUpdateItems(
      context,
      item.id,
      items,
    );
  }
}
