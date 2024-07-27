import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:test/test.dart';

import '../../helpers/fixtures/elements/organizer_items_getters.dart';

void main() {
  group('OrganizerItemsBuilder', () {
    group("UnGrouped", () {
      test('add method adds organizer item correctly', () {
        // Arrange
        final builder = OrganizerItemsBuilder.empty();
        final organizerItem = OrganizerItemEntity(id: 1);

        // Act
        final result = builder.add(organizerItem).build();

        // Assert
        expect(result.size(), equals(1));
        expect(result.contains(organizerItem), isTrue);
      });
      test('add method chaining adds organizer item correctly', () {
        // Arrange
        final builder = OrganizerItemsBuilder.empty();
        final organizerItem = OrganizerItemEntity(id: 1);
        final organizerItem2 = OrganizerItemEntity(id: 2);

        // Act
        builder
          ..add(organizerItem)
          ..add(organizerItem2);
        final result = builder.build();

        // Assert
        expect(result.size(), equals(2));
        expect(result.contains(organizerItem), isTrue);
      });
      test('addAll method adds multiple organizer items correctly', () {
        // Arrange
        final builder = OrganizerItemsBuilder.empty();
        final organizerItems = OrganizerItems.of(
            [OrganizerItemEntity(id: 1), OrganizerItemEntity(id: 2)]);

        // Act
        final result = builder.addAll(organizerItems).build();

        // Assert
        expect(result.size(), equals(2));
        expect(result.contains(organizerItems.getAt(0)), isTrue);
        expect(result.contains(organizerItems.getAt(1)), isTrue);
      });

      test('remove method removes organizer item correctly', () {
        // Arrange
        final organizerItemToRemove = OrganizerItemEntity(id: 1);
        final builder = OrganizerItemsBuilder.of([organizerItemToRemove]);

        // Act
        final result = builder.remove(organizerItemToRemove).build();

        // Assert
        expect(result.size(), equals(0));
        expect(result.contains(organizerItemToRemove), isFalse);
      });

      test(
          'removeAt method removes organizer item at specified index correctly',
          () {
        // Arrange
        final organizerItemToRemove = OrganizerItemEntity(id: 2);
        final builder = OrganizerItemsBuilder.of([
          OrganizerItemEntity(id: 1),
          organizerItemToRemove,
          OrganizerItemEntity(id: 3),
        ]);

        // Act
        final result = builder.removeAt(1).build();

        // Assert
        expect(result.size(), equals(2));
        expect(result.contains(organizerItemToRemove), isFalse);
      });

      test('removeAt method throws error if index is out of range', () {
        // Arrange
        final builder = OrganizerItemsBuilder.empty();

        // Act & Assert
        expect(() => builder.removeAt(1), throwsStateError);
      });
    });
    group('removeAt', () {
      test('removeAt method removes item at specified index', () {
        final builder = OrganizerItemsBuilder.of([
          OrganizerItemEntity(id: 1),
          OrganizerItemEntity(id: 2),
          OrganizerItemEntity(id: 3),
        ]);

        final resultBuilder = builder.removeAt(1);

        expect(resultBuilder.organizerItems,
            [OrganizerItemEntity(id: 1), OrganizerItemEntity(id: 3)]);
      });

      test('removeAt method throws RangeError for out-of-range index', () {
        final builder = OrganizerItemsBuilder.of([
          OrganizerItemEntity(id: 1),
          OrganizerItemEntity(id: 2),
          OrganizerItemEntity(id: 3),
        ]);

        expect(() => builder.removeAt(5), throwsRangeError);
      });

      test('removeAt method throws StateError for empty list', () {
        final emptyBuilder = OrganizerItemsBuilder.empty();

        expect(() => emptyBuilder.removeAt(0), throwsStateError);
      });
    });
    group("updateItems", () {
      test("Should return the same items when there are no updated items", () {
        final items = getFiveOrganizerItemEntity();
        final updatedItems = OrganizerItems.empty();

        final result = items.toBuilder().updateItems(updatedItems).build();

        expect(result, items);
      });

      test(
          "Shall update Organizer Items Builder and return the items "
          "with the updated ones", () {
        final items = getFiveOrganizerItemEntity();
        final updatedItems = getFiveOrganizerItemEntityUpdate();
        final expected = getFiveOrganizerItemEntityFiveUpdated();

        final result = items.toBuilder().updateItems(updatedItems).build();

        expect(result, expected);
      });
    });
  });
}
