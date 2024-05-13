part of 'core_util_organizer.dart';

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

  //todo violate DRY
  bool isEmpty() {
    return _organizerItems.isEmpty;
  }

  OrganizerItemsBuilder add(T organizerItem) {
    _organizerItems.add(organizerItem);
    //todo tests
    _sortedBy = SortedBy.none; // todo maybe I add it and left the items sorted
    return this;
  }

  OrganizerItemsBuilder addAllOrganizerItems(OrganizerItems<T> elements) {
    _organizerItems.addAll(elements._organizerItems);
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

  OrganizerItemsBuilder<T> updateItems(OrganizerItems<T> updatedAndNewItem) {
    List<T> result = [];
    if (updatedAndNewItem.isEmpty()) {
      return this;
    }
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
    // int k = 0;
    // for (int i = 0; i < _organizerItems.length; i++) {
    //   for (int j = k; j < updatedAndNewItem.size(); j++) {
    //     if (_organizerItems[i].remoteId ==
    //         updatedAndNewItem.getAt(j).remoteId) {
    //       result.add(updatedAndNewItem.getAt(j));
    //       k++;
    //       break;
    //     } else {
    //       result.add(_organizerItems[i]);
    //       break;
    //     }
    //   }
    // }
    _organizerItems = result;
    return this;
  }

  OrganizerItems<T> build() => OrganizerItems.of(_organizerItems);

  @override
  List<Object> get props => [_organizerItems, _sortedBy];

  @override
  // TODO: implement iterator
  Iterator<T> get iterator => throw UnimplementedError();
}
//
// class OrganizerItemsBuilder<T> {
//   // ... other methods and properties
//
//   OrganizerItems<T> replaceWithUpdates(OrganizerItems<T> updateItems) {
//     final existingItems = <int, T>{}; // Map to store existing items by remoteId
//
//     // Build a map of existing items with their remoteId as key
//     items.forEach((item) => existingItems[item.remoteId] = item);
//
//     final updatedItemsList =
//         updateItems.toList(); // Convert to a list for easier processing
//
//     // Replace existing items with updates based on remoteId
//     final updatedBuilder = OrganizerItemsBuilder<T>();
//     for (final updateItem in updatedItemsList) {
//       final existingItem = existingItems.remove(updateItem.remoteId);
//       if (existingItem != null) {
//         updatedBuilder.add(updateItem); // Add the updated item
//       } else {
//         // Add the update item if no existing item with the same remoteId is found
//         updatedBuilder.add(updateItem);
//       }
//     }
//
//     // Add remaining existing items (not updated)
//     existingItems.forEach((_, item) => updatedBuilder.add(item));
//
//     return updatedBuilder.build();
//   }
//
// // ... other methods
// }
//
// Stream<OrganizerItems<T>> replaceWithUpdatesStream(
//   OrganizerItems<T> organizerItems,
//   Stream<OrganizerItems<T>> updateItemsStream,
// ) {
//   return updateItemsStream.transform(
//     StreamTransformer<OrganizerItems<T>, OrganizerItems<T>>.fromHandlers(
//       handleData: (updateItems, sink) async {
//         final existingItemsMap = <int, T>{};
//         organizerItems
//             .forEach((item) => existingItemsMap[item.remoteId] = item);
//
//         final updatedList =
//             updateItems.toList(); // Convert to list for processing
//
//         final updatedBuilder = OrganizerItemsBuilder<T>();
//         for (final updateItem in updatedList) {
//           final existingItem = existingItemsMap.remove(updateItem.remoteId);
//           updatedBuilder
//               .add(existingItem ?? updateItem); // Add updated or original
//         }
//
//         existingItemsMap.forEach((_, item) => updatedBuilder.add(item));
//         sink.add(updatedBuilder.build());
//       },
//     ),
//   );
// }
