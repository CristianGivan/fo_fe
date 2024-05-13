import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_sync_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/fixtures/elements/entities_models.dart';
import '../../../../../../helpers/fixtures/elements/fixture_reader_element.dart';
import '../../../../../../helpers/fixtures/elements/organizer_items_getters.dart';
import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTaskLocalDataSource mockTaskLocalDataSource;
  late MockTaskRemoteDataSource mockTaskRemoteDataSource;
  late TaskSyncDataSourceImpl syncTaskImpl;

  setUp(() {
    mockTaskLocalDataSource = MockTaskLocalDataSource();
    mockTaskRemoteDataSource = MockTaskRemoteDataSource();
    syncTaskImpl = TaskSyncDataSourceImpl(
      taskLocalDataSource: mockTaskLocalDataSource,
      taskRemoteDataSource: mockTaskRemoteDataSource,
    );
  });

  // todo
  // should return the local task if the checksum and lastUpdate are the same like on local
  // should return the remote task if the checksum or lastUpdate are no the same like on local
  // should throw exception when the response is not Json is not correct less fields
  // should throw exception when we have a server error
  OrganizerItems getOrganizerItemsTree() {
    final TaskModel tTaskModel1 = TaskModel(id: 1, subject: "Task1");
    final TaskModel tTaskModel2 = TaskModel(id: 2, subject: "Task2");
    final TaskModel tTaskModel3 = TaskModel(id: 3, subject: "Task3");
    OrganizerItems tOrganizerItems =
        OrganizerItems.of([tTaskModel1, tTaskModel2, tTaskModel3]);
    return tOrganizerItems;
  }

  OrganizerItems<TaskModel> getNOrganizerItems(int n, TaskModel taskModel) {
    OrganizerItemsBuilder<TaskModel> organizerItemsBuilder =
        OrganizerItemsBuilder.empty();
    for (int i = 1; i <= n; i++) {
      organizerItemsBuilder.add(taskModel.copyWith(id: i));
    }
    return organizerItemsBuilder.build();
  }

  OrganizerItems<TaskModel> getOrganizerItems(int n) {
    TaskModel taskModel = TaskModel(subject: "TaskN");
    return getNOrganizerItems(n, taskModel);
  }

  OrganizerItems<TaskModel> getUpdateOrganizerItems(int n) {
    TaskModel taskModel = TaskModel(subject: "TaskUpdate");
    return getNOrganizerItems(n, taskModel);
  }

  group('TaskSyncImpl', () {
    const tId = 1;
    final tTaskModelOnline = getTaskModelTestOnline();
    final tTaskModelOffline = getTaskModelTestOffline();

    // Mock behavior

    test('should returns local task when checksums are the same', () async {
      // Arrange
      final Map<String, dynamic> tJsonReceived =
          json.decode(fixture('task_no_update.json'));

      when(mockTaskLocalDataSource.getTaskById(any))
          .thenAnswer((_) => Future.value(getTaskModelTestOffline()));

      when(mockTaskRemoteDataSource.getUpdatedTaskIfDifferent(any))
          .thenAnswer((_) => Future.value(tJsonReceived));

      final expected = tTaskModelOffline;

      // Act
      final result = await syncTaskImpl.syncTaskWithId(tId);

      // Assert
      verify(mockTaskLocalDataSource.getTaskById(tId));
      verify(mockTaskRemoteDataSource.getUpdatedTaskIfDifferent(any));
      expect(result, expected);
    });
    test('should returns updated task when checksums are different', () async {
      // Arrange

      final Map<String, dynamic> tJsonReceived =
          json.decode(fixture('task_online.json'));

      when(mockTaskLocalDataSource.getTaskById(any))
          .thenAnswer((_) => Future.value(getTaskModelTestOffline()));

      when(mockTaskRemoteDataSource.getUpdatedTaskIfDifferent(any))
          .thenAnswer((_) => Future.value(tJsonReceived));

      final tSendJson = getTaskModelTestOffline().jsonToCheckForUpdates();
      final tReceivedTask = TaskModel.fromJson(tJsonReceived);

      final expected = tTaskModelOnline;

      // Act
      final result = await syncTaskImpl.syncTaskWithId(tId);

      // Assert
      verify(mockTaskLocalDataSource.getTaskById(tId));
      verify(mockTaskRemoteDataSource.getUpdatedTaskIfDifferent(tSendJson));
      verify(mockTaskLocalDataSource.postTask(tReceivedTask));
      expect(result, expected);
    });

    test('should update the local task when checksums are different', () async {
      // Arrange

      final Map<String, dynamic> tJsonReceived =
          json.decode(fixture('task_online.json'));

      when(mockTaskLocalDataSource.getTaskById(any))
          .thenAnswer((_) => Future.value(getTaskModelTestOffline()));

      when(mockTaskRemoteDataSource.getUpdatedTaskIfDifferent(any))
          .thenAnswer((_) => Future.value(tJsonReceived));

      final tSendJson = getTaskModelTestOffline().jsonToCheckForUpdates();
      final tReceivedTask = TaskModel.fromJson(tJsonReceived);

      // Act
      await syncTaskImpl.syncTaskWithId(tId);

      // Assert
      verify(mockTaskLocalDataSource.getTaskById(tId));
      verify(mockTaskRemoteDataSource.getUpdatedTaskIfDifferent(tSendJson));
      verify(mockTaskLocalDataSource.postTask(tReceivedTask));
      verifyNever(mockTaskLocalDataSource.postTask(getTaskModelTestOffline()));
    });
  });

  group("syncTaskListWithIdSet", () {
    test("should return the local OrganizerItems when IdSet is not empty",
        () async {});
    test("should create correct JsonToCheckForUpdates when IdSet is valid",
        () {});
    test("should validate the JsonWithUpdates when it is received for server",
        () {});
    test(
        "should receive the remote OrganizerItems as a JsonWithUpdates"
        " when JsonToCheckForUpdates is sent to server",
        () {});

    test(
        "should return the updated OrganizerItems when JsonWithUpdates is valid "
        "and having the local OrganizerItems and remote updated OrganizerItems",
        () {});
    test(
        "should return the empty OrganizerItems when IdSet is empty amd should "
        "not call anything else",
        () {});
  });

  group("Learning Tests", () {
    final tIdSet = IdSet.of([1, 2, 3]);
    test("LT to check the setup", () {
      int n = 10;

      OrganizerItems organizerItems = getOrganizerItems(n);
      OrganizerItems updatedOrganizerItems = getUpdateOrganizerItems(n ~/ 2);
      organizerItems.map((p0) => print(p0));
      updatedOrganizerItems.map((p0) => print(p0));
    });
    test("LT ", () async {
      //Arrange

      when(mockTaskLocalDataSource.getTaskListByIdSet(any))
          .thenAnswer((_) => Future.value(getOrganizerItems5TaskModel()));

      when(mockTaskRemoteDataSource.getUpdatedItems(any))
          .thenAnswer((_) => Future.value(getOrganizerItems3TaskModelUpdate()));

      final expected = getOrganizerItems5TaskModel3Updated();
      //Act

      final result = await syncTaskImpl.syncTaskListWithIdSet(tIdSet);

      //Assert
      expect(result, expected);
    });
  }); //, skip: 'Learning tests');
}
