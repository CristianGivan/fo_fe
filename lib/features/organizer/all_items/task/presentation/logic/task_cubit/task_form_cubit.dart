import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';

class TaskFormCubit extends Cubit<TaskFormState> {
  TaskFormCubit()
      : super(TaskFormState(
          subject: '',
          checksum: '',
          startDate: null,
          endDate: null,
          workingTime: null,
          estimatedTime: null,
          estimatedLeftTime: null,
          workingProgress: null,
          taskStatus: null,
        ));

  void updateSubject(String value) => emit(state.copyWith(subject: value));

  void updateChecksum(String value) => emit(state.copyWith(checksum: value));

  void updateStartDate(DateTime value) => emit(state.copyWith(startDate: value));

  void updateEndDate(DateTime value) => emit(state.copyWith(endDate: value));

  void updateWorkingTime(double value) => emit(state.copyWith(workingTime: value));

  void updateEstimatedTime(double value) => emit(state.copyWith(estimatedTime: value));

  void updateEstimatedLeftTime(double value) => emit(state.copyWith(estimatedLeftTime: value));

  void updateWorkingProgress(double value) => emit(state.copyWith(workingProgress: value));

  void updateTaskStatus(TaskStatus value) => emit(state.copyWith(taskStatus: value));
}

class TaskFormState {
  final String subject;
  final String checksum;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? workingTime;
  final double? estimatedTime;
  final double? estimatedLeftTime;
  final double? workingProgress;
  final TaskStatus? taskStatus;

  TaskFormState({
    required this.subject,
    required this.checksum,
    required this.startDate,
    required this.endDate,
    required this.workingTime,
    required this.estimatedTime,
    required this.estimatedLeftTime,
    required this.workingProgress,
    required this.taskStatus,
  });

  TaskFormState copyWith({
    String? subject,
    String? checksum,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
  }) {
    return TaskFormState(
      subject: subject ?? this.subject,
      checksum: checksum ?? this.checksum,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      workingTime: workingTime ?? this.workingTime,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      estimatedLeftTime: estimatedLeftTime ?? this.estimatedLeftTime,
      workingProgress: workingProgress ?? this.workingProgress,
      taskStatus: taskStatus ?? this.taskStatus,
    );
  }
}
