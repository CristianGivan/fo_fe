import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/util/organizer/id_set.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item_list.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

void main() {
  setUp(() {});
  OrganizerItems setupOrganizerItemsOfThreeTaskEntity() {
    TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
    TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
    TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");
    return OrganizerItems(
        organizerItems: [taskEntity1, taskEntity2, taskEntity3]);
  }

  List<TaskEntity> setupListOfThreeTaskEntity() {
    TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
    TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
    TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");
    return <TaskEntity>[taskEntity1, taskEntity2, taskEntity3];
  }

  OrganizerItems setupOrganizerItemsOfTaskEntityWithTask1AndTask2() {
    TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
    TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
    TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");
    return OrganizerItems(
        organizerItems: [taskEntity1, taskEntity2, taskEntity3]);
  }

  List<TaskEntity> setupListOfTaskEntityWithTask1AndTask2() {
    TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
    TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
    return <TaskEntity>[taskEntity1, taskEntity2];
  }

  group("size", () {
    test('should return 0 when the size is called on an empty list', () {
      // Arrange
      final expected = 0;
      OrganizerItems tTaskEntityList = OrganizerItems(organizerItems: []);

      // Act
      final result = tTaskEntityList.size();

      // Assert
      expect(result, expected);
    });

    test(
        'should return 3 when size is called on a list where there are 3 elements in the list',
        () {
      // Arrange
      final expected = 3;
      OrganizerItems tTaskEntityList = setupOrganizerItemsOfThreeTaskEntity();

      // Act
      final result = tTaskEntityList.size();

      // Assert
      expect(result, expected);
    });
  });

  group("add", () {
    TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
    OrganizerItems tTaskEntityListWithTask1 =
        OrganizerItems(organizerItems: [taskEntity1]);

    test('should return 1 after one element is added to the list', () {
      // Arrange
      final expected = 1;
      OrganizerItems tTaskEntityList = OrganizerItems(organizerItems: []);

      // Act
      tTaskEntityList.add(taskEntity1);
      final result = tTaskEntityList.size();

      // Assert
      expect(result, expected);
    });

    test(
        'should have the item that is added when the item element is added to the list',
        () {
      // Arrange
      final expected = tTaskEntityListWithTask1;
      OrganizerItems tTaskEntityList = OrganizerItems(organizerItems: []);

      // Act
      tTaskEntityList.add(taskEntity1);
      final result = tTaskEntityList;
      // tTaskEntityList.
      // Assert
      expect(result, equals(expected));
    });
  });

  group("filterByIdSet", () {
    TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
    OrganizerItems tTaskEntityListWithTask1 =
        OrganizerItems(organizerItems: [taskEntity1]);

    test('should return a list with Task1 and Task2 when idSet has id 1 and 2',
        () {
      // Arrange
      final expected = setupListOfTaskEntityWithTask1AndTask2();
      final tIdSet = IdSet(<int>{1, 2});
      OrganizerItems tTaskEntityListWithTreeTasks =
          setupOrganizerItemsOfThreeTaskEntity();

      // Act
      final result = tTaskEntityListWithTreeTasks.filterByIdSet(tIdSet);
      // tTaskEntityList.
      // Assert
      expect(result, expected);
    });
  });
}
