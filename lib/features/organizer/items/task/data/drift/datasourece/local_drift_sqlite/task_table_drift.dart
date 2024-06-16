import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/OrganizerItemDriftTable.dart';

@DataClassName('TaskEntity')
class TaskTableDrift extends OrganizerItemDriftTable {
  DateTimeColumn get startDate => dateTime().nullable()();

  DateTimeColumn get endDate => dateTime().nullable()();

  RealColumn get workingTime => real().nullable()();

  RealColumn get estimatedTime => real().nullable()();

  RealColumn get estimatedLeftTime => real().nullable()();

  RealColumn get workingProgress => real().nullable()();

  TextColumn? get taskStatus => text().nullable()();

  @override
  Set<Column> get primaryKey => {id}; // Assuming id is the primary key
}
