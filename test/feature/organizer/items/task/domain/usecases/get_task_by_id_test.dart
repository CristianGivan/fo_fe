import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_by_id.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart' as task;
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTaskById usecase;
  late MockTaskRepository mockTaskRepository;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetTaskById(mockTaskRepository);
  });

  const tId = 1;
  final tTask = task.TaskEntity.empty();

  test(
    'should get the task by id from repository',
    () async {
      // Arrange
      when(mockTaskRepository.getTaskById(1))
          .thenAnswer((_) async => Right(tTask));

      // Act
      final result = await usecase(Params.withSingleId(tId));

      // Assert
      expect(result, equals(Right(tTask)));
      verify(mockTaskRepository.getTaskById(tId));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
