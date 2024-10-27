// lib/features/organizer/items/common/presentation/pages/item_list_link_page.dart
import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

// Ensure T extends OrganizerItemEntity
class ItemListLinkPage<T extends OrganizerItemEntity> extends StatelessWidget {
  final OrganizerItems<T> items;
  final String Function(T) itemTextBuilder; // Function to extract display text

  const ItemListLinkPage({
    super.key,
    required this.items,
    required this.itemTextBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.size(),
      itemBuilder: (context, index) {
        final item = items.getAt(index);
        return ListTile(
          title: Text(itemTextBuilder(item)),
        );
      },
    );
  }
}
