import 'package:drift/drift.dart';

@DataClassName('AuthTableDriftG')
class AuthTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer()();

  TextColumn get token => text()();

  TextColumn get deviceInfo => text()();

  DateTimeColumn get createdDate => dateTime()();

  DateTimeColumn get expiredDate => dateTime()();

  DateTimeColumn get lastUsedDate => dateTime()();

  IntColumn get usedCount => integer()();

  IntColumn get usedCountMax => integer()();

  BoolColumn get isActive => boolean()();

  BoolColumn get isAutoSignIn => boolean()();
}
