part of 'task_bloc.dart';

abstract class OrganizerBlocEvent extends Equatable {
  const OrganizerBlocEvent();

  @override
  List<Object> get props => [];
}

class GetItemsFromLogInUserBlocEvent<Type> extends OrganizerBlocEvent {
  final Type param;

  const GetItemsFromLogInUserBlocEvent(this.param);

  @override
  List<Object> get props => [param as Object];
}
