import 'package:drift/drift.dart';

class TaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get subject => text()();

  DateTimeColumn get createdDate => dateTime()();

// Add any other columns as required
}

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
// Add other user-related columns
}

// Define other related tables like Tags, Reminders, etc. similarly
