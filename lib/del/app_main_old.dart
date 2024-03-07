import 'package:authentication/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_view.dart';

class AppMainOld extends StatelessWidget {
  final UserRepository userRepository;

  const AppMainOld(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: const AppView(),
    );
  }
}
