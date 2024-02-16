import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/usecases/post_task.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
import 'package:mockito/mockito.dart';
import 'get_task_by_id_test.mocks.dart';

void main() {
  late PostTask usecase;
  late MockTaskRepository mockTaskRepository;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = PostTask(mockTaskRepository);
  });

  final tTask = TaskEntity.empty();

  test(
    'should put the task and receive it from repository',
    () async {
      // Arrange
      when(mockTaskRepository.postTask(tTask))
          .thenAnswer((_) async => Right(tTask));

      // Act
      final result = await usecase(tTask);

      // Assert
      expect(result, equals(Right(tTask)));
      verify(mockTaskRepository.postTask(tTask));
      verifyNoMoreInteractions(mockTaskRepository);
    },
  );
}
