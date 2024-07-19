import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

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
