import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

@DataClassName('ReminderTableDriftG')
class ReminderTableDrift extends OrganizerItemTableDrift {
  TextColumn get subject => text()();

  DateTimeColumn get remindAt => dateTime()();
}
