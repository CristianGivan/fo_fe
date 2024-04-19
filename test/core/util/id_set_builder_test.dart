import 'package:fo_fe/core/util/organizer/id_set_builder.dart';
import 'package:test/test.dart';

void main() {
  group('IdSetBuilder', () {
    test('empty() creates an empty IdSetBuilder', () {
      final builder = IdSetBuilder.empty();
      expect(builder.ids, equals([]));
    });

    test('of() creates IdSetBuilder from Iterable', () {
      final builder = IdSetBuilder.of([1, 2, 3, null]);
      expect(builder.ids, equals({1, 2, 3}));
    });

    test('addId() adds an ID to the builder', () {
      final builder = IdSetBuilder.empty();
      builder.add(1);
      expect(builder.ids, equals({1}));
    });

    test('addAll() adds multiple IDs to the builder', () {
      final builder = IdSetBuilder.empty();
      builder.addAll([2, 3, 4, null]);
      expect(builder.ids, equals({2, 3, 4}));
    });

    test('removeId() removes an ID from the builder', () {
      final builder = IdSetBuilder.of([1, 2, 3]);
      builder.remove(2);
      expect(builder.ids, equals({1, 3}));
    });

    test('build() creates an IdSet from the builder', () {
      final builder = IdSetBuilder.of([1, 2, 3]);
      final idSet = builder.build();
      expect(idSet.toSet(), equals({1, 2, 3}));
    });

    test('props returns a list with _ids for Equatable', () {
      final builder = IdSetBuilder.of([1, 2, 3]);
      expect(
          builder.props,
          equals([
            {1, 2, 3}
          ]));
    });
  });
}
