import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

void main() {
  group('OrganizerItems', () {
    late OrganizerItems organizerItems;
    late OrganizerItemEntity organizerItem1;
    late OrganizerItemEntity organizerItem2;

    setUp(() {
      organizerItem1 = OrganizerItemEntity(
        id: 1,
      );
      organizerItem2 = OrganizerItemEntity(
        id: 2,
      );
      organizerItems = OrganizerItems.of([organizerItem1, organizerItem2]);
    });

    test('get item at index should return the correct item', () {
      expect(organizerItems.getAt(0), equals(organizerItem1));
    });

    test('contains should return true if item exists', () {
      expect(organizerItems.contains(organizerItem2), isTrue);
    });

    test('contains should return false if item does not exist', () {
      final nonExistingItem = OrganizerItemEntity(
        id: 100,
      );
      expect(organizerItems.contains(nonExistingItem), isFalse);
    });

    test('any should return true if at least one item passes the test', () {
      expect(organizerItems.any((item) => item.id == 1), isTrue);
    });

    test('every should return true if all items pass the test', () {
      expect(organizerItems.every((item) => item.id >= 1), isTrue);
    });

    test('indexOf should return the index of the specified item', () {
      expect(organizerItems.indexOf(organizerItem2), equals(1));
    });

    group('isEmpty', () {
      test('returns true for empty list', () {
        final organizerItems = OrganizerItems.empty();
        expect(organizerItems.isEmpty(), equals(true));
      });

      test('returns false for non-empty list', () {
        final organizerItems = OrganizerItems.of([
          OrganizerItemEntity(id: 1),
        ]);
        expect(organizerItems.isEmpty(), equals(false));
      });
    });

    group('filterByIdSet', () {
      test('filterByIdSet filters items correctly', () {
        // Arrange
        final idSet = IdSet.of(const [1, 3, 5]); // Example IdSet with IDs to filter by
        final items = OrganizerItems.of([
          OrganizerItemEntity(id: 1),
          OrganizerItemEntity(id: 2),
          OrganizerItemEntity(id: 3),
          OrganizerItemEntity(id: 4),
          OrganizerItemEntity(id: 5),
        ]);

        // Act
        final filteredItems = items.filterByIdSet(idSet);

        // Assert
        expect(filteredItems.size(), equals(3)); // Expecting 3 items after filtering
        expect(filteredItems.contains(OrganizerItemEntity(id: 1)), isTrue);
        expect(filteredItems.contains(OrganizerItemEntity(id: 2)), isFalse);
        expect(filteredItems.contains(OrganizerItemEntity(id: 3)), isTrue);
        expect(filteredItems.contains(OrganizerItemEntity(id: 5)), isTrue);
      });
    });
  });
}
