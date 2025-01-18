import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum OrganizerCubitStatus { initial, loading, loaded, error }

abstract class OrganizerCubit<T extends ItemEntity> extends Cubit<OrganizerCubitState<T>> {
  OrganizerCubit() : super(OrganizerCubitState.initial());

  Future<void> getEntitiesFromUser(int userId);
}

class OrganizerCubitState<T extends ItemEntity> {
  final OrganizerCubitStatus status;
  final OrganizerItems<T>? entities;
  final String? errorMessage;

  const OrganizerCubitState({
    required this.status,
    this.entities,
    this.errorMessage,
  });

  factory OrganizerCubitState.initial() =>
      const OrganizerCubitState(status: OrganizerCubitStatus.initial);

  factory OrganizerCubitState.loading() =>
      const OrganizerCubitState(status: OrganizerCubitStatus.loading);

  factory OrganizerCubitState.loaded(OrganizerItems<T> entities) =>
      OrganizerCubitState(status: OrganizerCubitStatus.loaded, entities: entities);

  factory OrganizerCubitState.error(String errorMessage) =>
      OrganizerCubitState(status: OrganizerCubitStatus.error, errorMessage: errorMessage);
}
