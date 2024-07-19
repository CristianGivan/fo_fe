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
  final OrganizerItems<ReminderEntity> reminders;

  const ReminderItemsLoadedBlocState(this.reminders);

  @override
  List<Object?> get props => [reminders];
}

class ReminderErrorBlocState extends ReminderBlocState {
  final String message;

  const ReminderErrorBlocState(this.message);

  @override
  List<Object?> get props => [message];
}
