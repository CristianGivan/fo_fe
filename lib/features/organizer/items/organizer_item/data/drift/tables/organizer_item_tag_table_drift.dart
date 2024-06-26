import 'package:drift/drift.dart';

@DataClassName('OrganizerItemTagTableDriftG')
class OrganizerItemTagTableDrift extends Table {
  IntColumn get organizerItemTagId => integer().autoIncrement()();

  IntColumn get organizerItemId =>
      integer().customConstraint('REFERENCES OrganizerItemTableDriftG(id)')();

  IntColumn get tagId =>
      integer().customConstraint('REFERENCES TagTableDriftG(id)')();
}
