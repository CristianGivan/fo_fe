import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/pages/tag_card_page.dart';

class TagListPage extends StatelessWidget {
  const TagListPage({super.key});

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
              return TagCardPage(
                tag: tag,
                onUpdateTag: (updatedTag) {
                  context
                      .read<TagBlocTag>()
                      .add(UpdateTagBlocEvent(updatedTag));
                },
                onViewTag: () {
                  // Navigate to view Tag details
                },
                onEditTag: () {
                  // Navigate to edit Tag page
                },
                onDeleteTag: (tag) {
                  context.read<TagBlocTag>().add(DeleteTagBlocEvent(tag.id));
                },
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
