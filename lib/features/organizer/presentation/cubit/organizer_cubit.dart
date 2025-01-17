import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum OrganizerCubitStatus { initial, loading, loaded, error }

class OrganizerState<T extends ItemEntity> {
  final OrganizerCubitStatus status;
  final OrganizerItems<T>? entities;
  final String? errorMessage;

  const OrganizerState({
    required this.status,
    this.entities,
    this.errorMessage,
  });

  factory OrganizerState.initial() => const OrganizerState(status: OrganizerCubitStatus.initial);

  factory OrganizerState.loading() => const OrganizerState(status: OrganizerCubitStatus.loading);

  factory OrganizerState.loaded(OrganizerItems<T> entities) =>
      OrganizerState(status: OrganizerCubitStatus.loaded, entities: entities);

  factory OrganizerState.error(String errorMessage) =>
      OrganizerState(status: OrganizerCubitStatus.error, errorMessage: errorMessage);
}

abstract class OrganizerCubit<T extends ItemEntity> extends Cubit<OrganizerState<T>> {
  OrganizerCubit() : super(OrganizerState.initial());

  Future<void> getEntitiesFromUser(int userId);

  Future<void> updateEntities(List<T> entities);
}
