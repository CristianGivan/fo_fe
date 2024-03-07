import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/error/exceptions.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_sync.dart';
import 'package:fo_fe/features/organizer/elements/task/data/repositories/task_repositories_impl.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../fixtures/elements/entities_models.dart';
import 'task_repositories_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkInfo>()])
@GenerateNiceMocks([MockSpec<TaskLocalDataSource>()])
@GenerateNiceMocks([MockSpec<TaskRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<TaskSync>()])
@GenerateNiceMocks([MockSpec<TaskModel>()])
void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockTaskSync mockSyncTask;
  late TaskRepositoryImpl repositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockSyncTask = MockTaskSync();

    repositoryImpl = TaskRepositoryImpl(
      taskLocalDataSource: mockTaskLocalDataSource,
      taskSync: mockSyncTask,
      networkInfo: mockNetworkInfo,
    );
  });

  // void runTestOnline(Function body) {
  //   group('device is online', () {
  //     setUp(() {
  //       when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  //     });
  //     body();
  //   });
  // }

  group('getTask', () {
    const tId = 1;
    final tTaskModelOnline = getTaskModelTestOnline();
    final tTaskModelOffline = getTaskModelTestOffline();

    test('should check if the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // Act
      repositoryImpl.getTaskById(tId);

      // Assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return sync task entity when device is online', () async {
        // Arrange
        when(mockSyncTask.syncTaskWithId(any))
            .thenAnswer((_) async => tTaskModelOnline);

        final expected = Right(tTaskModelOnline);

        // Act
        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockSyncTask.syncTaskWithId(tId));
        expect(result, expected);
      });

      test('should return server failure when connection is unsuccessful',
          () async {
        // Arrange
        when(mockSyncTask.syncTaskWithId(any)).thenThrow(ServerException(
            "the task was not find on server or we have a server err"));

        final expected = Left(ServerFailure());

        // Act
        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockSyncTask.syncTaskWithId(tId));
        expect(result, expected);
      });
    });
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return local task entity when device is offline', () async {
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

        final expected = Left(LocalFailure());

        // Act
        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockTaskLocalDataSource.getTaskById(tId));
        expect(result, expected);
      });
    });
  });
}
