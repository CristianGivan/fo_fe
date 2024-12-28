part of '../task_bloc.dart';

abstract class TaskReminderLinkBlocEvent extends Equatable {
  const TaskReminderLinkBlocEvent();

  @override
  List<Object> get props => [];
}

class GetReminderItemsByTaskIdBlocEvent extends TaskReminderLinkBlocEvent {
  final int taskId;

  GetReminderItemsByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class UpdateReminderItemsOfTaskBlocEvent extends TaskReminderLinkBlocEvent {
  final int taskId;
  final OrganizerItems<ReminderEntity> reminderItems;
  final OrganizerItems<ReminderEntity> updatedReminderItems;

  UpdateReminderItemsOfTaskBlocEvent({
    required this.taskId,
    required this.reminderItems,
    required this.updatedReminderItems,
  });
}
