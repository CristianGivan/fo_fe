part of 'task_bloc.dart';

class TaskBlocState extends OrganizerBlocState<TaskEntity> {
  const TaskBlocState({
    required super.status,
    this.errorMessage,
  });

  final String? errorMessage;

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
