import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/pages/tag_list_page.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/widgets/tag_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_strings.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      fetchItemsForLoggedInUser: _getTagItemsFromLoggedInUser,
      appBarTitle: TagStrings().screenTitle,
      body: TagListPage(),
      menuOptions: (context, userId) => TagScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {},
    );
  }

  void _getTagItemsFromLoggedInUser(BuildContext context, int userId) {
    context
        .read<TagBloc>()
        .add(GetItemsFromLogInUserBlocEvent(TagParams(id: 0, forUserId: userId)));
  }
}
