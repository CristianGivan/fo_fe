part of '../../organizer_item.dart';

abstract class OrganizerItemSyncDataSource<T extends OrganizerItemEntity> {
  Future<OrganizerItems<T>> syncTaskListWithIdSet(IdSet idSet);
}

class OrganizerItemSyncDataSourceImpl<T extends OrganizerItemEntity>
    implements OrganizerItemSyncDataSource<T> {
  @override
  Future<OrganizerItems<T>> syncTaskListWithIdSet(IdSet idSet) {
    // TODO: implement syncTaskListWithIdSet
    throw UnimplementedError();
  }
}
