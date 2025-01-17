import 'package:fo_fe/features/organizer/all_items/tag/presentation/cubit/tag_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/user/presentation/user_cubit.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class LinkCubitFactory {
  static Cubit getCubit(BuildContext context, ItemsTypeEnum itemsType) {
    switch (itemsType) {
      case ItemsTypeEnum.taskTag:
        return context.read<TagCubit>();
      case ItemsTypeEnum.taskUser:
        return context.read<UserCubit>();
      default:
        throw Exception('Unknown ItemsTypeEnum value: $itemsType');
    }
  }
}
