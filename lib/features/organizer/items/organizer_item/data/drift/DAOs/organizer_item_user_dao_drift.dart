import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_sqlite/organizer_drift_db.dart';

import '../tables/organizer_item_user_table_drift.dart';

part 'organizer_item_user_dao_drift.g.dart';

@DriftAccessor(tables: [OrganizerItemUserTableDrift])
class OrganizerItemUserDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$OrganizerItemUserDaoMixin {
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
