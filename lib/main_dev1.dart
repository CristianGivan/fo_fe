import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:fo_fe/core/db/drift_sqlite/organizer_drift_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = OrganizerDriftDB();
  final taskDao = db.taskDao;

  // Insert a task
  final task = TaskTableCompanion(
    subject: Value("task1"),
    createdDate: Value(DateTime.now()),
    // Add other fields as required
  );
  await taskDao.insertTask(task);

  // Retrieve all tasks
  final tasks = await taskDao.getAllTasks();
  tasks.forEach((task) {
    print(task);
  });
}
