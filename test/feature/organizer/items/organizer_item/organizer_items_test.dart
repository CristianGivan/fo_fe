import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/util/organizer/id_set.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_items.dart';

void main() {
  group('OrganizerItems', () {
    late OrganizerItems organizerItems;
    late OrganizerItemEntity organizerItem1;
    late OrganizerItemEntity organizerItem2;

    setUp(() {
      organizerItem1 = OrganizerItemEntity(
        id: 1,
        subject: 'Task 1', /* other properties */
      );
      organizerItem2 = OrganizerItemEntity(
        id: 2,
        subject: 'Task 2', /* other properties */
      );
      organizerItems =
          OrganizerItems(organizerItems: [organizerItem1, organizerItem2]);
    });

    test('adding an item should increase the size', () {
      final initialSize = organizerItems.size();
      organizerItems.add(OrganizerItemEntity(
        id: 3,
        subject: 'Task 3', /* other properties */
      ));
      expect(organizerItems.size(), equals(initialSize + 1));
    });

    test('removing an item should decrease the size', () {
      final initialSize = organizerItems.size();
      organizerItems.remove(organizerItem1);
      expect(organizerItems.size(), equals(initialSize - 1));
    });

    test('get item at index should return the correct item', () {
      expect(organizerItems.get(0), equals(organizerItem1));
    });

    test('contains should return true if item exists', () {
      expect(organizerItems.contains(organizerItem2), isTrue);
    });

    test('contains should return false if item does not exist', () {
      final nonExistingItem = OrganizerItemEntity(
        id: 100,
        subject: 'Non-existing Task', /* other properties */
      );
      expect(organizerItems.contains(nonExistingItem), isFalse);
    });

    test('any should return true if at least one item passes the test', () {
      expect(organizerItems.any((item) => item.id == 1), isTrue);
    });

    test('every should return true if all items pass the test', () {
      expect(organizerItems.every((item) => item.id >= 1), isTrue);
    });

    test('map should return a list of mapped items', () {
      final mappedList = organizerItems.map<String>((item) => item.subject);
      expect(mappedList, containsAll(['Task 1', 'Task 2']));
    });

    test('addAll should add all elements to the list', () {
      final initialSize = organizerItems.size();
      organizerItems.addAll([
        OrganizerItemEntity(
          id: 3,
          subject: 'Task 3', /* other properties */
        )
      ]);
      expect(organizerItems.size(), equals(initialSize + 1));
    });

    test('removeAt should remove item at specified index', () {
      final initialSize = organizerItems.size();
      organizerItems.removeAt(0);
      expect(organizerItems.size(), equals(initialSize - 1));
      expect(organizerItems.contains(organizerItem1), isFalse);
    });

    test('clear should remove all items from the list', () {
      organizerItems.clear();
      expect(organizerItems.size(), equals(0));
    });

    test('indexOf should return the index of the specified item', () {
      expect(organizerItems.indexOf(organizerItem2), equals(1));
    });

    test('mapToIdSet should return a valid IdSet', () {
      final idSet = organizerItems.mapToIdSet();
      expect(idSet.contains(1), isTrue);
      expect(idSet.contains(2), isTrue);
    });

    test('filterByIdSet should filter items based on IdSet', () {
      final idSet = IdSet({1});
      final filteredList = organizerItems.filterByIdSet(idSet);
      expect(filteredList.length, equals(1));
      expect(filteredList[0].id, equals(1));
    });
  });
}
