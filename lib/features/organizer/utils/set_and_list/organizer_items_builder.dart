import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class OrganizerItemsBuilder<T extends ItemEntity> extends Equatable {
  // I don't know if it is a good decision but:
  // this class is immutable because I don't want to many copies of an object
  // I will if I have to change it but lets start so.
  List<T> _organizerItems;
  SortedBy _sortedBy; // to don't sort if I all ready sort the

  final Map<SortedBy, Function(List<T>)> _sortingFunctions = {
    SortedBy.none: (items) => {},
    SortedBy.remoteIdAscending: (items) => items.sort((a, b) => a.remoteId.compareTo(b.remoteId)),
    SortedBy.remoteIdDescending: (items) => items.sort((a, b) => b.remoteId.compareTo(a.remoteId)),
  };

  OrganizerItemsBuilder._(this._organizerItems, this._sortedBy);

  factory OrganizerItemsBuilder.empty() => OrganizerItemsBuilder._(const [], SortedBy.none);

  factory OrganizerItemsBuilder.of(List<T> organizerItems, {SortedBy sortedBy = SortedBy.none}) =>
      OrganizerItemsBuilder._(organizerItems.whereType<T>().toList(), sortedBy);

  SortedBy get sortedBy => _sortedBy;

  List<T> get organizerItems => _organizerItems;

  bool contains(T organizerItem) {
    return _organizerItems.contains(organizerItem);
  }

  OrganizerItemsBuilder<T> add(T item) {
    _organizerItems.add(item);
    return this;
  }

  OrganizerItemsBuilder addAll(OrganizerItems<T> elements) {
    _organizerItems.addAll(elements.toList());
    //todo tests
    _sortedBy = SortedBy.none; // todo maybe I add it and left the items sorted
    return this;
  }

  OrganizerItemsBuilder<T> remove(T organizerItem) {
    _organizerItems.remove(organizerItem);
    return this;
  }

  OrganizerItemsBuilder<T> removeItemWithId(int id) {
    _organizerItems.removeWhere((element) => element.id == id);
    return this;
  }

  OrganizerItemsBuilder<T> removeItems(OrganizerItems<T> elements) {
    _organizerItems.removeWhere((element) => elements.contains(element));
    return this;
  }

  OrganizerItemsBuilder<T> removeItemsWithSameId(OrganizerItems<T> elements) {
    _organizerItems.removeWhere((element) => elements.any((e) => e.id == element.id));
    return this;
  }

  OrganizerItemsBuilder<T> removeItemsWithIds(IdSet ids) {
    _organizerItems.removeWhere((element) => ids.contains(element.id));
    return this;
  }

  OrganizerItemsBuilder removeAt(int index) {
    if (_organizerItems.isEmpty) {
      throw StateError('Cannot remove item from an empty list');
    }
    if (index < 0 || index >= _organizerItems.length) {
      throw RangeError.index(index, _organizerItems, 'Index out of range');
    }
    _organizerItems.removeAt(index);
    return this;
  }

// todo tests
  OrganizerItemsBuilder<T> sortBy(SortedBy sortBy) {
    final sortFunction = _sortingFunctions[sortBy];
    if (sortFunction != null) {
      sortFunction(_organizerItems);
      _sortedBy = sortBy;
    } else {
      throw ArgumentError('Unsupported sorting criteria: $sortBy');
    }
    return this;
  }

  //todo implement and tests
  OrganizerItemsBuilder<T> updateItem(T organizerItem) {
    final index = _organizerItems.indexWhere((item) => item.id == organizerItem.id);
    if (index != -1) {
      _organizerItems[index] = organizerItem;
    } else {
      throw ArgumentError('Item with id ${organizerItem.id} not found');
    }
    return this;
  }

  OrganizerItemsBuilder<T> filterByQuery(String query) {
    _organizerItems = _organizerItems
        .where((item) => item.subject.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return this;
  }

  OrganizerItems<T> build() => OrganizerItems.of(_organizerItems);

  @override
  List<Object> get props => [_organizerItems, _sortedBy];

  OrganizerItemsBuilder<T> updateItems(OrganizerItems<T> updatedAndNewItem) {
    List<T> result = [];
    if (updatedAndNewItem.isEmpty) {
      return this;
    }

    //todo functional style

    //v02 - working imperative style
    this.sortBy(SortedBy.remoteIdAscending);
    updatedAndNewItem.toBuilder().sortBy(SortedBy.remoteIdAscending);
    int k = 0;

    for (int i = 0; i < updatedAndNewItem.size(); i++) {
      if (k <= _organizerItems.length - 1) {
        for (int j = k; j < _organizerItems.length; j++) {
          if (updatedAndNewItem.getAt(i).remoteId == _organizerItems[j].remoteId) {
            result.add(updatedAndNewItem.getAt(i));
            k = j + 1;
            break;
          } else {
            result.add(_organizerItems[j]);
          }
        }
      } else {
        result.add(updatedAndNewItem.getAt(i));
      }
    }
    _organizerItems = result;
    return this;
  }
}
