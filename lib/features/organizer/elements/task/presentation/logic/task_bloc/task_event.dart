part of '../../../task_lib.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetTaskByIdEvent extends TaskEvent {
  final String numberString;

  const GetTaskByIdEvent({
    required this.numberString,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [numberString];
}
