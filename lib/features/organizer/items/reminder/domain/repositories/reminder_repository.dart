import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

abstract class ReminderRepository {
  Future<Either<Failure, int>> insertReminder(ReminderEntity reminder);

  Future<Either<Failure, bool>> updateReminder(ReminderEntity reminder);

  Future<Either<Failure, int>> deleteReminder(int reminderId);

  Future<Either<Failure, ReminderEntity>> getReminderById(int id);

  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getReminderItemsAll();

  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      getReminderItemsByIdSet(IdSet idSet);
}
