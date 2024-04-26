part of '../../organizer_item.dart';

abstract class OrganizerItemRemoteDataSource<T extends OrganizerItemEntity> {
  Future<OrganizerItems<T>> getOrganizerItemsByIdSet(IdSet idSet);
}

class OrganizerItemRemoteDataSourceImpl<T extends OrganizerItemEntity>
    implements OrganizerItemRemoteDataSource<T> {
  @override
  Future<OrganizerItems<T>> getOrganizerItemsByIdSet(IdSet idSet) {
    // TODO: implement syncTaskListWithIdSet
    throw UnimplementedError();
  }
}
