import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

Widget buildBlocStateWidget({
  required OrganizerBlocState state,
  Widget Function(String?)? buildErrorState,
  Widget Function()? buildLoadingState,
  required Widget Function() buildLoadedState,
}) {
  switch (state.status) {
    case OrganizerBlocStatus.error:
      return (buildErrorState ?? _buildErrorState)(state.errorMessage);
    case OrganizerBlocStatus.initial:
    case OrganizerBlocStatus.loading:
      return (buildLoadingState ?? _buildLoadingIndicator)();
    case OrganizerBlocStatus.loaded:
      return buildLoadedState();
  }
}

Widget _buildErrorState(String? message) =>
    Center(child: Text(message ?? "Unknown error occurred"));

Widget _buildLoadingIndicator() {
  return const Center(child: CircularProgressIndicator());
}

Widget buildCubitStateWidget<T extends ItemEntity>({
  required OrganizerCubitState<T> state,
  required Widget Function(String?) buildErrorState,
  required Widget Function() buildLoadingState,
  required Widget Function(OrganizerItems<T>) buildLoadedState,
}) {
  switch (state.status) {
    case OrganizerCubitStatus.error:
      return buildErrorState(state.errorMessage);
    case OrganizerCubitStatus.loading:
      return buildLoadingState();
    case OrganizerCubitStatus.loaded:
      return buildLoadedState(state.entities ?? OrganizerItems<T>.empty());
    case OrganizerCubitStatus.initial:
  }
}
