import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskSortUseCase extends UseCase<OrganizerItems<TaskDto>, SortTasksParams> {
  @override
  Future<Either<Failure, OrganizerItems<TaskDto>>> call(SortTasksParams params) async {
    try {
      final builder = params.tasks.toBuilder();

      Comparator<TaskDto> sortComparator;
      switch (params.criteria) {
        case 'createdDate':
          sortComparator = (a, b) => a.task.createdDate.compareTo(b.task.createdDate);
          break;
        case 'status':
          sortComparator = (a, b) => a.task.taskStatus!.index.compareTo(b.task.taskStatus!.index);
          break;
        default:
          return Right(params.tasks);
      }

      builder.organizerItems.sort(sortComparator);

      final sortedItems = builder.build();

      return Right(sortedItems);
    } catch (e) {
      return Left(SortFailure());
    }
  }
}

class SortFailure extends Failure {
  @override
  List<Object?> get props => [];
}
