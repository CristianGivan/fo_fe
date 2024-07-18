import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

@DataClassName('UserTableDriftG')
class UserTableDrift extends OrganizerItemTableDrift {
  TextColumn get name => text()();

  TextColumn get hashedPassword => text()();

  TextColumn get email => text().nullable()();
}
