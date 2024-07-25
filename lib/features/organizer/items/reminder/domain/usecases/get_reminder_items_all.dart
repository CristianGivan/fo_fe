import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/no_params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class GetReminderItemsAll
    implements UseCase<OrganizerItems<ReminderEntity>, NoParams> {
  final ReminderRepository repository;

  GetReminderItemsAll(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> call(
      NoParams params) async {
    return await repository.getReminderItemsAll();
  }
}
