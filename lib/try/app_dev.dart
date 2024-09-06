import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBlocTask>(
          create: (_) => GetIt.instance<TaskBlocTask>(),
        ),
        BlocProvider<TaskBlocUser>(
          create: (_) => GetIt.instance<TaskBlocUser>(),
        ),
        BlocProvider<TaskBlocTag>(
          create: (_) => GetIt.instance<TaskBlocTag>(),
        ),
        BlocProvider<TaskBlocReminder>(
          create: (_) => GetIt.instance<TaskBlocReminder>(),
        ),
      ],
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
