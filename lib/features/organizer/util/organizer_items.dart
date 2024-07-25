import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/util/organizer_items_builder.dart';
import 'package:fo_fe/features/organizer/util/organizer_sorting.dart';

class OrganizerItems<T extends OrganizerItemEntity> extends Equatable {
  final List<T> _organizerItems;

  OrganizerItems._(this._organizerItems);

  factory OrganizerItems.empty() => OrganizerItems._([]);

  factory OrganizerItems.of(Iterable<T> organizerItems,
          {SortedBy sortedBy = SortedBy.none}) =>
      OrganizerItems._(organizerItems.whereType<T>().toList());

  OrganizerItemsBuilder<T> toBuilder() =>
      OrganizerItemsBuilder.of(_organizerItems);

  // SortedBy get sortedBy => _sortedBy;

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

// todo to be moved in builder
  OrganizerItems filterByIdSet(IdSet idSet) {
    final filteredItems =
        _organizerItems.where((element) => idSet.contains(element.id)).toList();
    return OrganizerItems.of(filteredItems);
  }

  // //todo tests
  // OrganizerItems updateItems(OrganizerItems<T> updateItems) {
  //
  // }

  T firstWhere(bool Function(T) test, {T Function()? orElse}) {
    return _organizerItems.firstWhere(test, orElse: orElse);
  }

//todo tests
  Iterable<Map<String, dynamic>> createJsonToCheckForUpdates() {
    return _organizerItems.map((e) => e.jsonToCheckForUpdates());
  }

  @override
  List<Object> get props => [_organizerItems];
}
