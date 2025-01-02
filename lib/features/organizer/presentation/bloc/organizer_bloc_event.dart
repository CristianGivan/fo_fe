import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerBlocEvent extends Equatable {
  const OrganizerBlocEvent();

  @override
  List<Object> get props => [];
}

class AddItemBlocEvent extends OrganizerBlocEvent {
  final ItemEntity item;

  const AddItemBlocEvent(this.item);

  @override
  List<Object> get props => [item];
}

class UpdateItemBlocEvent extends OrganizerBlocEvent {
  final ItemEntity item;

  const UpdateItemBlocEvent(this.item);

  @override
  List<Object> get props => [item];
}

class GetItemsFromLogInUserBlocEvent extends OrganizerBlocEvent {
  final int userId;

  const GetItemsFromLogInUserBlocEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class DeleteItemsBlocEvent extends OrganizerBlocEvent {
  final IdSet idSet;

  const DeleteItemsBlocEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}
