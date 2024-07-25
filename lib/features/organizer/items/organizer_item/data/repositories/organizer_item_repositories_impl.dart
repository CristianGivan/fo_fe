import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/const/failures_message.dart';
import 'package:fo_fe/core/error/exceptions.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

class OrganizerItemRepositoryImpl<T extends OrganizerItemEntity>
    implements OrganizerItemRepository<T> {
  final OrganizerItemLocalDataSource<T> organizerItemLocalDataSource;
  final OrganizerItemSyncDataSource<T> organizerItemSyncDataSource;
  final NetworkInfo networkInfo;

  OrganizerItemRepositoryImpl({
    required this.organizerItemLocalDataSource,
    required this.organizerItemSyncDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, OrganizerItems<T>>> getOrganizerItemsByIdSet(
      IdSet idSet) async {
    final Right<dynamic, OrganizerItems<T>> eitherOrganizerItems;

    try {
      if (await networkInfo.isInternet) {
        eitherOrganizerItems = Right(
            await organizerItemSyncDataSource.syncTaskListWithIdSet(idSet));
      } else {
        eitherOrganizerItems = Right(
            await organizerItemLocalDataSource.getOrganizerItemsByIdSet(idSet));
      }
      return eitherOrganizerItems.fold((failure) => Left(failure),
          (result) => _handleEmptyOrganizerItems(result));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  Either<Failure, OrganizerItems<T>> _handleEmptyOrganizerItems(
      OrganizerItems<T> result) {
    if (result.isEmpty()) {
      return const Left(NoDataFailure(noDataFailure));
    } else {
      return Right(result);
    }
  }
}
