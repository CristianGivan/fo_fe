import 'package:drift/drift.dart';

@DataClassName('UserTableDriftG')
class UserTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text().nullable()();
}
