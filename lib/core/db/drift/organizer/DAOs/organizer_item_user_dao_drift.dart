import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'organizer_item_user_dao_drift.g.dart';

@DriftAccessor(tables: [OrganizerItemUserTableDrift])
class OrganizerItemUserDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$OrganizerItemUserDaoDriftMixin {
  final OrganizerDriftDB db;

  OrganizerItemUserDaoDrift(this.db) : super(db);

  Future<List<OrganizerItemUserTableDriftG>> getAllItemUsers() =>
      select(organizerItemUserTableDrift).get();

  Stream<List<OrganizerItemUserTableDriftG>> watchAllItemUsers() =>
      select(organizerItemUserTableDrift).watch();

  Future<int> insertItemUser(
          Insertable<OrganizerItemUserTableDriftG> itemUser) =>
      into(organizerItemUserTableDrift).insert(itemUser);

  Future<bool> updateItemUser(
          Insertable<OrganizerItemUserTableDriftG> itemUser) =>
      update(organizerItemUserTableDrift).replace(itemUser);

  Future<int> deleteItemUser(
          Insertable<OrganizerItemUserTableDriftG> itemUser) =>
      delete(organizerItemUserTableDrift).delete(itemUser);
}
