import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

import '../../../../../../fixtures/elements/entities_models.dart';
import '../../../../../../fixtures/elements/fixture_reader_element.dart';

void main() {
  final tTaskModel = getTaskModelTestOnline();

  test('Should be an instance of TaskEntity', () async {
    // Assert
    expect(tTaskModel, isA<TaskEntity>());
  });

  group('from Json', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      // Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('task_online.json'));

      // Act
      var result = TaskModel.fromJson(jsonMap);

      // Assert
      expect(result, tTaskModel);
    });
  });
  test('should return a JSON map that contain the proper data', () async {
    // Arrange
    final expected = {
      "taskId": 2,
      "task": "Test Task online",
      "createdDate": "2020-02-02T02:02:01.000",
      "startDate": "2020-02-02T02:02:02.000",
      "endDate": "2020-02-02T02:02:03.000",
      "taskStatus": "UNDEFINED",
      "remoteTaskId": 2,
      "lastUpdate": "2020-02-02T02:02:04.000",
      "lastViewDate": "2020-02-02T02:02:05.000",
      "remoteViews": 2,
      "views": 2,
      "checksum": "checksum online 2"
    };

    // Act
    final result = tTaskModel.toJson();

    // Assert
    expect(result, expected);
  });
}
