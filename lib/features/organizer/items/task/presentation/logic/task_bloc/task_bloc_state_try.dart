// part of 'task_bloc_try.dart';
//
// abstract class TaskBlocStateTry extends Equatable {
//   const TaskBlocStateTry();
//
//   @override
//   List<Object> get props => [];
// }
//
// class TaskInitialBlocStateTry extends TaskBlocStateTry {}
//
// class TaskLoadingBlocStateTry extends TaskBlocStateTry {}
//
// class TaskDtoItemsLoadedBlocStateTry extends TaskBlocStateTry {
//   final OrganizerItems<ItemEntity> originalTaskItems;
//   final OrganizerItems<ItemEntity> displayedTaskItems;
//
//   const TaskDtoItemsLoadedBlocStateTry({
//     required this.originalTaskItems,
//     required this.displayedTaskItems,
//   });
//
//   TaskDtoItemsLoadedBlocStateTry copyWith({
//     OrganizerItems<ItemEntity>? originalTaskItems,
//     OrganizerItems<ItemEntity>? displayedTaskItems,
//   }) {
//     return TaskDtoItemsLoadedBlocStateTry(
//       originalTaskItems: originalTaskItems ?? this.originalTaskItems,
//       displayedTaskItems: displayedTaskItems ?? this.displayedTaskItems,
//     );
//   }
//
//   @override
//   List<Object> get props => [originalTaskItems, displayedTaskItems];
// }
//
// class TaskAddedBlocState extends TaskBlocStateTry {}
//
// class TaskUpdatedBlocState extends TaskBlocStateTry {}
//
// class TaskDeletedBlocState extends TaskBlocStateTry {}
//
// class TaskErrorBlocStateTry extends TaskBlocStateTry {
//   final String message;
//
//   const TaskErrorBlocStateTry({this.message = "default error message"});
//
//   @override
//   List<Object> get props => [message];
// }
