import 'package:authentication/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/features/tasks/tasks.dart';
import 'core/db/objectbox/objectbox.dart';
import 'functions/firebase_options.dart';
import 'functions/simple_bloc_observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_view.dart';


late ObjectBox objectbox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();

  objectbox = await ObjectBox.create();
  runApp(AppMain(FirebaseUserRepository()));
}


class AppMain extends StatelessWidget {
  final UserRepository userRepository;

  const AppMain(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: const TasksHome(),
    );
  }
}
