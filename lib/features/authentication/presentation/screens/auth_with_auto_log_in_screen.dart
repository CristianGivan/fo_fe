import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AuthScreenWithAutoLogIn extends StatefulWidget {
  const AuthScreenWithAutoLogIn({super.key});

  @override
  _AuthScreenWithAutoLogInState createState() => _AuthScreenWithAutoLogInState();
}

class _AuthScreenWithAutoLogInState extends State<AuthScreenWithAutoLogIn> {
  @override
  void initState() {
    super.initState();
    _checkAutoLogin();
  }

  void _checkAutoLogin() async {
    // Check auto-login when the screen is initialized
    final authBloc = context.read<AuthLogBloc>();
    authBloc.add(AuthLogInAutoBlocEvent());

    // Handle navigation based on auth state
    authBloc.stream.listen((state) {
      if (state is AuthAuthenticatedBlocState) {
        context.pushNamed(OrganizerRouterNames.organizerRouteName);
      } else if (state is AuthLogErrorBlocState) {
        final snackBar = SnackBar(
          content: Text('Error: ${state.errorMessage}'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                context.pushNamed(AuthRouterNames.authSignInRouteName);
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AuthRouterNames.authSignUpRouteName);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
