import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'organizer_item_dao_drift.g.dart';

@DriftAccessor(tables: [OrganizerItemTableDrift])
class OrganizerItemDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$OrganizerItemDaoDriftMixin {
  final OrganizerDriftDB db;

  OrganizerItemDaoDrift(this.db) : super(db);

  Future<List<OrganizerItemTableDriftG>> getAllItems() =>
      select(organizerItemTableDrift).get();

  Stream<List<OrganizerItemTableDriftG>> watchAllItems() =>
      select(organizerItemTableDrift).watch();

  Future<int> insertItem(Insertable<OrganizerItemTableDriftG> item) =>
      into(organizerItemTableDrift).insert(item);

  Future<bool> updateItem(Insertable<OrganizerItemTableDriftG> item) =>
      update(organizerItemTableDrift).replace(item);

  Future<int> deleteItem(Insertable<OrganizerItemTableDriftG> item) =>
      delete(organizerItemTableDrift).delete(item);
}
