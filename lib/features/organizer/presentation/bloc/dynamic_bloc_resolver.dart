import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';


class DynamicBlocResolver<T extends ItemEntity> {
  static OrganizerBloc<T> resolveBloc<T extends ItemEntity>(BuildContext context) {
    if (T == TaskDto) {
      return context.read<TaskBloc>() as OrganizerBloc<T>;
    } else {
      throw Exception('Bloc for type $T not found. Ensure it is registered.');
    }
  }
}
