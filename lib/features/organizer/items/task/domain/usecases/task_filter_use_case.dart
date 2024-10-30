import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskFilterUseCase extends UseCase<OrganizerItems<TaskEntity>, FilterTasksParams> {
  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(FilterTasksParams params) async {
    final List<TaskEntity> filteredTasks;
    // Implement filtering logic based on the criteria provided in params
    if (params.criteria == "reset") {
      filteredTasks = params.originalTasks.toList();
    } else {
      filteredTasks = params.displayedTasks.where((task) {
        switch (params.criteria) {
          case 'status':
            return task.taskStatus == params.status;
          case 'startingDateRange':
            return task.startDate!.isAfter(params.startDate!) &&
                task.startDate!.isBefore(params.endDate!);
          default:
            return true;
        }
      }).toList();
    }
    return Right(OrganizerItems.of(filteredTasks));
  }
}
