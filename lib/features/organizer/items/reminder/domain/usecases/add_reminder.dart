import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class AddReminder implements UseCase<int, ParamsReminder> {
  final ReminderRepository repository;

  AddReminder(this.repository);

  @override
  Future<Either<Failure, int>> call(ParamsReminder params) async {
    return await repository.addReminder(params.reminder);
  }
}

class ParamsReminder {
  final ReminderEntity reminder;

  ParamsReminder({required this.reminder});
}
