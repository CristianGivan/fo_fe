import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/config/app_init.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:fo_fe/try/UI/reminder_form.dart';
import 'package:fo_fe/try/UI/tag_form.dart';
import 'package:fo_fe/try/UI/user_form.dart';

class TaskDetailsScreen extends StatelessWidget {
  final int taskId;

  TaskDetailsScreen({required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                sl<TaskBlocTask>()..add(TaskGetByIdBlocEvent(taskId)),
          ),
          BlocProvider(
            create: (context) =>
                sl<TaskBlocUser>()..add(GetUsersByTaskIdBlocEvent(taskId)),
          ),
          BlocProvider(
            create: (context) =>
                sl<TaskBlocTag>()..add(GetTagsByTaskIdBlocEvent(taskId)),
          ),
          BlocProvider(
            create: (context) => sl<TaskBlocReminder>()
              ..add(GetRemindersByTaskIdBlocEvent(taskId)),
          ),
        ],
        child: TaskDetails(taskId: taskId),
      ),
    );
  }
}

class TaskDetails extends StatelessWidget {
  final int taskId;

  TaskDetails({required this.taskId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<TaskBlocTask, TaskBlocState>(
            builder: (context, state) {
              if (state is TaskLoadingBlocState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TaskLoadedBlocState) {
                final task =
                    state.tasks.firstWhere((task) => task.id == taskId);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: ${task.subject}',
                        style: TextStyle(fontSize: 20)),
                    Text('Description: ${task.subject}'),
                    // Add more fields as necessary
                  ],
                );
              } else if (state is TaskErrorBlocState) {
                return Center(child: Text(state.message));
              } else {
                return Center(child: Text('Unknown state'));
              }
            },
          ),
          Divider(),
          Text('Users:', style: TextStyle(fontSize: 18)),
          BlocBuilder<TaskBlocUser, TaskUserBlocState>(
            builder: (context, state) {
              if (state is TaskLoadingBlocState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is UserLoadedBlocState) {
                return Column(
                  children: state.users.map((user) {
                    return ListTile(
                      title: Text(user.name),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<TaskBlocUser>(context).add(
                              DeleteUserFromTaskBlocEvent(taskId, user.id));
                        },
                      ),
                    );
                  }).toList(),
                );
              } else if (state is TaskErrorBlocState) {
                return Center(child: Text("state.message"));
              } else {
                return Center(child: Text('Unknown state'));
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserForm(taskId: taskId)),
              );
            },
            child: Text('Add User'),
          ),
          Divider(),
          Text('Tags:', style: TextStyle(fontSize: 18)),
          BlocBuilder<TaskBlocTag, TaskTagBlocState>(
            builder: (context, state) {
              if (state is TaskLoadingBlocState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TagLoadedBlocState) {
                return Column(
                  children: state.tags.map((tag) {
                    return ListTile(
                      title: Text(tag.subject),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<TaskBlocTag>(context)
                              .add(DeleteTagFromTaskBlocEvent(taskId, tag.id));
                        },
                      ),
                    );
                  }).toList(),
                );
              } else if (state is TaskErrorBlocState) {
                return Center(child: Text("state.message"));
              } else {
                return Center(child: Text('Unknown state'));
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TagForm(taskId: taskId)),
              );
            },
            child: Text('Add Tag'),
          ),
          Divider(),
          Text('Reminders:', style: TextStyle(fontSize: 18)),
          BlocBuilder<TaskBlocReminder, TaskReminderBlocState>(
            builder: (context, state) {
              if (state is TaskLoadingBlocState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ReminderLoadedBlocState) {
                return Column(
                  children: state.reminders.map((reminder) {
                    return ListTile(
                      title: Text(reminder.subject),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<TaskBlocReminder>(context).add(
                              DeleteReminderFromTaskBlocEvent(
                                  taskId, reminder.id));
                        },
                      ),
                    );
                  }).toList(),
                );
              } else if (state is TaskErrorBlocState) {
                return Center(child: Text("state.message"));
              } else {
                return Center(child: Text('Unknown state'));
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReminderForm(taskId: taskId)),
              );
            },
            child: Text('Add Reminder'),
          ),
        ],
      ),
    );
  }
}
