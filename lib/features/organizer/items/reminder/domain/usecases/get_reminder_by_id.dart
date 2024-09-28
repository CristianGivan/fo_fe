import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';

class GetReminderById implements UseCase<ReminderEntity?, GetTagByIdParams> {
  final ReminderRepository repository;

  GetReminderById(this.repository);

  @override
  Future<Either<Failure, ReminderEntity?>> call(GetTagByIdParams params) async {
    return await repository.getReminderById(params.id);
  }
}

class GetTagByIdParams extends Equatable {
  final int id;

  const GetTagByIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}
