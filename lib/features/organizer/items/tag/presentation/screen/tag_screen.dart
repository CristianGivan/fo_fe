import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/pages/tag_list_page.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/pages/tag_management_actions_page.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({super.key});

  @override
  _TagScreenState createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  final List<TagEntity> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    context.read<TagBlocTag>().add(GetTagItemsAllBlocEvent());

    return Scaffold(
      appBar: AppBar(title: const Text('Tag Management')),
      body: Column(
        children: [
          const Center(child: Text('All Tags:')),
          Expanded(
            child: TagListPage(
              onSelectTag: (tag) {
                setState(() {
                  if (selectedTags.contains(tag)) {
                    selectedTags.remove(tag);
                  } else {
                    selectedTags.add(tag);
                  }
                });
              },
              selectedTags: selectedTags,
            ),
          ),
          TagManagementActionsPage(selectedTags: selectedTags),
        ],
      ),
    );
  }
}
