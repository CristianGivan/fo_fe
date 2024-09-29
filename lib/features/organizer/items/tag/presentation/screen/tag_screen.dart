import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/pages/tag_list_page.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/pages/tag_management_actions_page.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';

class TagScreen extends StatefulWidget {
  final OrganizerItems<TagEntity> tagItems;

  const TagScreen({super.key, required this.tagItems});

  @override
  _TagScreenState createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  late OrganizerItems<TagEntity> selectedTagItems;

  @override
  void initState() {
    super.initState();
    selectedTagItems = widget.tagItems;
  }

  @override
  Widget build(BuildContext context) {
    _loadTags(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Tag Management')),
      body: Column(
        children: [
          const Center(child: Text('All Tags:')),
          _buildTagList(context),
          _buildTagManagementActions(),
        ],
      ),
    );
  }

  void _loadTags(BuildContext context) {
    context.read<TagBlocTag>().add(GetTagItemsAllBlocEvent());
  }

  Widget _buildTagList(BuildContext context) {
    return Expanded(
      child: TagListPage(
        onSelectTag: (tag) {
          setState(() {
            var builder = selectedTagItems.toBuilder();
            builder.contains(tag) ? builder.remove(tag) : builder.add(tag);
            selectedTagItems = builder.build();
          });
        },
        selectedTags: selectedTagItems,
      ),
    );
  }

  Widget _buildTagManagementActions() {
    return TagManagementActionsPage(selectedTags: selectedTagItems);
  }
}
