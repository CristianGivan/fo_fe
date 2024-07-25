import 'package:flutter/material.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/config/organizer_exports.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Import Provider package if not already imported

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  void _checkAutoLogin(BuildContext context) async {
    // Check auto-login when the button is pressed
    final authBloc = context.read<AuthenticationBlocSession>();
    authBloc.add(AutoLoginBlocEvent());

    // Handle navigation based on authentication state
    authBloc.stream.listen((state) {
      if (state is AuthenticationSessionAuthenticated) {
        context.goNamed(OrganizerRouterNames.organizerRoute);
      } else if (state is AuthenticationSessionError) {
        // Handle the error case or show an error message if necessary
        print('Error: ${state.message}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                context.goNamed(AuthenticationRouterNames.signInRoute);
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AuthenticationRouterNames.signUpRoute);
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
