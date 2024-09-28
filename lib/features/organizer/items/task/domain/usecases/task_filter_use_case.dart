import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class TaskFilterUseCase
    extends UseCase<OrganizerItems<TaskEntity>, FilterTasksParams> {
  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(
      FilterTasksParams params) async {
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

class FilterTasksParams extends Equatable {
  final OrganizerItems<TaskEntity> originalTasks;
  final OrganizerItems<TaskEntity> displayedTasks;
  final String criteria;
  final TaskStatus? status;
  final DateTime? startDate;
  final DateTime? endDate;

  const FilterTasksParams({
    required this.originalTasks,
    required this.displayedTasks,
    required this.criteria,
    this.status,
    this.startDate,
    this.endDate,
  });

  FilterTasksParams copyWith({
    OrganizerItems<TaskEntity>? originalTasks,
    OrganizerItems<TaskEntity>? displayedTasks,
    String? criteria,
    TaskStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return FilterTasksParams(
      originalTasks: originalTasks ?? this.originalTasks,
      displayedTasks: displayedTasks ?? this.displayedTasks,
      criteria: criteria ?? this.criteria,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props =>
      [originalTasks, displayedTasks, criteria, status, startDate, endDate];
}
