import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

class TagListLinkPage extends StatelessWidget {
  final OrganizerItems<TagEntity> tags;

  const TagListLinkPage({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: tags.size(),
          itemBuilder: (context, index) {
            final tag = tags.getAt(index);
            return ListTile(
              title: Text(tag.subject),
            );
          },
        ),
        ElevatedButton(
          onPressed: () => _handleAddTag(context),
          child: const Text('Add'),
        ),
      ],
    );
  }

  Future<void> _handleAddTag(BuildContext context) async {
    // Handle the button press logic here
  }
}
