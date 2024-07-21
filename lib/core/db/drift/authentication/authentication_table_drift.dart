import 'package:drift/drift.dart';

@DataClassName('AuthenticationTableDriftG')
class AuthenticationTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer()();

  TextColumn get token => text()();

  TextColumn get deviceInfo => text()();

  DateTimeColumn get createdDate => dateTime()();

  DateTimeColumn get expiredDate => dateTime()();

  DateTimeColumn get lastUsedDate => dateTime()();

  IntColumn get refreshCount => integer()();

  BoolColumn get isActive => boolean()();
}
