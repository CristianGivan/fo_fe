// lib/features/organizer/items/tag/presentation/screen/tag_add_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/bloc/tag_bloc.dart';

class TagAddScreen extends StatefulWidget {
  const TagAddScreen({super.key});

  @override
  _TagAddScreenState createState() => _TagAddScreenState();
}

class _TagAddScreenState extends State<TagAddScreen> {
  final TextEditingController _tagNameController = TextEditingController();

  @override
  void dispose() {
    _tagNameController.dispose();
    super.dispose();
  }

  void _saveTag(BuildContext context) {
    final String tagName = _tagNameController.text;
    if (tagName.isNotEmpty) {
      final tag = TagEntity(subject: tagName);
      BlocProvider.of<TagBlocTag>(context).add(AddTagBlocEvent(tag));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Tag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tagNameController,
              decoration: const InputDecoration(
                labelText: 'Tag Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            BlocConsumer<TagBlocTag, TagBlocState>(
              listener: (context, state) {
                if (state is TagSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tag saved successfully')),
                  );
                } else if (state is TagError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is TagLoading) {
                  return CircularProgressIndicator();
                }
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _saveTag(context),
                    child: const Text('Save Tag'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
