import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

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
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getReminderItemsAll() {
    // TODO: implement getReminderItemsAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getReminderItemsByIdSet(IdSet idSet) {
    // TODO: implement getReminderItemsByIdSet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> addReminder(ReminderEntity reminder) {
    // TODO: implement addReminder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateReminder(ReminderEntity reminder) {
    // TODO: implement updateReminder
    throw UnimplementedError();
  }
}
