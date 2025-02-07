import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/item_add_params.dart';

abstract class OrganizerBlocEvent extends Equatable {
  const OrganizerBlocEvent();

  @override
  List<Object> get props => [];
}

class AddItemBlocEvent extends OrganizerBlocEvent {
  final AddItemParams params;

  const AddItemBlocEvent(this.params);

  @override
  List<Object> get props => [params];
}

class UpdateItemBlocEvent extends OrganizerBlocEvent {
  final ItemEntity item;

  const UpdateItemBlocEvent(this.item);

  @override
  List<Object> get props => [item];
}

class GetItemsFromLogInUserBlocEvent extends OrganizerBlocEvent {
  final ItemParams params;

  const GetItemsFromLogInUserBlocEvent(this.params);

  @override
  List<Object> get props => [params];
}

class DeleteItemsBlocEvent extends OrganizerBlocEvent {
  final IdSet idSet;

  const DeleteItemsBlocEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}
