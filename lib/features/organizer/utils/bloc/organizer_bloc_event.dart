import 'package:fo_fe/core/utils/exports/external_exports.dart';

abstract class OrganizerBlocEvent extends Equatable {
  const OrganizerBlocEvent();

  @override
  List<Object> get props => [];
}

class AddItemBlocEvent<ItemEntity> extends OrganizerBlocEvent {
  final ItemEntity item;

  const AddItemBlocEvent(this.item);

  @override
  List<Object> get props => [item as Object];
}

class UpdateItemBlocEvent<ItemEntity> extends OrganizerBlocEvent {
  final ItemEntity item;

  const UpdateItemBlocEvent(this.item);

  @override
  List<Object> get props => [item as Object];
}

class UpdateDisplayItemsWithItemBlocEvent<ItemEntity> extends OrganizerBlocEvent {
  final ItemEntity updatedDisplayedTasks;

  const UpdateDisplayItemsWithItemBlocEvent(this.updatedDisplayedTasks);

  @override
  List<Object> get props => [updatedDisplayedTasks as Object];
}

class GetItemsFromLogInUserBlocEvent<Type> extends OrganizerBlocEvent {
  final Type param;

  const GetItemsFromLogInUserBlocEvent(this.param);

  @override
  List<Object> get props => [param as Object];
}

class DeleteItemBlocEvent<int> extends OrganizerBlocEvent {
  final int taskId;

  const DeleteItemBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId as Object];
}
