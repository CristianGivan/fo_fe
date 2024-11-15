import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../organizer/items/user/utils/user_exports.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  void _checkAutoLogin(BuildContext context) async {
    final authBloc = context.read<AuthenticationSignBloc>();
    authBloc.add(AuthSignInAutoBlocEvent());

    authBloc.stream.listen((state) {
      if (state is AuthSignInAutoSuccessBlocState) {
        context.pushNamed(OrganizerRouterNames.organizerRouteName);
      } else if (state is AuthSignErrorBlocState) {
        // Handle the error case or show an error message if necessary
        print('Error: ${state.message}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AuthenticationRouterNames.authenticationSignInRouteName);
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AuthenticationRouterNames.authenticationSignUpRouteName,
                    extra: addUserActionMapToString[AddUserActionEnum.SignUp]);
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _checkAutoLogin(context);
              },
              child: const Text('Reactivation'),
            ),
          ],
        ),
      ),
    );
  }
}
