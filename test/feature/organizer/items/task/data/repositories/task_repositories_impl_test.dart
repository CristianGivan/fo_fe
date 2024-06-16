import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/const/failures_message.dart';
import 'package:fo_fe/core/error/exceptions.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/data/other/repositories/task_repositories_impl.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/fixtures/elements/entities_models.dart';
import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockOrganizerItemLocalDataSource organizerItemLocalDataSource;
  late MockOrganizerItemSyncDataSource organizerItemSyncDataSource;
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockTaskSyncDataSource mockTaskSyncDataSource;
  late TaskRepositoryImpl repositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    organizerItemLocalDataSource = MockOrganizerItemLocalDataSource();
    organizerItemSyncDataSource = MockOrganizerItemSyncDataSource();
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockTaskSyncDataSource = MockTaskSyncDataSource();

    repositoryImpl = TaskRepositoryImpl(
        networkInfo: mockNetworkInfo,
        taskLocalDataSource: mockTaskLocalDataSource,
        taskSyncDataSource: mockTaskSyncDataSource);
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
    final OrganizerItems<TaskEntity> tOrganizerItems =
        OrganizerItems.of(<TaskEntity>[taskEntity1, taskEntity2, taskEntity3]);
    final TaskModel taskModel1 = TaskModel(id: 1, subject: "Task1");
    final TaskModel taskModel2 = TaskModel(id: 2, subject: "Task2");
    final TaskModel taskModel3 = TaskModel(id: 3, subject: "Task3");
    final OrganizerItems<TaskModel> tOrganizerItemsModel =
        OrganizerItems.of(<TaskModel>[taskModel1, taskModel2, taskModel3]);

    test('should check if the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isInternet).thenAnswer((_) async => true);

      // Act
      repositoryImpl.getTaskById(1);

      // Assert
      verify(mockNetworkInfo.isInternet);
    });

    group('getTask', () {
      group('device is online', () {
        setUp(() {
          when(mockNetworkInfo.isInternet).thenAnswer((_) async => true);
        });

        test('should return sync task entity when device is online', () async {
          // Arrange
          when(mockTaskSyncDataSource.syncTaskWithId(any))
              .thenAnswer((_) async => tTaskModelOnline);

          final expected = Right(tTaskModelOnline);

          // Act
          final result = await repositoryImpl.getTaskById(tId);

          // Assert
          verify(mockTaskSyncDataSource.syncTaskWithId(tId));
          expect(result, expected);
        });

        test('should return server failure when connection is unsuccessful',
            () async {
          // Arrange
          when(mockTaskSyncDataSource.syncTaskWithId(any))
              .thenThrow(ServerException(serverFailureMessage));

          const expected = Left(ServerFailure(serverFailureMessage));

          // Act
          final result = await repositoryImpl.getTaskById(tId);

          // Assert
          verify(mockTaskSyncDataSource.syncTaskWithId(tId));
          expect(result, expected);
        });
      });
      group('device is offline', () {
        setUp(() {
          when(mockNetworkInfo.isInternet).thenAnswer((_) async => false);
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

    // todo to create tests
    group("getTaskListByIdSet", () {
      test('getTaskListByIdSet - Online Success', () async {
        // Arrange
        when(mockNetworkInfo.isInternet).thenAnswer((_) async => false);
        when(mockTaskSyncDataSource.syncTaskListWithIdSet(tIdSet))
            .thenAnswer((_) => Future.value(tOrganizerItemsModel));

        // Act
        final result = await repositoryImpl.getTaskListByIdSet(tIdSet);

        // Assert
        expect(result, Right(tOrganizerItems));
        verify(mockNetworkInfo.isInternet).called(1);
        verify(mockTaskSyncDataSource.syncTaskListWithIdSet(tIdSet)).called(1);
        verifyNoMoreInteractions(mockTaskLocalDataSource);
      });
    });
  });
}
