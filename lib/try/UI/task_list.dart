import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:fo_fe/try/UI/update_task_screen.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBlocTask, TaskBlocState>(
      builder: (context, state) {
        if (state is TaskLoadingBlocState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TaskLoadedBlocState) {
          return ListView.builder(
            itemCount: state.tasks.size(),
            itemBuilder: (context, index) {
              final task = state.tasks.getAt(index);
              return ListTile(
                title: Text(task.subject),
                // subtitle: Text(task.subject),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateTaskScreen()),
                  );
                },
              );
            },
          );
        } else if (state is TaskErrorBlocState) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No tasks available.'));
        }
      },
    );
  }
}
