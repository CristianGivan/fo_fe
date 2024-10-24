import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskSortUseCase extends UseCase<OrganizerItems<TaskEntity>, SortTasksParams> {
  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(SortTasksParams params) async {
    try {
      final builder = params.tasks.toBuilder();

      Comparator<TaskEntity> sortComparator;
      switch (params.criteria) {
        case 'createdDate':
          sortComparator = (a, b) => a.createdDate.compareTo(b.createdDate);
          break;
        case 'status':
          sortComparator = (a, b) => a.taskStatus!.index.compareTo(b.taskStatus!.index);
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

class SortTasksParams {
  final OrganizerItems<TaskEntity> tasks;
  final String criteria;

  SortTasksParams({required this.tasks, required this.criteria});

  SortTasksParams copyWith({
    OrganizerItems<TaskEntity>? tasks,
    String? criteria,
  }) {
    return SortTasksParams(
      tasks: tasks ?? this.tasks,
      criteria: criteria ?? this.criteria,
    );
  }

  @override
  List<Object> get props => [tasks, criteria];
}
