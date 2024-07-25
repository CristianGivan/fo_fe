import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/util/organizer_sorting.dart';

class OrganizerItemsBuilder<T extends OrganizerItemEntity> extends Equatable {
  // I don't know if it is a good decision but:
  // this class is immutable because I don't want to many copies of an object
  // I will if I have to change it but lets start so.
  List<T> _organizerItems;
  SortedBy _sortedBy; // to don't sort if I all ready sort the

  final Map<SortedBy, Function(List<T>)> _sortingFunctions = {
    SortedBy.none: (items) => {},
    SortedBy.remoteIdAscending: (items) =>
        items.sort((a, b) => a.remoteId.compareTo(b.remoteId)),
    SortedBy.remoteIdDescending: (items) =>
        items.sort((a, b) => b.remoteId.compareTo(a.remoteId)),
  };

  OrganizerItemsBuilder._(this._organizerItems, this._sortedBy);

  factory OrganizerItemsBuilder.empty() =>
      OrganizerItemsBuilder._([], SortedBy.none);

  factory OrganizerItemsBuilder.of(List<T> organizerItems,
          {SortedBy sortedBy = SortedBy.none}) =>
      OrganizerItemsBuilder._(organizerItems.whereType<T>().toList(), sortedBy);

  SortedBy get sortedBy => _sortedBy;

  List<T> get organizerItems => _organizerItems;

  OrganizerItemsBuilder add(T organizerItem) {
    _organizerItems.add(organizerItem);
    //todo tests
    _sortedBy = SortedBy.none; // todo maybe I add it and left the items sorted
    return this;
  }

  OrganizerItemsBuilder addAll(OrganizerItems<T> elements) {
    _organizerItems.addAll(elements.toList());
    //todo tests
    _sortedBy = SortedBy.none; // todo maybe I add it and left the items sorted
    return this;
  }

  OrganizerItemsBuilder remove(T organizerItem) {
    _organizerItems.remove(organizerItem);
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
  OrganizerItemsBuilder<T> updateItem(T optimizerItem) {
    return this;
  }

  OrganizerItems<T> build() => OrganizerItems.of(_organizerItems);

  @override
  List<Object> get props => [_organizerItems, _sortedBy];

  OrganizerItemsBuilder<T> updateItems(OrganizerItems<T> updatedAndNewItem) {
    List<T> result = [];
    if (updatedAndNewItem.isEmpty()) {
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
          if (updatedAndNewItem.getAt(i).remoteId ==
              _organizerItems[j].remoteId) {
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
