import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:fo_fe/try/UI/task_screen.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
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
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
