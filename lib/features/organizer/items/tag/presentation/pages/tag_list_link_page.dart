// lib/features/organizer/items/tag/presentation/pages/tag_list_link_page.dart
import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';

class TagListLinkPage extends StatelessWidget {
  final OrganizerItems<TagEntity> tagItems;

  const TagListLinkPage({super.key, required this.tagItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tagItems.size(),
      itemBuilder: (context, index) {
        final tag = tagItems.getAt(index);
        return ListTile(
          title: Text(tag.subject),
        );
      },
    );
  }
}
