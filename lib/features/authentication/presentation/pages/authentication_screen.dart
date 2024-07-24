import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/authentication/util/router/authentication_router_names.dart';
import 'package:fo_fe/features/organizer/organizer.dart';
import 'package:go_router/go_router.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
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
          ],
        ),
      ),
    );
  }
}
