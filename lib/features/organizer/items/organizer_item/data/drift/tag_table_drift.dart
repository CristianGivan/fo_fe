import 'package:drift/drift.dart';

@DataClassName('TagTableDriftG')
class TagTableDrift extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get tag => text().withLength(min: 1, max: 255)();
}
