part of 'task_bloc.dart';

abstract class TaskBlocState extends Equatable {
  const TaskBlocState();

  @override
  List<Object> get props => [];
}

class TaskInitialBlocState extends TaskBlocState {}

class TaskLoadingBlocState extends TaskBlocState {}

class TaskLoadedBlocState extends TaskBlocState {
  final OrganizerItems<TaskEntity> originalTasks;
  final OrganizerItems<TaskEntity> displayedTasks;
  final IdSet selectedTasks;

  TaskLoadedBlocState({
    required this.originalTasks,
    required this.displayedTasks,
    IdSet? selectedTasks,
  }) : selectedTasks = selectedTasks ?? IdSet.empty();

  TaskLoadedBlocState copyWith({
    OrganizerItems<TaskEntity>? originalTasks,
    OrganizerItems<TaskEntity>? displayedTasks,
    IdSet? selectedTasks,
  }) {
    return TaskLoadedBlocState(
      originalTasks: originalTasks ?? this.originalTasks,
      displayedTasks: displayedTasks ?? this.displayedTasks,
      selectedTasks: selectedTasks ?? this.selectedTasks,
    );
  }

  @override
  List<Object> get props => [originalTasks, displayedTasks, selectedTasks];
}

class TaskAddedBlocState extends TaskBlocState {}

class TaskUpdatedBlocState extends TaskBlocState {}

class TaskDeletedBlocState extends TaskBlocState {}

class TaskErrorBlocState extends TaskBlocState {
  final String message;

  TaskErrorBlocState({this.message = "default error message"});

  @override
  List<Object> get props => [message];
}
