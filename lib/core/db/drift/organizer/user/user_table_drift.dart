import 'package:drift/drift.dart';

@DataClassName('UserTableDriftG')
class UserTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get createdDate =>
      dateTime().withDefault(currentDateAndTime)();

  TextColumn get name => text()();

  TextColumn get hashedPassword => text()();

  TextColumn get email => text().nullable()();
}
