import 'package:drift/drift.dart';

@DataClassName('TagTableDriftG')
class TagTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}
