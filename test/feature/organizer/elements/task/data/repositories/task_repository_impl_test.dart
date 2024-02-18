import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/platform/network_info.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/repositories/task_repositories_impl.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'task_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TaskRemoteDataSource>()])
@GenerateNiceMocks([MockSpec<TaskLocalDataSource>()])
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
void main() {
  late TaskRepositoryImpl repositoryImpl;
  late MockTaskRemoteDataSource mockTaskRemoteDataSource;
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockTaskRemoteDataSource = MockTaskRemoteDataSource();
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = TaskRepositoryImpl(
        taskRemoteDataSource: mockTaskRemoteDataSource,
        taskLocalDataSource: mockTaskLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  group('description', () {
    final tId = 1;
    final tTaskModel = TaskModel.empty().copyWith(
      id: 4,
      subject: "Test Task",
      createdDate: DateTime.parse("2020-02-02 02:02:01.000"),
      startDate: DateTime.parse("2020-02-02 02:02:02.000"),
      endDate: DateTime.parse("2020-02-02 02:02:03.000"),
    );

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

      test(
          'should return remote data when the call to remote data source is success',
          () async {
        // Arrange
        when(mockTaskRemoteDataSource.getTaskById(any))
            .thenAnswer((_) async => tTaskModel);

        final expected = Right(tTaskEntity);
        // Act

        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockTaskRemoteDataSource.getTaskById(tId));
        expect(result, equals(expected));
      });
      test(
          //todo to be updated for syncDate
          'should save the data in local db  when the call to remote data source is success',
          () async {
        // Arrange
        when(mockTaskRemoteDataSource.getTaskById(any))
            .thenAnswer((_) async => tTaskModel);

        final expected = Right(tTaskEntity);
        // Act

        final result = await repositoryImpl.getTaskById(tId);

        // Assert
        verify(mockTaskRemoteDataSource.getTaskById(tId));
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
