part of 'reminder_bloc.dart';

abstract class ReminderBlocEvent extends Equatable {
  const ReminderBlocEvent();

  @override
  List<Object?> get props => [];
}

class InsertReminderBlocEvent extends ReminderBlocEvent {
  final ReminderEntity reminder;

  const InsertReminderBlocEvent(this.reminder);

  @override
  List<Object?> get props => [reminder];
}

class UpdateReminderBlocEvent extends ReminderBlocEvent {
  final ReminderEntity reminder;

  const UpdateReminderBlocEvent(this.reminder);

  @override
  List<Object?> get props => [reminder];
}

class DeleteReminderBlocEvent extends ReminderBlocEvent {
  final int id;

  const DeleteReminderBlocEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetReminderByIdBlocEvent extends ReminderBlocEvent {
  final int id;

  const GetReminderByIdBlocEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetReminderItemsAllBlocEvent extends ReminderBlocEvent {}

class GetReminderItemsByIdSetBlocEvent extends ReminderBlocEvent {
  final IdSet idSet;

  const GetReminderItemsByIdSetBlocEvent({required this.idSet});

  @override
  List<Object?> get props => [idSet];
}
