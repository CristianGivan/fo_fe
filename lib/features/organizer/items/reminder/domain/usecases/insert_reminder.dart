import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

class InsertReminder implements UseCase<int, ParamsReminder> {
  final ReminderRepository repository;

  InsertReminder(this.repository);

  @override
  Future<Either<Failure, int>> call(ParamsReminder params) async {
    return await repository.insertReminder(params.reminder);
  }
}

class ParamsReminder {
  final ReminderEntity reminder;

  ParamsReminder({required this.reminder});
}
