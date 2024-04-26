part of '../../organizer_item.dart';

abstract class OrganizerItemRepository<T extends OrganizerItemEntity> {
  Future<Either<Failure, OrganizerItems<T>>> getOrganizerItemsByIdSet(IdSet id);
}
