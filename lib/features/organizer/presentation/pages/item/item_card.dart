import 'package:fo_fe/features/organizer/all_items/tag/presentation/pages/tag_card_page.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/pages/task_card.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/presentation/pages/user_card.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef WidgetBuilderFunction<T extends ItemEntity> = Widget Function(T item);

class ItemCard<T extends ItemEntity> extends StatelessWidget {
  final T itemDto;

  const ItemCard(this.itemDto, {super.key});

  static final Map<Type, WidgetBuilderFunction> _typeToWidgetBuilder = {
    TaskEntity: (item) => TaskCard(item as TaskEntity),
    TagEntity: (item) => TagCard(item as TagEntity),
    UserEntity: (item) => UserCard(item as UserEntity),
  };

  @override
  Widget build(BuildContext context) {
    final builder = _typeToWidgetBuilder[T];
    if (builder != null) {
      return builder(itemDto);
    }
    return ListTile(
      title: Text("Type not identified"),
    );
  }
}
