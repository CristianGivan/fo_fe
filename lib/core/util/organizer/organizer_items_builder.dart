part of 'core_util_organizer.dart';

class OrganizerItemsBuilder<T extends OrganizerItemEntity> extends Equatable {
  final List<T> _organizerItems;

  OrganizerItemsBuilder._(this._organizerItems);

  factory OrganizerItemsBuilder.empty() => OrganizerItemsBuilder._([]);

  factory OrganizerItemsBuilder.of(List<T> organizerItems) =>
      OrganizerItemsBuilder._(organizerItems.whereType<T>().toList());

  OrganizerItemsBuilder add(T organizerItem) {
    _organizerItems.add(organizerItem);
    return this;
  }

  OrganizerItemsBuilder addAll(Iterable<T> elements) {
    _organizerItems.addAll(elements);
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

  //
  // OrganizerItemsBuilder updateItem(T optimizerItem) {
  //   if (optimizerItem.remoteId)
  // }

  OrganizerItems build() => OrganizerItems.of(_organizerItems);

  @override
  List<Object> get props => [_organizerItems];
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
