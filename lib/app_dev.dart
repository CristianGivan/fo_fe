import 'package:flutter/material.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/data/drift/repositories/task_repositories_drift.dart';
import 'package:fo_fe/features/organizer/util/organizer_enums.dart';
import 'package:fo_fe/injection_container.dart' as di;
import 'package:intl/intl.dart';

import 'features/organizer/items/task/data/drift/datasourece/task_dao_drift.dart';
import 'features/organizer/items/task/task_lib.dart';

final getIt = di.sl;

class AppDev extends StatefulWidget {
  @override
  _AppDevState createState() => _AppDevState();
}

class _AppDevState extends State<AppDev> {
  final TextEditingController _subjectController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  Future<List<TaskEntity>>? _tasksFuture;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final taskRepository = getIt<TaskRepositoriesDrift>();
    _tasksFuture = Future.value((await taskRepository.getTaskListAll())
        .getOrElse(OrganizerItems<TaskEntity>.empty)
        .toList());
    setState(() {}); // Refresh the UI after loading tasks
  }

  @override
  Widget build(BuildContext context) {
    final taskDao = getIt<TaskDaoDrift>();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _subjectController,
                decoration: const InputDecoration(labelText: 'Task Subject'),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final task = TaskEntity(
                  subject: _subjectController.text,
                  createdDate: DateTime.now(),
                  taskStatus: TaskStatus.undefined,
                );

                await taskDao.insertTask(task);
                _subjectController.clear();
                _loadTasks();
              },
              child: const Text('Add Task'),
            ),
            ElevatedButton(
              onPressed: _loadTasks,
              child: const Text('Load Tasks'),
            ),
            Expanded(
              child: FutureBuilder<List<TaskEntity>>(
                future: _tasksFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No tasks found'));
                  } else {
                    final tasks = snapshot.data!;
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return ListTile(
                          title: Text(task.subject),
                          subtitle: Text(
                              'Created: ${_dateFormat.format(task.createdDate)}'),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
