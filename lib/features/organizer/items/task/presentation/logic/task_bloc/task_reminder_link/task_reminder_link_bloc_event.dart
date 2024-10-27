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

class AddReminderToTaskBlocEvent extends TaskReminderLinkBlocEvent {
  final int taskId;
  final ReminderEntity reminder;

  AddReminderToTaskBlocEvent(this.taskId, this.reminder);

  @override
  List<Object> get props => [taskId, reminder];
}

class AddReminderItemsToTaskBlocEvent extends TaskReminderLinkBlocEvent {
  final int taskId;
  final IdSet reminderIds;

  AddReminderItemsToTaskBlocEvent(
      {required this.taskId, required this.reminderIds});

  @override
  List<Object> get props => [taskId, reminderIds];
}

//todo -dry- as for tag
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

class DeleteReminderFromTaskBlocEvent extends TaskReminderLinkBlocEvent {
  final int taskId;
  final int reminderId;

  DeleteReminderFromTaskBlocEvent(this.taskId, this.reminderId);

  @override
  List<Object> get props => [taskId, reminderId];
}
