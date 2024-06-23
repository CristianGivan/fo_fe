import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/organizer_item_table_drift.dart';

@DataClassName('TaskTableDriftG')
class TaskTableDrift extends OrganizerItemTableDrift {
  DateTimeColumn get startDate => dateTime().nullable()();

  DateTimeColumn get endDate => dateTime().nullable()();

  RealColumn get workingTime => real().nullable()();

  RealColumn get estimatedTime => real().nullable()();

  RealColumn get estimatedLeftTime => real().nullable()();

  RealColumn get workingProgress => real().nullable()();

  TextColumn get taskStatus => text().nullable()(); // Enum stored as text
}
