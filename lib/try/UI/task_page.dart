import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/try/UI/add_reminder_to_task_dialog.dart';
import 'package:fo_fe/try/UI/add_tag_to_task_dialog.dart';
import 'package:fo_fe/try/UI/add_task_dialog.dart';
import 'package:fo_fe/try/UI/add_user_to_task_dialog.dart';
import 'package:fo_fe/try/UI/update_task_dialog.dart';

import '../../core/util/organizer/core_util_organizer.dart';
import '../../features/organizer/items/task/task_lib.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: Center(
        child: BlocBuilder<TaskBloc, TaskBlocState>(
          builder: (context, state) {
            if (state is TaskInitialBlocState) {
              return Center(child: Text('Select a set of task IDs'));
            } else if (state is TaskLoadingBlocState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TaskLoadedBlocState) {
              return TaskList(tasks: state.tasks);
            } else if (state is TaskErrorBlocState) {
              return Center(child: Text(state.message));
            } else if (state is TaskAddedBlocState) {
              return Center(child: Text('Task Added Successfully'));
            } else if (state is TaskUpdatedBlocState) {
              return Center(child: Text('Task Updated Successfully'));
            } else if (state is TaskDeletedBlocState) {
              return Center(child: Text('Task Deleted Successfully'));
            } else if (state is UserAddedToTaskBlocState) {
              return Center(child: Text('User Added to Task Successfully'));
            } else if (state is TagAddedToTaskBlocState) {
              return Center(child: Text('Tag Added to Task Successfully'));
            } else if (state is ReminderAddedToTaskBlocState) {
              return Center(child: Text('Reminder Added to Task Successfully'));
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddTaskDialog();
      },
    );
  }
}

class TaskList extends StatelessWidget {
  final OrganizerItems<TaskEntity> tasks;

  TaskList({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.size(),
      itemBuilder: (context, index) {
        final task = tasks.getAt(index);
        return ListTile(
          title: Text(task.subject),
          subtitle: Text('Created: ${task.createdDate}'),
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              _handleMenuSelection(context, value, task);
            },
            itemBuilder: (BuildContext context) {
              return {'Add User', 'Add Tag', 'Add Reminder', 'Update', 'Delete'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        );
      },
    );
  }

  void _handleMenuSelection(
      BuildContext context, String value, TaskEntity task) {
    switch (value) {
      case 'Add User':
        _showAddUserDialog(context, task.id);
        break;
      case 'Add Tag':
        _showAddTagDialog(context, task.id);
        break;
      case 'Add Reminder':
        _showAddReminderDialog(context, task.id);
        break;
      case 'Update':
        _showUpdateTaskDialog(context, task);
        break;
      case 'Delete':
        BlocProvider.of<TaskBloc>(context).add(DeleteTaskBlocEvent(task.id));
        break;
    }
  }

  void _showAddUserDialog(BuildContext context, int taskId) {
    showDialog(
      context: context,
      builder: (context) {
        return AddUserToTaskDialog(taskId: taskId);
      },
    );
  }

  void _showAddTagDialog(BuildContext context, int taskId) {
    showDialog(
      context: context,
      builder: (context) {
        return AddTagToTaskDialog(taskId: taskId);
      },
    );
  }

  void _showAddReminderDialog(BuildContext context, int taskId) {
    showDialog(
      context: context,
      builder: (context) {
        return AddReminderToTaskDialog(taskId: taskId);
      },
    );
  }

  void _showUpdateTaskDialog(BuildContext context, TaskEntity task) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateTaskDialog(task: task);
      },
    );
  }
}
