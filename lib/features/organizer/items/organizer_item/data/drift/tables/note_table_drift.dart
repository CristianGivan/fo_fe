import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/tables/organizer_item_table_drift.dart';

@DataClassName('NoteTableDriftG')
class NoteTableDrift extends OrganizerItemTableDrift {
  TextColumn get details => text().withLength(min: 1, max: 255)();
}
