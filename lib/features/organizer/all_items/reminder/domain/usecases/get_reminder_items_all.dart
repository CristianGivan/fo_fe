import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetReminderItemsAll implements UseCase<OrganizerItems<ReminderEntity>, NoParams> {
  final ReminderRepository repository;

  GetReminderItemsAll(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> call(NoParams params) async {
    return await repository.getReminderItemsAll();
  }
}
