import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

@DataClassName('NoteTableDriftG')
class NoteTableDrift extends OrganizerItemTableDrift {
  TextColumn get details => text().withLength(min: 1, max: 255)();
}
