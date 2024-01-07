import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HiScreen extends StatelessWidget {
   const HiScreen(this._displayName, {super.key});
    final String _displayName;

  @override
  Widget build(BuildContext context) {
    // final duration =
    // context.select((AuthenticationBloc bloc) => bloc.state.user.displayName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, you are In !'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
              },
              icon: const Icon(Icons.login))
        ],
      ),
      body: Text(_displayName),
    );
  }
}
