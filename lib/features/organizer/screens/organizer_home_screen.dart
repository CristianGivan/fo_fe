import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/screens/organizer_screen.dart';

class OrganizerHome extends StatelessWidget {
  const OrganizerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Organizer'),
        ),
        body: Organizer()
        // BlocBuilder<AuthenticationBloc, AuthenticationState>(
        //     builder: (context, state) {
        //   if (state.status == AuthenticationStatus.authenticated) {
        //     return BlocProvider(
        //       create: (context) => SignInBloc(
        //           userRepository:
        //               context.read<AuthenticationBloc>().userRepository),
        //       child: const Organizer(),
        //     );
        //   } else {
        //     return const AuthenticationScreen();
        //   }
        // })
        );
  }
}
