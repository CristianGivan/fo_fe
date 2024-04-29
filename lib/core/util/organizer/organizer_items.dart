part of 'core_util_organizer.dart';

class OrganizerItems<T extends OrganizerItemEntity> extends Equatable {
  final List<T> _organizerItems;

  OrganizerItems._(this._organizerItems);

  factory OrganizerItems.empty() => OrganizerItems._([]);

  factory OrganizerItems.of(Iterable<T> organizerItems) =>
      OrganizerItems._(organizerItems.whereType<T>().toList());

  OrganizerItemsBuilder toBuilder() =>
      OrganizerItemsBuilder.of(_organizerItems);

  List<T> toList() => _organizerItems.toList();

  int size() => _organizerItems.length;

  int indexOf(T organizerItem) {
    return _organizerItems.indexOf(organizerItem);
  }

  T getAt(int index) => _organizerItems[index];

  bool isEmpty() {
    return _organizerItems.isEmpty;
  }

  bool contains(T organizerItem) {
    return _organizerItems.contains(organizerItem);
  }

  bool any(bool Function(T element) test) {
    return _organizerItems.any(test);
  }

  bool every(bool Function(T element) test) => _organizerItems.every(test);

  List<R> map<R>(R Function(T) f) => _organizerItems.map(f).toList();

  OrganizerItems filterByIdSet(IdSet idSet) {
    final filteredItems =
        _organizerItems.where((element) => idSet.contains(element.id)).toList();
    return OrganizerItems.of(filteredItems);
  }

  @override
  List<Object> get props => [_organizerItems];
}
