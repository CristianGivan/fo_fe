import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class ReminderRepositoryDrift implements ReminderRepository {
  final ReminderLocalDataSource localDataSource;

  ReminderRepositoryDrift({required this.localDataSource});

  @override
  Future<Either<Failure, int>> insertReminder(ReminderEntity reminder) async {
    try {
      final id = await localDataSource.insertReminder(reminder);
      return Right(id);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateReminder(ReminderEntity reminder) async {
    try {
      final success = await localDataSource.updateReminder(reminder);
      return Right(success);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteReminder(int reminderId) async {
    try {
      final id = await localDataSource.deleteReminder(reminderId);
      return Right(id);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, ReminderEntity>> getReminderById(int id) async {
    try {
      final reminder = await localDataSource.getReminderById(id);
      return Right(reminder);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsAll() async {
    try {
      final items = await localDataSource.getReminderItemsAll();
      return Right(items);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsByIdSet(IdSet idSet) async {
    try {
      final items = await localDataSource.getReminderItemsByIdSet(idSet);
      return Right(items);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsByTaskId(int taskId) {
    // TODO: implement getReminderItemsByTaskId
    throw UnimplementedError();
  }
}
