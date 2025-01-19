import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerLinkBlocEvent extends Equatable {
  const OrganizerLinkBlocEvent();

  @override
  List<Object> get props => [];
}

class GetItemsOfItemBlocEvent extends OrganizerLinkBlocEvent {
  final ItemLinkParams params;

  const GetItemsOfItemBlocEvent(this.params);

  @override
  List<Object> get props => [params];
}

class UpdateItemsOfItemBlocEvent<T extends ItemEntity> extends OrganizerLinkBlocEvent {
  final UpdateLinkParams<T> params;

  const UpdateItemsOfItemBlocEvent(this.params);

  @override
  List<Object> get props => [params];
}
