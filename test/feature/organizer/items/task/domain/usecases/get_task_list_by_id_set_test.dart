import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/util/organizer/id_set.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item_list.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_list_by_id_set.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTaskListByIdSet usecase;
  late MockTaskRepository mockTaskRepository;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetTaskListByIdSet(mockTaskRepository);
  });

  final tIdSet = IdSet(<int>{1, 2, 3});
  TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
  TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
  TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");

  OrganizerItems tTaskEntityList = OrganizerItems(
      organizerItems: <TaskEntity>[taskEntity1, taskEntity2, taskEntity3]);

  // final tTask = task.TaskEntity.empty();

  test("Print out the local variables", () {
    if (kDebugMode) {
      //todo what is this kDebugMode
      print(tIdSet);
      print(taskEntity1);
    }
  });
  //
  // test(
  //   'should get the task by id from repository',
  //   () async {
  //     // Arrange
  //     when(mockTaskRepository.getTaskById(1))
  //         .thenAnswer((_) async => Right(tTask));
  //
  //     // Act
  //     final result = await usecase(Params.withSingleId(tId));
  //
  //     // Assert
  //     expect(result, equals(Right(tTask)));
  //     verify(mockTaskRepository.getTaskById(tId));
  //     verifyNoMoreInteractions(mockTaskRepository);
  //   },
  // );
}
