import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';

class GetReminderItemsByIdSet
    implements UseCase<OrganizerItems<ReminderEntity>, ParamsIdSet> {
  final ReminderRepository repository;

  GetReminderItemsByIdSet(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> call(
      ParamsIdSet params) async {
    return await repository.getReminderItemsByIdSet(params.idSet);
  }
}

class ParamsIdSet {
  final IdSet idSet;

  ParamsIdSet({required this.idSet});
}
