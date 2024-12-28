part of 'reminder_bloc.dart';

abstract class ReminderBlocState extends Equatable {
  const ReminderBlocState();

  @override
  List<Object?> get props => [];
}

class ReminderInitialBlocState extends ReminderBlocState {}

class ReminderLoadingBlocState extends ReminderBlocState {}

class ReminderLoadedBlocState extends ReminderBlocState {
  final ReminderEntity reminder;

  const ReminderLoadedBlocState(this.reminder);

  @override
  List<Object?> get props => [reminder];
}

class ReminderItemsLoadedBlocState extends ReminderBlocState {
  final OrganizerItems<ReminderEntity> reminderItems;

  const ReminderItemsLoadedBlocState(this.reminderItems);

  @override
  List<Object?> get props => [reminderItems];
}

class ReminderErrorBlocState extends ReminderBlocState {
  final String message;

  const ReminderErrorBlocState(this.message);

  @override
  List<Object?> get props => [message];
}

class ReminderSuccessBlocState extends ReminderBlocState {
  final int id;

  ReminderSuccessBlocState(this.id);

  @override
  List<Object> get props => [id];
}

class SingleReminderLoadedBlocState extends ReminderBlocState {
  final ReminderEntity reminder;

  SingleReminderLoadedBlocState(this.reminder);

  @override
  List<Object> get props => [reminder];
}
