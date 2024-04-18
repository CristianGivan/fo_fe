import 'package:fo_fe/core/util/organizer/id_set_builder.dart';
import 'package:test/test.dart';

void main() {
  group('IdSetBuilder', () {
    final tIds = [1, 2, 3];
    test('creates an empty IdSetBuilder', () {
      final builder = IdSetBuilder.empty();
      expect(builder.ids, isEmpty);
    });

    test('creates an IdSetBuilder with provided ids', () {
      final builder = IdSetBuilder.of(tIds);
      expect(builder.ids, equals(Set<int>.of(tIds)));
    });

    test('get ids', () {
      final builder = IdSetBuilder.of(tIds);

      expect(builder.ids, containsAll(tIds));
    });

    test('addId()', () {
      final builder = IdSetBuilder.empty();
      builder.addId(1).addId(2).addId(3);
      expect(builder.ids, containsAll(tIds));
    });

    test('addAll()', () {
      final builder = IdSetBuilder.empty();
      builder.addAll(tIds);
      expect(builder.ids, containsAll(tIds));
    });

    test('removeId()', () {
      final builder = IdSetBuilder.of(tIds);

      builder.removeId(2);
      expect(builder.ids, containsAll([1, 3]));
    });

    test('build()', () {
      final builder = IdSetBuilder.of(tIds);
      expect(builder.ids, containsAll(tIds));
    });

    test('evaluates equality of IdSetBuilder instances', () {
      final builder1 = IdSetBuilder.of(tIds);
      final builder2 = IdSetBuilder.of(tIds);
      expect(builder1 == builder2, equals(true));
    });

    test('calculates hashCode correctly', () {
      final builder1 = IdSetBuilder.of(tIds);
      final builder2 = IdSetBuilder.of(tIds);
      expect(builder1.hashCode, equals(builder2.hashCode));
    });
  });
}
