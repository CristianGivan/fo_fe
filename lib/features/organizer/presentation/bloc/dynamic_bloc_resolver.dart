import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class DynamicBlocResolver<T extends ItemEntity> {
  static OrganizerBloc<T> resolveBloc<T extends ItemEntity>(BuildContext context) {
    final blocType = _typeToBloc[T];
    if (blocType != null) {
      return context.read<OrganizerBloc<T>>();
    } else {
      throw Exception('Bloc for type $T not registered in _typeToBloc.');
    }
  }

  static final Map<Type, Type> _typeToBloc = {
    TaskDto: TaskBloc,
    TagDto: TagBloc,
  };
}
