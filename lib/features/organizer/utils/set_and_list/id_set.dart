import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/id_set_builder.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/organizer_items.dart';

class IdSet extends Equatable {
  final Set<int> _ids;

  const IdSet._(this._ids);

  const IdSet.empty() : _ids = const {};

  //todo -implement- what happens whern I get a null list
  factory IdSet.of(Iterable<int?> ids) => IdSet._(ids.whereType<int>().toSet());

  Set<int> toSet() => _ids.toSet();

  List<int> toList() => _ids.toList();

  IdSetBuilder toBuilder() => IdSetBuilder.of(_ids);

  bool contains(int? id) => _ids.contains(id);

  bool get isEmpty => _ids.isEmpty;

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
