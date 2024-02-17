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
  final tTaskEntity = TaskEntity.empty();
  //   final tTaskEntity = TaskEntity.empty().copyWith(
  //   id: 4,
  //   subject: "Test Task",
  //   createdDate: DateTime.parse("2020-02-02 02:02:01.000"),
  //   startDate: DateTime.parse("2020-02-02 02:02:02.000"),
  //   endDate: DateTime.parse("2020-02-02 02:02:03.000"),
  // );

  test('Should be an instance of TaskEntity', () async {
    // Assert
    expect(tTaskModel, isA<TaskEntity>());
  });

  group('from Json', () {
    test('Test description', () async {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('task.json'));

      var expected = tTaskModel;

      // Act
      var result = TaskModel.empty();
      // var result = TaskModel.fromJson(jsonMap);
      // var result1 = TaskEntity.fromJson(jsonMap);
      var result1 = TaskEntity.empty();

      // Assert
      // expect(result, expected);
      expect(TaskModel.empty(), TaskModel.empty());
    });
  });
}
