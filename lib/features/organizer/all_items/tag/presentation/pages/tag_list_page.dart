import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagListPage extends StatelessWidget {
  final Function(TagEntity) onSelectTag;
  final OrganizerItems<TagEntity> selectedTags;

  TagListPage({
    Key? key,
    required this.onSelectTag,
    required this.selectedTags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagBlocTag, TagBlocState>(
      builder: (context, state) {
        if (state is TagLoadingBlocState) {
          return _buildLoadingIndicator();
        } else if (state is TagItemsLoadedBlocState) {
          return _buildTagList(state);
        } else if (state is TagErrorBlocState) {
          return _buildErrorMessage(state);
        } else {
          return _buildNoTagsMessage();
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
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
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onTap: () => onSelectTag(tag),
        );
      },
    );
  }

  Widget _buildErrorMessage(TagErrorBlocState state) {
    return Center(child: Text(state.message));
  }

  Widget _buildNoTagsMessage() {
    return const Center(child: Text('No Tags Available'));
  }
}
