import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final TagLocalDataSource localDataSource;

  ReminderRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, int>> deleteReminder(int reminderId) {
    // TODO: implement deleteReminder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ReminderEntity>> getReminderById(int id) {
    // TODO: implement getReminderById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsAll() {
    // TODO: implement getReminderItemsAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsByIdSet(IdSet idSet) {
    // TODO: implement getReminderItemsByIdSet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsByTaskId(int taskId) {
    // TODO: implement getReminderItemsByTaskId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> insertReminder(ReminderEntity reminder) {
    // TODO: implement insertReminder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateReminder(ReminderEntity reminder) {
    // TODO: implement updateReminder
    throw UnimplementedError();
  }
}
