import 'package:fo_fe/features/authentication/utils/auth_exports.dart';

import '../../../../core/utils/exports/external_exports.dart';

class AuthenticatedContentWidget extends StatelessWidget {
  // todo -learn- why is  Function
  final Widget Function(AuthAuthenticatedBlocState, BuildContext) contentBuilder;

  const AuthenticatedContentWidget({super.key, required this.contentBuilder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthLogBloc, AuthLogBlocState>(
      builder: (context, state) {
        if (state is AuthAuthenticatedBlocState) {
          return contentBuilder(state, context);
        } else {
          return _showNotAuthenticatedDialog(context);
        }
      },
    );
  }

  Widget _showNotAuthenticatedDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Not Authenticated'),
      content: Text('Please log in to continue.'),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
