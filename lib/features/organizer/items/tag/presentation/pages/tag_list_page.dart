import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';

class TagListPage extends StatelessWidget {
  final Function(TagEntity) onSelectTag;
  final List<TagEntity> selectedTags;

  const TagListPage({
    super.key,
    required this.onSelectTag,
    required this.selectedTags,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagBlocTag, TagBlocState>(
      builder: (context, state) {
        if (state is TagLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TagLoaded) {
          return ListView.builder(
            itemCount: state.tags.size(),
            itemBuilder: (context, index) {
              final tag = state.tags.getAt(index);
              final isSelected = selectedTags.contains(tag);
              return ListTile(
                title: Text(tag.subject),
                trailing: isSelected
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
                onTap: () => onSelectTag(tag),
              );
            },
          );
        } else if (state is TagError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Tags Available'));
        }
      },
    );
  }
}
