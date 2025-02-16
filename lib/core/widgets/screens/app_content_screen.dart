import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AppContentScreen extends StatelessWidget {
  final void Function(BuildContext context, int userId)? fetchItemsForLoggedInUser;
  final String appBarTitle;
  final dynamic body;
  final List<PopupMenuEntry> Function(BuildContext context, int userId) menuOptions;
  final void Function(String query) onSearchSubmitted;

  const AppContentScreen({
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
            appBar: AppBarPage(title: appBarTitle),
            body: AppBodyPage(body: body, context: context, userId: userId),
            bottomNavigationBar: ScreenBottomBarSameMenu(
              menuOptions: menuOptions(context, userId),
              onSearchSubmitted: onSearchSubmitted,
            ),
          );
        } else {
          return DialogManager.showNotAuthenticatedDialog(context);
        }
      },
    );
  }
}
