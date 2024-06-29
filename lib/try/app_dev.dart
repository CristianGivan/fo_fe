import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:fo_fe/injection_container.dart';
import 'package:fo_fe/try/UI/task_page.dart';

class AppDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<TaskBloc>()..add(LoadTaskItemsAllBlocEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Task Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskPage(),
      ),
    );
  }
}
