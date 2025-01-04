import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class OrganizerLinkBlocEvent extends Equatable {
  const OrganizerLinkBlocEvent();

  @override
  List<Object> get props => [];
}

class GetLinkItemsByItemIdBlocEvent extends OrganizerLinkBlocEvent {
  final ItemParams params;

  const GetLinkItemsByItemIdBlocEvent(this.params);

  @override
  List<Object> get props => [params];
}
