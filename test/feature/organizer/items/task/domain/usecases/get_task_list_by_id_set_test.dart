import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/util/organizer/id_set.dart';
import 'package:fo_fe/core/util/organizer/params.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_items.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_list_by_id_set.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTaskListByIdSet usecase;
  late MockTaskRepository mockTaskRepository;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetTaskListByIdSet(mockTaskRepository);
  });

  final tIdSet = IdSet.of([1, 2, 3]);
  final TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
  final TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
  final TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");

  final OrganizerItems tTaskEntityList = OrganizerItems(
      organizerItems: <TaskEntity>[taskEntity1, taskEntity2, taskEntity3]);

  test("Print out the local variables", () {
    if (kDebugMode) {
      //todo what is this kDebugMode
      print(tIdSet);
      print(taskEntity1);
    }
  });

  test(
    'should get the task list by idSet from repository',
    () async {
      // Arrange
      when(mockTaskRepository.getTaskListByIdSet(tIdSet))
          .thenAnswer((_) async => Right(tTaskEntityList));

      // Act
      final result = await usecase(Params.withIdSet(tIdSet));

      // Assert
      expect(result, equals(Right(tTaskEntityList)));
      verify(mockTaskRepository.getTaskListByIdSet(tIdSet));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
