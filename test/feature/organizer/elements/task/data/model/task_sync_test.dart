import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_sync.dart';
import '../repositories/task_repository_impl_test.mocks.dart';

void main() {
  late MockTaskCacheDataSource mockTaskCacheDataSource;
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockTaskRemoteDataSource mockTaskRemoteDataSource;
  late TaskSyncImpl syncTaskImpl;

  setUp(() {
    mockTaskCacheDataSource = MockTaskCacheDataSource();
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockTaskRemoteDataSource = MockTaskRemoteDataSource();
    syncTaskImpl = TaskSyncImpl(
      mockTaskCacheDataSource,
      mockTaskLocalDataSource,
      mockTaskRemoteDataSource,
    );
  });
  group('sync task', () {
    // todo
    // should send the request to the server to check what tasks are updated when the
    // should return the local task if the checksum and lastUpdate are the same like on local
    // should return the remote task if the checksum or lastUpdate are no the same like on local
    // should throw exception when the response is not Json is not correct less fields
    // should throw exception when we have a server error

    test('should get the list ', () async {
      // Arrange

      //final expected = expected;

      // Act
      //final result = actual;

      // Assert
      //expect(result, expected);
    });
  });
}
