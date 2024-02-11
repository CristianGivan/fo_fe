import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/usecases/get_task_by_id.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart' as task;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_task_by_id_test.mocks.dart';

// class MockTaskRepository extends Mock implements TaskRepository {}
@GenerateNiceMocks([MockSpec<TaskRepository>()])
void main() {
  late GetTaskById usecase;
  late MockTaskRepository mockTaskRepository;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetTaskById(mockTaskRepository);
  });

  final tId = 1;
  final tTask = task.TaskEntity.empty();

  test(
    'should get the task by id from repository',
    () async {
      // Arrange
      when(mockTaskRepository.getTaskById(1))
          .thenAnswer((_) async => Right(tTask));

      // Act
      final result = await usecase.execute(id: tId);

      // Assert
      expect(result, equals(Right(tTask)));
      verify(mockTaskRepository.getTaskById(tId));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
