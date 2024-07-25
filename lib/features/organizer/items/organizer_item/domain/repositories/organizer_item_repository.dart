import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

abstract class OrganizerItemRepository<T extends OrganizerItemEntity> {
  Future<Either<Failure, OrganizerItems<T>>> getOrganizerItemsByIdSet(IdSet id);
}
