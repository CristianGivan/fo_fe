part of '../../organizer_item.dart';

abstract class OrganizerItemLocalDataSource<T extends OrganizerItemEntity> {
  Future<OrganizerItems<T>> getOrganizerItemsByIdSet(IdSet idSet);
}

class OrganizerItemLocalDataSourceImpl<T extends OrganizerItemEntity>
    implements OrganizerItemLocalDataSource {
  @override
  Future<OrganizerItems<T>> getOrganizerItemsByIdSet(IdSet idSet) {
    // TODO: implement syncTaskListWithIdSet
    throw UnimplementedError();
  }
}
