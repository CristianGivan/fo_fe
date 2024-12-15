import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/app_home/presentation/pages/app_bottom_bar_same_menu.dart';
import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class AuthenticatedContentWidget extends StatelessWidget {
  final String appBarTitle;
  final Widget Function(BuildContext context, int userId) body;
  final List<PopupMenuEntry> Function(BuildContext context, int userId) menuOptions;
  final VoidCallback onSearchSubmitted;

  const AuthenticatedContentWidget({
    super.key,
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
          context.read<TaskBloc>().add(GetTaskItemsFromLogInUserBlocEvent(userId));
          return Scaffold(
            appBar: AppBarPage(title: appBarTitle),
            body: body(context, userId),
            bottomNavigationBar: AppBottomBarSameMenu(
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
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
