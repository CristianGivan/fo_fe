import 'package:fo_fe/core/util/organizer/id_set_builder.dart';
import 'package:test/test.dart';

void main() {
  group('IdSetBuilder', () {
    test('creates an empty IdSetBuilder', () {
      final builder = IdSetBuilder.empty();
      expect(builder.ids, isEmpty);
    });

    test('creates an IdSetBuilder with provided ids', () {
      final ids = [1, 2, 3];
      final builder = IdSetBuilder.of(ids);
      expect(builder.ids, equals(Set<int>.of(ids)));
    });

    test('adds a single id to the builder', () {
      final builder = IdSetBuilder.empty();
      builder.addId(1);
      expect(builder.ids, equals({1}));
    });

    test('adds multiple ids to the builder', () {
      final builder = IdSetBuilder.empty();
      final ids = [1, 2, 3];
      builder.addAll(ids);
      expect(builder.ids, equals(Set<int>.of(ids)));
    });

    test('removes an id from the builder', () {
      final builder = IdSetBuilder.of([1, 2, 3]);
      builder.removeId(2);
      expect(builder.ids, equals({1, 3}));
    });

    test('builds an IdSet from the builder', () {
      final builder = IdSetBuilder.of([1, 2, 3]);
      final idSet = builder.build();
      expect(idSet.toSet(), equals(Set<int>.of([1, 2, 3])));
    });

    test('evaluates equality of IdSetBuilder instances', () {
      final builder1 = IdSetBuilder.of([1, 2, 3]);
      final builder2 = IdSetBuilder.of([1, 2, 3]);
      expect(builder1 == builder2, true);
    });

    test('calculates hashCode correctly', () {
      final builder1 = IdSetBuilder.of([1, 2, 3]);
      final builder2 = IdSetBuilder.of([1, 2, 3]);
      expect(builder1.hashCode, equals(builder2.hashCode));
    });

    test('calculates hashCode correctly', () {
      final Set<int> set1 = {1, 2, 3};
      final Set<int> set2 = {3, 2, 1};
      expect(set1 == set2, equals(true));
    });
  });
}
