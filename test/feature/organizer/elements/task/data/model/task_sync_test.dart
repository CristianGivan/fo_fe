import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_sync.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../fixtures/elements/entities_models.dart';
import '../../../../../../fixtures/elements/fixture_reader_element.dart';
import '../repositories/task_repository_impl_test.mocks.dart';

void main() {
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockTaskRemoteDataSource mockTaskRemoteDataSource;
  late TaskSyncImpl syncTaskImpl;

  setUp(() {
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockTaskRemoteDataSource = MockTaskRemoteDataSource();
    syncTaskImpl = TaskSyncImpl(
      mockTaskLocalDataSource,
      mockTaskRemoteDataSource,
    );
  });

  // todo
  // should return the local task if the checksum and lastUpdate are the same like on local
  // should return the remote task if the checksum or lastUpdate are no the same like on local
  // should throw exception when the response is not Json is not correct less fields
  // should throw exception when we have a server error

  group('TaskSyncImpl', () {
    const tId = 1;
    final tTaskModelOnline = getTaskModelTestOnline();
    final tTaskModelOffline = getTaskModelTestOffline();

    // Mock behavior

    test('syncTaskWithId returns local task if checksums are the same',
        () async {
      // Arrange
      final Map<String, dynamic> tJsonReceived =
          json.decode(fixture('task_no_update.json'));

      when(mockTaskLocalDataSource.getTaskById(any))
          .thenAnswer((_) => Future.value(getTaskModelTestOffline()));

      when(mockTaskRemoteDataSource.getUpdatedTaskAsJsonIfDifferent(any))
          .thenAnswer((_) => Future.value(tJsonReceived));

      final expected = tTaskModelOffline;

      // Act
      final result = await syncTaskImpl.syncTaskWithId(tId);

      // Assert
      verify(mockTaskLocalDataSource.getTaskById(tId));
      verify(mockTaskRemoteDataSource.getUpdatedTaskAsJsonIfDifferent(any));
      expect(result, expected);
    });
    test('syncTaskWithId returns updated task if checksums are different',
        () async {
      // Arrange

      final Map<String, dynamic> tJsonReceived =
          json.decode(fixture('task_online.json'));

      when(mockTaskLocalDataSource.getTaskById(any))
          .thenAnswer((_) => Future.value(getTaskModelTestOffline()));

      when(mockTaskRemoteDataSource.getUpdatedTaskAsJsonIfDifferent(any))
          .thenAnswer((_) => Future.value(tJsonReceived));

      final tSendJson = getTaskModelTestOffline().sendJsonToCheckIfIsUpdated();
      final tReceivedTask = TaskModel.fromJson(tJsonReceived);

      final expected = tTaskModelOnline;

      // Act
      final result = await syncTaskImpl.syncTaskWithId(tId);

      // Assert
      verify(mockTaskLocalDataSource.getTaskById(tId));
      verify(
          mockTaskRemoteDataSource.getUpdatedTaskAsJsonIfDifferent(tSendJson));
      verify(mockTaskLocalDataSource.postTask(tReceivedTask));
      verifyNever(mockTaskLocalDataSource.postTask(getTaskModelTestOffline()));
      expect(result, expected);
    });
  });
}
