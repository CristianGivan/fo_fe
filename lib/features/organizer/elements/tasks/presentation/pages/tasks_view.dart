import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

import '../../../../../../injection_container.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks View'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<TaskBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TaskBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Placeholder(),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Placeholder(fallbackHeight: 40)),
                      SizedBox(width: 20),
                      Expanded(child: Placeholder(fallbackHeight: 40))
                    ],
                  ),
                  SizedBox(height: 20),
                  Placeholder(fallbackHeight: 40),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
