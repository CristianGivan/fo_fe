import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class DeleteReminder implements UseCase<int, DeleteTagParams> {
  final ReminderRepository repository;

  DeleteReminder(this.repository);

  @override
  Future<Either<Failure, int>> call(DeleteTagParams params) async {
    return await repository.deleteReminder(params.id);
  }
}

class DeleteTagParams extends Equatable {
  final int id;

  DeleteTagParams({required this.id});

  @override
  List<Object?> get props => [id];
}
