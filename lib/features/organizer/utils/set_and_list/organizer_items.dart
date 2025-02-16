import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class OrganizerItems<T extends ItemEntity> extends Equatable {
  final List<T> _organizerItems;

  const OrganizerItems._(this._organizerItems);

  factory OrganizerItems.empty() => OrganizerItems._(<T>[]);

  factory OrganizerItems.ofList(List<T> items) => OrganizerItems._(items);

  factory OrganizerItems.of(Iterable<T> organizerItems, {SortedBy sortedBy = SortedBy.none}) =>
      OrganizerItems._(organizerItems.whereType<T>().toList());

  OrganizerItemsBuilder<T> toBuilder() => OrganizerItemsBuilder.of(_organizerItems);

  List<T> get items => _organizerItems;

  List<T> toList() => _organizerItems.toList();

  int size() => _organizerItems.length;

  int indexOf(T organizerItem) {
    return _organizerItems.indexOf(organizerItem);
  }

  T getAt(int index) => _organizerItems[index];

  T getById(int id) => _organizerItems.firstWhere((element) => element.id == id);

  OrganizerItems<T> getAddedItems(OrganizerItems<T>? newItems) {
    if (newItems == null) {
      return this;
    }
    return OrganizerItems.of(newItems.where((element) => !_organizerItems.contains(element)));
  }

  OrganizerItems<T> getRemovedItems(OrganizerItems<T>? newItems) {
    if (newItems == null) {
      return this;
    }
    return OrganizerItems.of(_organizerItems.where((element) => !newItems.contains(element)));
  }

  bool get isEmpty {
    return _organizerItems.isEmpty;
  }

  bool contains(T organizerItem) {
    if (_organizerItems.isEmpty) {
      return false;
    }
    return _organizerItems.contains(organizerItem);
  }

  bool any(bool Function(T element) test) {
    return _organizerItems.any(test);
  }

  bool every(bool Function(T element) test) => _organizerItems.every(test);

  List<R> map<R>(R Function(T) f) => _organizerItems.map(f).toList();

// todo to be moved in builder
  OrganizerItems filterByIdSet(IdSet idSet) {
    final filteredItems = _organizerItems.where((element) => idSet.contains(element.id)).toList();
    return OrganizerItems.of(filteredItems);
  }

  OrganizerItems<T> filterByQuery(String query) {
    final filteredItems = toBuilder().filterByQuery(query).build();
    return filteredItems;
  }

  IdSet toIdSet() => IdSet.fromOrganizerItems(OrganizerItems.of(_organizerItems));

  List<int> getIdList() => _organizerItems.map((e) => e.id).toList();

  // //todo tests
  // OrganizerItems updateItems(OrganizerItems<T> updateItems) {
  //
  // }

  T firstWhere(bool Function(T) test, {T Function()? orElse}) {
    return _organizerItems.firstWhere(test, orElse: orElse);
  }

// //todo tests
//   Iterable<Map<String, dynamic>> createJsonToCheckForUpdates() {
//     return _organizerItems.map((e) => e.jsonToCheckForUpdates());
//   }

  void sort(Comparator<T> comparator) => _organizerItems.sort(comparator);

  Iterable<T> where(bool Function(T) test) => _organizerItems.where(test);

  OrganizerItems<T> copyWithUpdatedItem(T updatedItem) {
    return toBuilder().updateItem(updatedItem).build();
  }

  OrganizerItems<T> copyWithAddedItem(T newItem) {
    return toBuilder().add(newItem).build();
  }

  OrganizerItems<T> copyWithRemovedItem(T deletedItem) {
    return toBuilder().remove(deletedItem).build();
  }

  OrganizerItems<T> copyWithRemovedItemWitId(int id) {
    return toBuilder().removeItemWithId(id).build();
  }

  OrganizerItems<T> copyWithRemovedItems(OrganizerItems<T> items) {
    return toBuilder().removeItemsWithSameId(items).build();
  }

  OrganizerItems<T> copyWithRemoveItemsWithSameId(OrganizerItems<T> items) {
    return toBuilder().removeItemsWithSameId(items).build();
  }

  OrganizerItems<T> copyWithRemovedItemsWitIds(IdSet ids) {
    return toBuilder().removeItemsWithIds(ids).build();
  }

  @override
  List<Object> get props => [_organizerItems];
}
