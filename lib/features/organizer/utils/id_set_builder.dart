import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

class IdSetBuilder extends Equatable {
  final Set<int> _ids;

  const IdSetBuilder._(this._ids);

  factory IdSetBuilder.empty() => const IdSetBuilder._({});

  factory IdSetBuilder.of(Iterable<int?> ids) {
    return IdSetBuilder._(ids.whereType<int>().toSet());
  }

  Set<int> get ids => _ids;

  IdSetBuilder add(int? id) {
    if (id != null) {
      _ids.add(id);
    }
    return this;
  }

  IdSetBuilder addAll(Iterable<int?> ids) {
    _ids.addAll(ids.whereType<int>());
    return this;
  }

  IdSetBuilder remove(int id) {
    _ids.remove(id);
    return this;
  }

  IdSet build() => IdSet.of(_ids);

  @override
  List<Object?> get props => [_ids];
}
