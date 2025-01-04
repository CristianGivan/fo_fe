part of 'task_bloc.dart';

class TaskBlocState extends OrganizerBlocState<TaskEntity> {
  final String? errorMessage;

  TaskBlocState({
    required super.status,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
