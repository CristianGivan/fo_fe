import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

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
              BlocBuilder<TaskBloc, TaskBlocState>(
                builder: (context, state) {
                  if (state is TaskErrorState) {
                    return const taskInit(text: "initializing task");
                  } else if (state is TaskLoadedState) {
                    return const taskInit(text: "Loading task");
                  } else if (state is TaskLoadedState) {
                    return taskText(taskEntity: state.taskEntity);
                  } else if (state is TaskErrorState) {
                    return taskInit(text: state.message);
                  } else {
                    return const taskInit(text: "something went wrong");
                  }

                  // switch (state.runtimeType) {
                  //   case TaskInitialState:
                  //     return taskInit(text: "initializing task");
                  //   case TaskLoadingState:
                  //     return taskInit(text: "Loading task");
                  //   case TaskLoadedState:
                  //     return taskText(taskEntity: state.taskEntity);
                  //   case TaskErrorState:
                  //     return taskInit(text: state.message);
                  //   default:
                  //     return taskInit(text: "something went wrong");
                  // }
                },
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

class taskInit extends StatelessWidget {
  final String text;

  const taskInit({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      child: Text(text),
    );
  }
}

class taskText extends StatelessWidget {
  final TaskEntity taskEntity;

  const taskText({
    required this.taskEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      child: Text(taskEntity.checksum ?? ""),
    );
  }
}
