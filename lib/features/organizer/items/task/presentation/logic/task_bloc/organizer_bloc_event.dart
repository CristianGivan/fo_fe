part of 'task_bloc_try.dart';

abstract class OrganizerBlocEvent<Type> extends Equatable {
  const OrganizerBlocEvent();

  @override
  List<Object> get props => [];
}

class GetItemsFromLogInUserBlocEvent<Type, ItemParams> extends OrganizerBlocEvent<Type> {
  final ItemParams param;

  const GetItemsFromLogInUserBlocEvent(this.param);

  @override
  List<Object> get props => [param as Object];
}
