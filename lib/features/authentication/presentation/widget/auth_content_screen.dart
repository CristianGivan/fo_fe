import 'package:fo_fe/features/app_home/presentation/pages/app_body_page.dart';
import 'package:fo_fe/features/app_home/presentation/pages/app_bottom_bar_same_menu.dart';
import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AuthContentScreen extends StatelessWidget {
  final void Function(BuildContext context, int userId)? fetchItemsForLoggedInUser;
  final String appBarTitle;
  final dynamic body;
  final List<PopupMenuEntry> Function(BuildContext context, int userId) menuOptions;
  final VoidCallback onSearchSubmitted;

  const AuthContentScreen({
    super.key,
    this.fetchItemsForLoggedInUser,
    required this.appBarTitle,
    required this.body,
    required this.menuOptions,
    required this.onSearchSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthLogBloc, AuthLogBlocState>(
      builder: (context, state) {
        if (state is AuthAuthenticatedBlocState) {
          final userId = state.userEntity.id;
          fetchItemsForLoggedInUser?.call(context, userId);
          return Scaffold(
            appBar: ScreenBarPage(title: appBarTitle),
            body: ScreenBodyPage(body: body, context: context, userId: userId),
            bottomNavigationBar: ScreenBottomBarSameMenu(
              menuOptions: menuOptions(context, userId),
              onSearchSubmitted: onSearchSubmitted,
            ),
          );
        } else {
          return _showNotAuthenticatedDialog(context);
        }
      },
    );
  }

  Widget _showNotAuthenticatedDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Not Authenticated'),
      content: const Text('Please log in to continue.'),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            context.pushNamed(AuthRouterNames.authRouteName);
          },
        ),
      ],
    );
  }
}
