import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'core/db/drift_sqlite/organizer_drift_db.dart';
import 'features/organizer/items/task/data/drift/datasourece/task_dao_drift.dart';

final getIt = GetIt.instance;

class AppDev extends StatelessWidget {
  final TextEditingController _subjectController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    final database = getIt<DriftDBOrganizer>();
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
                  id: 0,
                  subject: _subjectController.text,
                  createdDate: DateTime.now(),
                  // remoteId: null,
                  // lastUpdate: DateTime.now(),
                  // lastViewDate: DateTime.now(),
                  // remoteViews: 0,
                  // views: 0,
                  // checksum: '',
                  // startDate: DateTime.now(),
                  // endDate: DateTime.now().add(Duration(hours: 1)),
                  // workingTime: 1.0,
                  // estimatedTime: 1.0,
                  // estimatedLeftTime: 1.0,
                  // workingProgress: 0.0,
                  taskStatus: 'pending',
                );

                await taskDao.insertTask(task);
                _subjectController.clear();
              },
              child: const Text('Add Task'),
            ),
            Expanded(
              child: FutureBuilder<List<TaskEntity>>(
                future: taskDao.getAllTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final tasks = snapshot.data;
                    return ListView.builder(
                      itemCount: tasks?.length,
                      itemBuilder: (context, index) {
                        final task = tasks![index];
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
