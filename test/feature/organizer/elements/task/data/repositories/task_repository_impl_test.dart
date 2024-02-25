import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/platform/network_info.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_sync.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_cache_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/repositories/task_repositories_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../fixtures/elements/entities_models.dart';
import 'task_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkInfo>()])
@GenerateNiceMocks([MockSpec<TaskCacheDataSource>()])
@GenerateNiceMocks([MockSpec<TaskLocalDataSource>()])
@GenerateNiceMocks([MockSpec<TaskRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<TaskSync>()])
void main() {
  late MockNetworkInfo mockNetworkInfo;
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockSyncTask mockSyncTask;
  late TaskRepositoryImpl repositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockSyncTask = MockSyncTask();

    repositoryImpl = TaskRepositoryImpl(
      taskLocalDataSource: mockTaskLocalDataSource,
      networkInfo: mockNetworkInfo,
      syncLocalData: mockSyncTask,
    );
  });

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
        when(mockSyncTask.syncTaskWithId(any))
            .thenAnswer((_) async => tTaskModelOnline);
      });

      test('should return sync task entity when device is online', () async {
        // Arrange
        final expected = Right(tTaskModelOnline);

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
        when(mockTaskLocalDataSource.getTaskById(any))
            .thenAnswer((_) async => tTaskModelOffline);
      });

      test('should return local task entity when device is offline', () async {
        // Arrange
        final expected = Right(tTaskModelOffline);

        // Act
        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockTaskLocalDataSource.getTaskById(tId));
        expect(result, expected);
      });
    });
  });
}
