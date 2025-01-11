import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerLinkBlocEvent extends Equatable {
  const OrganizerLinkBlocEvent();

  @override
  List<Object> get props => [];
}

class GetItemsOfItemBlocEvent extends OrganizerLinkBlocEvent {
  final ItemsLinkParams params;

  const GetItemsOfItemBlocEvent(this.params);

  @override
  List<Object> get props => [params];
}

class UpdateItemsOfItemBlocEvent extends OrganizerLinkBlocEvent {
  final ItemParams params;

  const UpdateItemsOfItemBlocEvent(this.params);

  @override
  List<Object> get props => [params];
}
