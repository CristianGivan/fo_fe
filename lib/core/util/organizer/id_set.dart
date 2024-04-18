import 'package:fo_fe/core/util/organizer/id_set_builder.dart';

import '../../../features/organizer/items/organizer_item/organizer_items.dart';

class IdSet {
  final Set<int> _ids;

  IdSet._(this._ids);

  factory IdSet.empty() => IdSet._({});

  factory IdSet.of(Iterable<int> ids) =>
      IdSet._(ids.where((id) => id != null).toSet());

  Set<int> toSet() => _ids.toSet();

  IdSetBuilder toBuilder() => IdSetBuilder(_ids);

  bool containsId(int id) => _ids.contains(id);

  bool isEmpty(int id) => _ids.isEmpty;

  int get size => _ids.length;

  int get first => _ids.first;

  int get last => _ids.last;

  bool contains(Object? other) => _ids.contains(other);

  @override
  bool operator ==(Object? other) {
    if (identical(this, other)) return true;
    return other is IdSet && _ids == other._ids;
  }

  @override
  int get hashCode => _ids.hashCode;

  @override
  String toString() => _ids.toString();

  void forEach(void Function(int id) f) => _ids.forEach(f);

  factory IdSet.fromOrganizerItems(OrganizerItems items) {
    return IdSet.of(
        items.where((item) => item.id != null).map((item) => item.id!));
  }
}
