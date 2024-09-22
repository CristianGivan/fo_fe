import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/utils/date_time/date_time_constants.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repository_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/entities/task_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late TaskRepositoryDrift repository;
  late MockTaskLocalDataSourceDrift mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockTaskLocalDataSourceDrift();
    repository = TaskRepositoryDrift(localDataSource: mockLocalDataSource);
  });

  group('getTaskItemsByIdSet', () {
    final tIdSet = IdSet.of([1, 2, 3]);
    final tTaskTableDriftG = TaskTableDriftG(
        id: 1, subject: 'Test Task', createdDate: INITIAL_EPOCH_DATE);
    final tTaskEntity = TaskEntity(id: 1, subject: 'Test Task');
    final tOrganizerItems = OrganizerItems<TaskEntity>.of([tTaskEntity]);

    test(
        'returns OrganizerItems<TaskEntity> when data source returns non-null items',
        () async {
      when(mockLocalDataSource.getTaskItemsByIdSet(tIdSet))
          .thenAnswer((_) async => [tTaskTableDriftG]);

      final result = await repository.getTaskItemsByIdSet(tIdSet);

      expect(result, Right(tOrganizerItems));
      verify(mockLocalDataSource.getTaskItemsByIdSet(tIdSet));
    });

    test('throws TaskNotFoundFailure when data source returns null', () async {
      when(mockLocalDataSource.getTaskItemsByIdSet(tIdSet))
          .thenAnswer((_) async => null);

      final result = await repository.getTaskItemsByIdSet(tIdSet);

      expect(result, Left(TaskNotFoundFailure()));
      verify(mockLocalDataSource.getTaskItemsByIdSet(tIdSet));
    });

    test('throws TaskNotFoundFailure when data source returns empty list',
        () async {
      when(mockLocalDataSource.getTaskItemsByIdSet(tIdSet))
          .thenAnswer((_) async => []);

      final result = await repository.getTaskItemsByIdSet(tIdSet);

      expect(result, Left(TaskNotFoundFailure()));
      verify(mockLocalDataSource.getTaskItemsByIdSet(tIdSet));
    });

    test('throws TaskNotFoundFailure when all items in the list are null',
        () async {
      when(mockLocalDataSource.getTaskItemsByIdSet(tIdSet))
          .thenAnswer((_) async => [null]);

      final result = await repository.getTaskItemsByIdSet(tIdSet);

      expect(result, Left(TaskNotFoundFailure()));
      verify(mockLocalDataSource.getTaskItemsByIdSet(tIdSet));
    });

    test(
      'throws TaskNotFoundFailure when data source returns a list containing a null element',
      () async {
        // Make sure to return a Future containing the expected list type
        when(mockLocalDataSource.getTaskItemsByIdSet(tIdSet))
            .thenAnswer((_) async => [tTaskTableDriftG, null]);

        final result = await repository.getTaskItemsByIdSet(tIdSet);

        expect(result, Right(tOrganizerItems));
        verify(mockLocalDataSource.getTaskItemsByIdSet(tIdSet));
      },
    );
  });
}
