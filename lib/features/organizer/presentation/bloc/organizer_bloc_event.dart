import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerBlocEvent<ItemEntity> extends Equatable {
  const OrganizerBlocEvent();

  @override
  List<Object> get props => [];
}

class AddItemBlocEvent<ItemEntity, P> extends OrganizerBlocEvent<ItemEntity> {
  final P item;

  const AddItemBlocEvent(this.item);

  @override
  List<Object> get props => [item as Object];
}

class UpdateItemBlocEvent<ItemEntity, P> extends OrganizerBlocEvent<ItemEntity> {
  final P item;

  const UpdateItemBlocEvent(this.item);

  @override
  List<Object> get props => [item as Object];
}

class UpdateDisplayItemsWithItemBlocEvent<ItemEntity, P> extends OrganizerBlocEvent<ItemEntity> {
  final P params;

  const UpdateDisplayItemsWithItemBlocEvent(this.params);

  @override
  List<Object> get props => [params as Object];
}

class GetItemsFromLogInUserBlocEvent<ItemEntity, P> extends OrganizerBlocEvent<ItemEntity> {
  final P param;

  const GetItemsFromLogInUserBlocEvent(this.param);

  @override
  List<Object> get props => [param as Object];
}

class DeleteItemsBlocEvent<ItemEntity, P> extends OrganizerBlocEvent<ItemEntity> {
  final P params;

  const DeleteItemsBlocEvent(this.params);

  @override
  List<Object> get props => [params as Object];
}
