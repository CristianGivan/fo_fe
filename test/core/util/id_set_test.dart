import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';

void main() {
  group('IdSet Tests', () {
    test('IdSet.empty creates an empty set', () {
      final idSet = IdSet.empty();
      expect(idSet.isEmpty(), isTrue);
      expect(idSet.size, equals(0));
    });

    test('IdSet.of creates a set from non-null IDs', () {
      final ids = [1, 2, 3, null, 4, 5, null];
      final idSet = IdSet.of(ids);
      expect(idSet.toSet(), equals({1, 2, 3, 4, 5}));
      expect(idSet.size, equals(5));
    });

    test('IdSet.containsId returns true for existing ID', () {
      final idSet = IdSet.of([1, 2, 3]);
      expect(idSet.contains(2), isTrue);
    });

    test('IdSet.containsId returns false for non-existing ID', () {
      final idSet = IdSet.of([1, 2, 3]);
      expect(idSet.contains(4), isFalse);
    });

    test('IdSet.first returns the first element', () {
      final idSet = IdSet.of([3, 1, 2]);
      expect(idSet.first, equals(3));
    });

    test('IdSet.first throws StateError if the set is empty', () {
      final idSet = IdSet.empty();
      expect(() => idSet.first, throwsA(isA<StateError>()));
    });

    test('IdSet.last returns the last element', () {
      final idSet = IdSet.of([3, 1, 2]);
      expect(idSet.last, equals(2));
    });

    test('IdSet.last throws StateError if the set is empty', () {
      final idSet = IdSet.empty();
      expect(() => idSet.last, throwsA(isA<StateError>()));
    });

    test('IdSet.toBuilder returns an IdSetBuilder with same IDs', () {
      final idSet = IdSet.of([1, 2, 3]);
      final builder = idSet.toBuilder();
      expect(builder.ids, equals({1, 2, 3}));
    });

    test('IdSet.toBuilder returns an IdSetBuilder with same IDs', () {
      final idSet = IdSet.of([1, 2, 3]);
      final builder = idSet.toBuilder();
      builder.add(4);
      final idSet1 = builder.build();
      expect(idSet1.toSet(), equals({1, 2, 3, 4}));
    });

    test('Modifying builder does not affect built instance', () {
      final idSet = IdSet.of([1, 2, 3]);
      final builder = idSet.toBuilder();
      builder.add(4);
      final idSet1 = builder.build();
      builder.add(5);
      expect(builder.ids, equals({1, 2, 3, 4, 5}));
      expect(idSet1.toSet(), equals({1, 2, 3, 4}));
      expect(idSet.toSet(), equals({1, 2, 3}));
    });

    test('IdSet.toString returns string representation of IDs', () {
      final idSet = IdSet.of([1, 2, 3]);
      expect(idSet.toString(), equals('{1, 2, 3}'));
    });

    test('IdSet.forEach iterates over all IDs', () {
      final idSet = IdSet.of([1, 2, 3]);
      final List<int> result = [];
      idSet.forEach((id) => result.add(id));
      expect(result, equals([1, 2, 3]));
    });

    test('IdSet.fromOrganizerItems creates a set from OrganizerItems', () {
      OrganizerItemEntity organizerItem1 = OrganizerItemEntity(
        id: 1,
      );
      OrganizerItemEntity organizerItem2 = OrganizerItemEntity(
        id: 2,
      );
      OrganizerItemEntity organizerItem3 = OrganizerItemEntity(
        id: 3,
      );
      OrganizerItems organizerItems =
          OrganizerItems.of([organizerItem1, organizerItem2, organizerItem3]);

      final idSet = IdSet.fromOrganizerItems(organizerItems);
      expect(idSet.toSet(), equals({1, 2, 3}));
    });
  });
}
