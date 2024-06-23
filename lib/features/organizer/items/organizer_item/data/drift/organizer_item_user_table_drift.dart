import 'package:drift/drift.dart';

@DataClassName('OrganizerItemUserTableDriftG')
class OrganizerItemUserTableDrift extends Table {
  IntColumn get organizerItemUserId => integer().autoIncrement()();

  IntColumn get organizerItemId =>
      integer().customConstraint('REFERENCES OrganizerItemTableDriftG(id)')();

  IntColumn get userId =>
      integer().customConstraint('REFERENCES OrganizerItemTableDriftG(id)')();
}
