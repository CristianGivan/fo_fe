import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AuthenticationScreenWithAutoLogIn extends StatefulWidget {
  const AuthenticationScreenWithAutoLogIn({super.key});

  @override
  _AuthenticationScreenWithAutoLogInState createState() =>
      _AuthenticationScreenWithAutoLogInState();
}

class _AuthenticationScreenWithAutoLogInState extends State<AuthenticationScreenWithAutoLogIn> {
  @override
  void initState() {
    super.initState();
    _checkAutoLogin();
  }

  void _checkAutoLogin() async {
    // Check auto-login when the screen is initialized
    final authBloc = context.read<AuthenticationBlocSession>();
    authBloc.add(AutoLoginBlocEvent());

    // Handle navigation based on authentication state
    authBloc.stream.listen((state) {
      if (state is AuthenticationSessionAuthenticated) {
        context.goNamed(OrganizerRouterNames.organizerRouteName);
      } else if (state is AuthenticationSessionError) {
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
                context.goNamed(AuthenticationRouterNames.authenticationSignInRouteName);
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AuthenticationRouterNames.authenticationSignUpRouteName);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
