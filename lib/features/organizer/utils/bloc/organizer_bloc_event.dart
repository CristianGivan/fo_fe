import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerBlocEvent<T> extends Equatable {
  const OrganizerBlocEvent();

  @override
  List<Object> get props => [];
}

class AddItemBlocEvent<T, P> extends OrganizerBlocEvent<T> {
  final P item;

  const AddItemBlocEvent(this.item);

  @override
  List<Object> get props => [item as Object];
}

class UpdateItemBlocEvent<T, P> extends OrganizerBlocEvent<T> {
  final P item;

  const UpdateItemBlocEvent(this.item);

  @override
  List<Object> get props => [item as Object];
}

class UpdateDisplayItemsWithItemBlocEvent<T, P> extends OrganizerBlocEvent<T> {
  final P updatedItem;

  const UpdateDisplayItemsWithItemBlocEvent(this.updatedItem);

  @override
  List<Object> get props => [updatedItem as Object];
}

class GetItemsFromLogInUserBlocEvent<T, P> extends OrganizerBlocEvent<T> {
  final P param;

  const GetItemsFromLogInUserBlocEvent(this.param);

  @override
  List<Object> get props => [param as Object];
}

class DeleteItemBlocEvent<T, P> extends OrganizerBlocEvent<T> {
  final P id;

  const DeleteItemBlocEvent(this.id);

  @override
  List<Object> get props => [id as Object];
}
