import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

class TaskListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Task Items'),
      ),
      body: BlocBuilder<TaskBlocTask, TaskBlocState>(
        builder: (context, state) {
          if (state is TaskLoadingBlocState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TaskLoadedBlocState) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.tasks.size(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.tasks
                            .getAt(index)
                            .subject), // Assuming each task has a name
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is TaskErrorBlocState) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No Tasks Available'));
          }
        },
      ),
    );
  }
}
