import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/organizer_item_table_drift.dart';

@DataClassName('ReminderTableDriftG')
class ReminderTableDrift extends OrganizerItemTableDrift {
  DateTimeColumn get reminderDate => dateTime().nullable()();
}
