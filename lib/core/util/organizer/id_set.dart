part of 'core_util_organizer.dart';

class IdSet extends Equatable {
  final Set<int> _ids;

  IdSet._(this._ids);

  factory IdSet.empty() => IdSet._({});

  factory IdSet.of(Iterable<int?> ids) => IdSet._(ids.whereType<int>().toSet());

  Set<int> toSet() => _ids.toSet();

  IdSetBuilder toBuilder() => IdSetBuilder.of(_ids);

  bool contains(int? id) => _ids.contains(id);

  bool isEmpty() => _ids.isEmpty;

  int get size => _ids.length;

  int get first {
    if (_ids.isEmpty) {
      throw StateError('IdSet is empty. Cannot get first element.');
    }
    return _ids.first;
  }

  int get last {
    if (_ids.isEmpty) {
      throw StateError('IdSet is empty. Cannot get last element.');
    }
    return _ids.last;
  }

  void forEach(void Function(int id) f) => _ids.forEach(f);

  factory IdSet.fromOrganizerItems(OrganizerItems items) {
    return IdSet.of(items.map((item) => item.id).whereType<int>());
  }

  @override
  String toString() => _ids.toString();

  @override
  List<Object> get props => [_ids];
}
