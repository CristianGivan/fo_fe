import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/const/error_message.dart';
import 'package:fo_fe/core/error/exceptions.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/id_set.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_items.dart';
import 'package:fo_fe/features/organizer/items/task/data/repositories/task_repositories_impl.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/fixtures/elements/entities_models.dart';
import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockTaskSync mockTaskSync;
  late TaskRepositoryImpl repositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockTaskSync = MockTaskSync();

    repositoryImpl = TaskRepositoryImpl(
      taskLocalDataSource: mockTaskLocalDataSource,
      taskSync: mockTaskSync,
      networkInfo: mockNetworkInfo,
    );
  });

  group("task repositories implement test", () {
    const tId = 1;
    final tTaskModelOnline = getTaskModelTestOnline();
    final tTaskModelOffline = getTaskModelTestOffline();
    final tIdSet = IdSet.of([1, 2, 3]);
    final TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
    final TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
    final TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");
    final OrganizerItems tEmptyOrganizerItems = OrganizerItems.empty();
    final OrganizerItems tOrganizerItems =
        OrganizerItems.of(<TaskEntity>[taskEntity1, taskEntity2, taskEntity3]);

    test('should check if the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // Act
      repositoryImpl.getTaskById(1);

      // Assert
      verify(mockNetworkInfo.isConnected);
    });

    group('getTask', () {
      group('device is online', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });

        test('should return sync task entity when device is online', () async {
          // Arrange
          when(mockTaskSync.syncTaskWithId(any))
              .thenAnswer((_) async => tTaskModelOnline);

          final expected = Right(tTaskModelOnline);

          // Act
          final result = await repositoryImpl.getTaskById(tId);

          // Assert
          verify(mockTaskSync.syncTaskWithId(tId));
          expect(result, expected);
        });

        test('should return server failure when connection is unsuccessful',
            () async {
          // Arrange
          when(mockTaskSync.syncTaskWithId(any))
              .thenThrow(ServerException(serverFailureMessage));

          const expected = Left(ServerFailure(serverFailureMessage));

          // Act
          final result = await repositoryImpl.getTaskById(tId);

          // Assert
          verify(mockTaskSync.syncTaskWithId(tId));
          expect(result, expected);
        });
      });
      group('device is offline', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        });

        test('should return local task entity when device is offline',
            () async {
          // Arrange
          when(mockTaskLocalDataSource.getTaskById(any))
              .thenAnswer((_) async => tTaskModelOffline);

          final expected = Right(tTaskModelOffline);

          // Act
          final result = await repositoryImpl.getTaskById(tId);

          // Assert
          verify(mockTaskLocalDataSource.getTaskById(tId));
          expect(result, expected);
        });

        test(
            'should return local failure when device is offline and local task is empty',
            () async {
          // Arrange
          when(mockTaskLocalDataSource.getTaskById(any))
              .thenAnswer((_) async => Future(TaskModel.empty));

          const expected = Left(NoDataFailure(noDataFailure));

          // Act
          final result = await repositoryImpl.getTaskById(tId);

          // Assert
          verify(mockTaskLocalDataSource.getTaskById(tId));
          expect(result, expected);
        });
      });
    });
    group('getTaskListByIdSet', () {
      test('fetches from remote source when online', () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockTaskSync.syncTaskListWithIdSet(tIdSet))
            .thenAnswer((_) async => tOrganizerItems);

        final result = await repositoryImpl.getTaskListByIdSet(tIdSet);

        expect(result, equals(Right(tOrganizerItems)));
        verify(mockTaskSync.syncTaskListWithIdSet(tIdSet));
        verifyNever(mockTaskLocalDataSource.getTaskListByIdSet(tIdSet));
      });

      test('fetches from local source when offline', () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(mockTaskLocalDataSource.getTaskListByIdSet(tIdSet))
            .thenAnswer((_) async => tOrganizerItems);

        final result = await repositoryImpl.getTaskListByIdSet(tIdSet);

        expect(result, equals(Right(tOrganizerItems)));
        verify(mockTaskLocalDataSource.getTaskListByIdSet(tIdSet));
        verifyNever(mockTaskSync.syncTaskListWithIdSet(tIdSet));
      });

      test('returns NoDataFilure when local data is empty', () async {
        when(mockTaskLocalDataSource.getTaskListByIdSet(tIdSet))
            .thenAnswer((_) async => tEmptyOrganizerItems);

        final result = await repositoryImpl.getTaskListByIdSet(tIdSet);

        expect(result, equals(const Left(NoDataFailure(noDataFailure))));
      });

      test('returns ServerFailure when server error occurs', () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockTaskSync.syncTaskListWithIdSet(tIdSet))
            .thenThrow(ServerException(serverFailureMessage));

        final result = await repositoryImpl.getTaskListByIdSet(tIdSet);

        expect(result, equals(const Left(ServerFailure(serverFailureMessage))));
      });
    });
  });
}
