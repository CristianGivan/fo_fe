class IdSet {
  final Set<int> _idSet;

  IdSet(Set<int> idSet) : _idSet = idSet;

  static IdSet empty() {
    return IdSet(<int>{});
  }

  void addId(int id) {
    _idSet.add(id);
  }

  void removeId(int id) {
    _idSet.remove(id);
  }

  bool containsId(int id) {
    return _idSet.contains(id);
  }

  int get size {
    return _idSet.length;
  }

  int get first {
    return _idSet.first;
  }

  Iterable<int> get ids {
    return _idSet;
  }

// todo nullable is ok?
  bool any(int? id) {
    return _idSet.any((element) => element == id);
  }

  void clear() {
    _idSet.clear();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IdSet &&
        _idSet.length == other._idSet.length &&
        _idSet.containsAll(other._idSet);
  }

  @override
  int get hashCode {
    return _idSet.hashCode;
  }

  @override
  String toString() {
    return _idSet.toString();
  }
}
