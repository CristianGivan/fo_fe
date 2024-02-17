import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

import '../../../../../../fixtures/elements/fixture_reader_element.dart';

void main() {
  final tTaskTestModel = TaskTestModel(4, "Test Task");


  test('Should be an instance of TaskEntity', () async {
    // Assert
    expect(tTaskTestModel, isA<TaskTest>());
  });

  group('from Json', () {
    test('Test description', () async {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('tasktest.json'));

      var expected = tTaskTestModel;

      // Act
      var result = TaskTestModel.fromJson(jsonMap);


      // Assert
      // expect(result, expected);
      expect(result, expected);
    });
  });
}
