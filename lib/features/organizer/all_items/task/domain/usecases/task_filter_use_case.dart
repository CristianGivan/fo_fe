import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskFilterUseCase extends UseCase<OrganizerItems<TaskDto>, FilterTasksParams> {
  @override
  Future<Either<Failure, OrganizerItems<TaskDto>>> call(FilterTasksParams params) async {
    final List<TaskDto> filteredTasks;
    // Implement filtering logic based on the criteria provided in params
    if (params.criteria == "reset") {
      filteredTasks = params.originalTaskItems.toList();
    } else {
      filteredTasks = params.displayedTaskItems.where((taskDto) {
        switch (params.criteria) {
          case 'status':
            return taskDto.task.taskStatus == params.status;
          case 'startingDateRange':
            return taskDto.task.startDate!.isAfter(params.startDate!) &&
                taskDto.task.startDate!.isBefore(params.endDate!);
          default:
            return true;
        }
      }).toList();
    }
    return Right(OrganizerItems.of(filteredTasks));
  }
}
