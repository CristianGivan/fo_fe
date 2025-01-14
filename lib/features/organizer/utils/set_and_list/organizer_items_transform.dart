import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

extension OrganizerItemsTransform<T extends ItemEntity> on OrganizerItems<T> {
  OrganizerItems<R> convertTo<R extends ItemEntity>() {
    final transformedList = items.whereType<R>().toList();
    return OrganizerItems<R>.ofList(transformedList);
  }

  OrganizerItems<R> convertWith<R extends ItemEntity>(R Function(T item) transform) {
    final transformedList = items.map(transform).toList();
    return OrganizerItems<R>.ofList(transformedList);
  }

  OrganizerItems<R> convertWithSelected<R extends DtoEntity>() {
    final transformedList = items.whereType<R>().where((item) => item.userLink.isSelected).toList();
    return OrganizerItems<R>.ofList(transformedList);
  }
}
