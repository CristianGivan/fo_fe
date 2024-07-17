import 'package:drift/drift.dart';

import '../tables/organizer_item_table_drift.dart';

@DataClassName('TaskTableDriftG')
class TaskTableDrift extends OrganizerItemTableDrift {
  TextColumn get subject => text().withLength(min: 1, max: 255)();

  DateTimeColumn get startDate => dateTime().nullable()();

  DateTimeColumn get endDate => dateTime().nullable()();

  RealColumn get workingTime => real().nullable()();

  RealColumn get estimatedTime => real().nullable()();

  RealColumn get estimatedLeftTime => real().nullable()();

  RealColumn get workingProgress => real().nullable()();

  TextColumn get taskStatus => text().nullable()(); // Enum stored as text
}
