import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/elements/TaskTest/task_test_lib.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

import '../../../../../../fixtures/elements/fixture_reader_element.dart';

void main() {
  final tTaskTestModel = TaskTestModel.empty().copyWith(
    id: 4,
    subject: "Test Task",
    createdDate: DateTime.parse("2020-02-02 02:02:01.000"),
    startDate: DateTime.parse("2020-02-02 02:02:02.000"),
    endDate: DateTime.parse("2020-02-02 02:02:03.000"),
  );

  test('Should be an instance of TaskEntity', () async {
    // Assert
    expect(tTaskTestModel, isA<TaskTest>());
  });

  group('from Json', () {
    test('Test description', () async {
      // Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('tasktest.json'));

      var expected = tTaskTestModel;

      // Act
      var result = TaskTestModel.fromJson(jsonMap);

      // Assert
      expect(result, expected);
    });
  });
}
