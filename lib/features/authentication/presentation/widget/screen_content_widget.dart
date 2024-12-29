import 'package:fo_fe/features/app_home/presentation/pages/app_body_page.dart';
import 'package:fo_fe/features/app_home/presentation/pages/app_bottom_bar_same_menu.dart';
import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ScreenContentWidget extends StatelessWidget {
  final int userId;
  final String appBarTitle;
  final dynamic body;
  final List<PopupMenuEntry> Function(BuildContext context, int userId) menuOptions;
  final VoidCallback onSearchSubmitted;

  const ScreenContentWidget({
    super.key,
    required this.userId,
    required this.appBarTitle,
    required this.body,
    required this.menuOptions,
    required this.onSearchSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenBarPage(title: appBarTitle),
      body: ScreenBodyPage(body: body, context: context, userId: userId),
      bottomNavigationBar: ScreenBottomBarSameMenu(
        menuOptions: menuOptions(context, userId),
        onSearchSubmitted: onSearchSubmitted,
      ),
    );
  }
}
