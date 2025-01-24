import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef UpdateFunction<T extends DtoEntity> = void Function(
    BuildContext context, T itemDto, bool value);

class UpdateItemLogic {
  static final Map<Type, UpdateFunction> typeToUpdateFunction = {
    TaskDto: (BuildContext context, DtoEntity itemDto, bool value) {
      updateTaskUserLink(context, itemDto as TaskDto, value);
    },
    // Add mappings for other types
  };

  static void updateItemUserLink<T extends DtoEntity>(BuildContext context, T itemDto, bool value) {
    final updateFunction = typeToUpdateFunction[T];
    if (updateFunction != null) {
      updateFunction(context, itemDto, value);
    } else {
      throw UnimplementedError('Update logic not implemented for type ${T.runtimeType}');
    }
  }
}
