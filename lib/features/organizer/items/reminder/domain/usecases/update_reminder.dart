import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

import 'reminder_usecase_export.dart';

class UpdateReminder implements UseCase<bool, ParamsReminder> {
  final ReminderRepository repository;

  UpdateReminder(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamsReminder params) async {
    return await repository.updateReminder(params.reminder);
  }
}
