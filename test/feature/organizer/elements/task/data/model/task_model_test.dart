import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

import '../../../../../../fixtures/elements/fixture_reader_element.dart';

void main() {
  final tTaskModel = TaskModel.empty().copyWith(
    id: 4,
    subject: "Test Task",
    createdDate: DateTime.parse("2020-02-02 02:02:01.000"),
    startDate: DateTime.parse("2020-02-02 02:02:02.000"),
    endDate: DateTime.parse("2020-02-02 02:02:03.000"),
  );

  test('Should be an instance of TaskEntity', () async {
    // Assert
    expect(tTaskModel, isA<TaskEntity>());
  });

  group('from Json', () {
    test('Test description', () async {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('task.json'));

      // Act
      var result = TaskModel.fromJson(jsonMap);

      // Assert
      expect(result, tTaskModel);
    });
  });
  test('should return a JSON map that contain the proper data', () async {
    // Arrange
    final expected = {
      "taskId": 4,
      "task": "Test Task",
      "createdDate": "2020-02-02T02:02:01.000",
      "startDate": "2020-02-02T02:02:02.000",
      "endDate": "2020-02-02T02:02:03.000",
      "taskStatus": "UNDEFINED"
    };

    // Act
    final result = tTaskModel.toJson();

    // Assert
    print(tTaskModel.taskStatus.toString());

    expect(result, expected);
  });
}
