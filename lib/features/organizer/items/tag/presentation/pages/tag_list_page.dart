import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';

class TagListPage extends StatelessWidget {
  final Function(TagEntity) onSelectTag;
  OrganizerItems<TagEntity> selectedTags;

  TagListPage({
    super.key,
    required this.onSelectTag,
    required this.selectedTags,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagBlocTag, TagBlocState>(
      builder: (context, state) {
        if (state is TagLoading) {
          return _buildLoading();
        } else if (state is TagItemsLoadedBlocState) {
          return _buildTagList(state);
        } else if (state is TagError) {
          return _buildError(state);
        } else {
          return _buildNoTags();
        }
      },
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildTagList(TagItemsLoadedBlocState state) {
    return ListView.builder(
      itemCount: state.tagItems.size(),
      itemBuilder: (context, index) {
        final tag = state.tagItems.getAt(index);
        final isSelected = selectedTags.contains(tag);
        return ListTile(
          title: Text(tag.subject),
          trailing: Icon(
              isSelected ? Icons.check_box : Icons.check_box_outline_blank),
          onTap: () => onSelectTag(tag),
        );
      },
    );
  }

  Widget _buildError(TagError state) {
    return Center(child: Text(state.message));
  }

  Widget _buildNoTags() {
    return const Center(child: Text('No Tags Available'));
  }
}
