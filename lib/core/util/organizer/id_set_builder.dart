import 'package:equatable/equatable.dart';

import 'id_set.dart';

class IdSetBuilder extends Equatable {
  final Set<int> _ids;

  IdSetBuilder(this._ids);

  factory IdSetBuilder.empty() => IdSetBuilder({});

  factory IdSetBuilder.of(Iterable<int> ids) =>
      IdSetBuilder(ids.where((id) => id != null).toSet());

  Set<int> get ids => _ids;

  IdSetBuilder addId(int id) {
    if (id != null) {
      _ids.add(id);
    }
    return this;
  }

  IdSetBuilder addAll(Iterable<int> ids) {
    _ids.addAll(ids.where((id) => id != null));
    return this;
  }

  IdSetBuilder removeId(int id) {
    _ids.remove(id);
    return this;
  }

  IdSet build() => IdSet.of(_ids);

  @override
  List<Object?> get props => [_ids];
}
