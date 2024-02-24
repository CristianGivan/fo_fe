import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/platform/network_info.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/repositories/task_repositories_impl.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../fixtures/elements/entities_models.dart';
import 'task_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TaskRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<TaskLocalDataSource>()])
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
void main() {
  late TaskRepositoryImpl repositoryImpl;
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = TaskRepositoryImpl(
        taskLocalDataSource: mockTaskLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  group('getTask', () {
    final tId = 1;
    final tTaskModel = getTaskModelTestOnline();

    final tTaskEntity = tTaskModel;

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

      test('should sync the local data when device is online', () async {
        // Arrange
        when(mockTaskLocalDataSource.getTaskById(any))
            .thenAnswer((_) async => tTaskModel);

        final expected = Right(tTaskEntity);
        // Act

        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockTaskLocalDataSource.getTaskById(tId));
        expect(result, equals(expected));
      });

      test('should return updated data when device is online', () async {
        // Arrange
        when(mockTaskLocalDataSource.getTaskById(any))
            .thenAnswer((_) async => tTaskModel);

        final expected = Right(tTaskEntity);
        // Act

        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockTaskLocalDataSource.getTaskById(tId));
        expect(result, equals(expected));
      });
      test(
          //todo to be updated for syncDate
          'should save the data in local db  when the call to remote data source is success',
          () async {
        // Arrange
        when(mockTaskLocalDataSource.getTaskById(any))
            .thenAnswer((_) async => tTaskModel);

        final expected = Right(tTaskEntity);
        // Act

        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockTaskLocalDataSource.getTaskById(tId));
        expect(result, equals(expected));
      });
    });
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });
  });
}
