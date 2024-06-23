import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/data/drift/organizer_item_table_drift.dart';

@DataClassName('TagTableDriftG')
class TagTableDrift extends OrganizerItemTableDrift {
  TextColumn get tag => text().withLength(min: 1, max: 255)();
}
