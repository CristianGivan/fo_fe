import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'organizer_item_tag_dao_drift.g.dart';

@DriftAccessor(tables: [OrganizerItemTagTableDrift])
class OrganizerItemTagDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$OrganizerItemTagDaoDriftMixin {
  final OrganizerDriftDB db;

  OrganizerItemTagDaoDrift(this.db) : super(db);

  Future<List<OrganizerItemTagTableDriftG>> getAllItemTags() =>
      select(organizerItemTagTableDrift).get();

  Stream<List<OrganizerItemTagTableDriftG>> watchAllItemTags() =>
      select(organizerItemTagTableDrift).watch();

  Future<int> insertItemTag(Insertable<OrganizerItemTagTableDriftG> itemTag) =>
      into(organizerItemTagTableDrift).insert(itemTag);

  Future<bool> updateItemTag(Insertable<OrganizerItemTagTableDriftG> itemTag) =>
      update(organizerItemTagTableDrift).replace(itemTag);

  Future<int> deleteItemTag(Insertable<OrganizerItemTagTableDriftG> itemTag) =>
      delete(organizerItemTagTableDrift).delete(itemTag);
}
