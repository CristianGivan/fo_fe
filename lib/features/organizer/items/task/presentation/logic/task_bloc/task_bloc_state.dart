part of 'task_bloc.dart';

abstract class TaskBlocState extends Equatable {
  const TaskBlocState();

  @override
  List<Object> get props => [];
}

class TaskInitialBlocState extends TaskBlocState {}

class TaskLoadingBlocState extends TaskBlocState {}

class TaskDtoItemsLoadedBlocState extends TaskBlocState {
  final OrganizerItems<ItemEntity> originalTaskItems;
  final OrganizerItems<ItemEntity> displayedTaskItems;

  const TaskDtoItemsLoadedBlocState({
    required this.originalTaskItems,
    required this.displayedTaskItems,
  });

  TaskDtoItemsLoadedBlocState copyWith({
    OrganizerItems<ItemEntity>? originalTaskItems,
    OrganizerItems<ItemEntity>? displayedTaskItems,
  }) {
    return TaskDtoItemsLoadedBlocState(
      originalTaskItems: originalTaskItems ?? this.originalTaskItems,
      displayedTaskItems: displayedTaskItems ?? this.displayedTaskItems,
    );
  }

  @override
  List<Object> get props => [originalTaskItems, displayedTaskItems];
}

class TaskAddedBlocState extends TaskBlocState {}

class TaskUpdatedBlocState extends TaskBlocState {}

class TaskDeletedBlocState extends TaskBlocState {}

class TaskErrorBlocState extends TaskBlocState {
  final String message;

  const TaskErrorBlocState({this.message = "default error message"});

  @override
  List<Object> get props => [message];
}
