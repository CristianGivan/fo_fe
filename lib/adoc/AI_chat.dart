// Entity-Specific Customizations Using Shared Base Classes
// Shared Event and State Classes
//
// Define a base event and state that can be extended for each entity.
//
// // shared_event.dart
// abstract class EntityEvent {}
//
// class LoadEntities extends EntityEvent {}
//
// // shared_state.dart
// abstract class EntityState {}
//
// class EntitiesLoading extends EntityState {}
//
// class EntitiesLoaded<T> extends EntityState {
//   final List<T> entities;
//
//   EntitiesLoaded(this.entities);
// }
//
// Entity-Specific Extensions
//
// Extend the shared event and state classes for entity-specific logic.
//
// // task_event.dart
// import 'shared_event.dart';
//
// class MarkTaskAsCompleted extends EntityEvent {
//   final String taskId;
//
//   MarkTaskAsCompleted(this.taskId);
// }
//
// // note_event.dart
// import 'shared_event.dart';
//
// class AddTagToNote extends EntityEvent {
//   final String noteId;
//   final String tag;
//
//   AddTagToNote(this.noteId, this.tag);
// }
//
// Generic Bloc with Dynamic Handling
//
// The TaskBloc or NoteBloc can extend Bloc<EntityEvent, EntityState> and handle both shared and specific events dynamically using is checks.
//
// // task_bloc.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'shared_event.dart';
// import 'shared_state.dart';
// import 'task_event.dart';
//
// class TaskBloc extends Bloc<EntityEvent, EntityState> {
//   TaskBloc() : super(EntitiesLoading()) {
//     on<EntityEvent>((event, emit) {
//       if (event is LoadEntities) {
//         // Handle shared loading logic
//         emit(EntitiesLoading());
//         emit(EntitiesLoaded([
//           Task('1', 'Write Documentation'),
//           Task('2', 'Review PRs'),
//         ]));
//       } else if (event is MarkTaskAsCompleted) {
//         // Handle task-specific logic
//         if (state is EntitiesLoaded<Task>) {
//           final tasks = (state as EntitiesLoaded<Task>).entities.map((task) {
//             return task.id == event.taskId
//                 ? Task(task.id, '${task.title} (Completed)')
//                 : task;
//           }).toList();
//           emit(EntitiesLoaded(tasks));
//         }
//       }
//     });
//   }
// }
//
// class Task {
//   final String id;
//   final String title;
//
//   Task(this.id, this.title);
// }
//
// NoteBloc Example
//
// // note_bloc.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'shared_event.dart';
// import 'shared_state.dart';
// import 'note_event.dart';
//
// class NoteBloc extends Bloc<EntityEvent, EntityState> {
//   NoteBloc() : super(EntitiesLoading()) {
//     on<EntityEvent>((event, emit) {
//       if (event is LoadEntities) {
//         // Handle shared loading logic
//         emit(EntitiesLoading());
//         emit(EntitiesLoaded([
//           Note('1', 'Meeting Notes'),
//           Note('2', 'Project Ideas'),
//         ]));
//       } else if (event is AddTagToNote) {
//         // Handle note-specific logic
//         if (state is EntitiesLoaded<Note>) {
//           final notes = (state as EntitiesLoaded<Note>).entities.map((note) {
//             return note.id == event.noteId
//                 ? Note(note.id, '${note.content} (Tagged: ${event.tag})')
//                 : note;
//           }).toList();
//           emit(EntitiesLoaded(notes));
//         }
//       }
//     });
//   }
// }
//
// class Note {
//   final String id;
//   final String content;
//
//   Note(this.id, this.content);
// }
//
//
// ---------------------------------------------------------------
//
// abstract class BaseState extends Equatable {
//   final BlocStatus status;
//   final String? errorMessage;
//
//   const BaseState({this.status = BlocStatus.initial, this.errorMessage});
//
//   @override
//   List<Object?> get props => [status, errorMessage];
// }
//
// enum BlocStatus { initial, loading, loaded, error }
