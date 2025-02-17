import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  void _checkAutoLogin(BuildContext context) async {
    final authBloc = context.read<AuthLogBloc>();
    authBloc.add(AuthLogInAutoBlocEvent());

    authBloc.stream.listen((state) {
      if (state is AuthAuthenticatedBlocState) {
        context.pushNamed(AuthRouterNames.authWithAutoLogInRouteName);
      } else if (state is AuthLogFailedBlocState) {
        Center(
          child: ElevatedButton(
            onPressed: () {
              context.pushNamed(AuthRouterNames.authSignInRouteName);
            },
            child: const Text('Please sign in'),
          ),
        );
      } else if (state is AuthLogErrorBlocState) {
        Center(
          child: Text('Error: ${state.errorMessage}'),
        );
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
