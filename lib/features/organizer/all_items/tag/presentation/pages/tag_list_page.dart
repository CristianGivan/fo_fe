import 'package:fo_fe/features/organizer/presentation/pages/item/item_list_view_page.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/organizer_items_transform.dart';

class TagListPage extends StatelessWidget {
  const TagListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagBloc, OrganizerBlocState>(builder: (context, state) {
      return buildBlocStateWidget(
        state: state,
        buildErrorState: _buildErrorState,
        buildLoadingState: _buildLoadingState,
        buildLoadedState: () => _buildTagListDto(context, state.displayedItems),
      );
    });
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildTagListDto(BuildContext context, OrganizerItems<ItemEntity> itemList) {
    final tagDtoList = itemList.convertTo<TagDto>();
    if (tagDtoList.isEmpty) {
      return Center(child: Text('No items to display'));
    } else {
      return ItemListViewPage<TagDto>(
        itemsDto: tagDtoList,
        itemCardBuilder: (tag) => Placeholder(),
        value: _isSelected,
        onChange: _updateTagUserLink,
      );
    }
  }

  bool _isSelected(TagDto tag) {
    return tag.tagUserLink.isSelectedByUser;
  }

  void _updateTagUserLink(BuildContext context, TagDto tag, bool value) {
    final updatedTagUserLink = tag.tagUserLink.copyWith(isSelectedByUser: value);
    context.read<TagBloc>().add(UpdateTagBlocEvent(TagParams(
          id: tag.id,
          tag: tag,
          tagUserLinkEntity: updatedTagUserLink,
        )));
  }
}
