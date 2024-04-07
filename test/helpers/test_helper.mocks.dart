// Mocks generated by Mockito 5.4.4 from annotations
// in fo_fe/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:convert' as _i22;
import 'dart:typed_data' as _i23;

import 'package:dartz/dartz.dart' as _i5;
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart'
    as _i6;
import 'package:fo_fe/core/error/failures.dart' as _i21;
import 'package:fo_fe/core/network/network_info.dart' as _i9;
import 'package:fo_fe/core/util/input_converter.dart' as _i24;
import 'package:fo_fe/core/util/organizer/id_set.dart' as _i12;
import 'package:fo_fe/core/util/organizer/params.dart' as _i26;
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_items.dart'
    as _i3;
import 'package:fo_fe/features/organizer/items/tag/tag_lib.dart' as _i16;
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart'
    as _i11;
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart'
    as _i13;
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_sync.dart'
    as _i14;
import 'package:fo_fe/features/organizer/items/task/domain/entities/topic.dart'
    as _i20;
import 'package:fo_fe/features/organizer/items/task/domain/entities/user.dart'
    as _i4;
import 'package:fo_fe/features/organizer/items/task/domain/entities/work.dart'
    as _i19;
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart'
    as _i8;
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_by_id.dart'
    as _i25;
import 'package:fo_fe/features/organizer/items/task/task_lib.dart' as _i2;
import 'package:fo_fe/features/organizer/organizer.dart' as _i17;
import 'package:fo_fe/features/organizer/util/organizer_enums.dart' as _i18;
import 'package:http/http.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i15;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTaskModel_0 extends _i1.SmartFake implements _i2.TaskModel {
  _FakeTaskModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeOrganizerItems_1 extends _i1.SmartFake
    implements _i3.OrganizerItems {
  _FakeOrganizerItems_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateTime_2 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUser_3 extends _i1.SmartFake implements _i4.User {
  _FakeUser_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_4<L, R> extends _i1.SmartFake implements _i5.Either<L, R> {
  _FakeEither_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDuration_5 extends _i1.SmartFake implements Duration {
  _FakeDuration_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddressCheckResult_6 extends _i1.SmartFake
    implements _i6.AddressCheckResult {
  _FakeAddressCheckResult_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_7 extends _i1.SmartFake implements _i7.Response {
  _FakeResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_8 extends _i1.SmartFake
    implements _i7.StreamedResponse {
  _FakeStreamedResponse_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTaskRepository_9 extends _i1.SmartFake
    implements _i8.TaskRepository {
  _FakeTaskRepository_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i9.NetworkInfo {
  @override
  _i10.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i10.Future<bool>.value(false),
        returnValueForMissingStub: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
}

/// A class which mocks [TaskLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskLocalDataSource extends _i1.Mock
    implements _i11.TaskLocalDataSource {
  @override
  _i10.Future<_i2.TaskModel> putTask(_i2.TaskModel? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #putTask,
          [task],
        ),
        returnValue: _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #putTask,
            [task],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #putTask,
            [task],
          ),
        )),
      ) as _i10.Future<_i2.TaskModel>);

  @override
  _i10.Future<_i2.TaskModel> postTask(_i2.TaskModel? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #postTask,
          [task],
        ),
        returnValue: _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #postTask,
            [task],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #postTask,
            [task],
          ),
        )),
      ) as _i10.Future<_i2.TaskModel>);

  @override
  _i10.Future<_i2.TaskModel> getTaskById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTaskById,
          [id],
        ),
        returnValue: _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #getTaskById,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #getTaskById,
            [id],
          ),
        )),
      ) as _i10.Future<_i2.TaskModel>);

  @override
  _i10.Future<_i3.OrganizerItems> getTaskListByIdSet(_i12.IdSet? idSet) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTaskListByIdSet,
          [idSet],
        ),
        returnValue:
            _i10.Future<_i3.OrganizerItems>.value(_FakeOrganizerItems_1(
          this,
          Invocation.method(
            #getTaskListByIdSet,
            [idSet],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i3.OrganizerItems>.value(_FakeOrganizerItems_1(
          this,
          Invocation.method(
            #getTaskListByIdSet,
            [idSet],
          ),
        )),
      ) as _i10.Future<_i3.OrganizerItems>);

  @override
  _i10.Future<void> deleteTask(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTask,
          [id],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
}

/// A class which mocks [TaskRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRemoteDataSource extends _i1.Mock
    implements _i13.TaskRemoteDataSource {
  @override
  _i10.Future<_i2.TaskModel> putTask(_i2.TaskModel? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #putTask,
          [task],
        ),
        returnValue: _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #putTask,
            [task],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #putTask,
            [task],
          ),
        )),
      ) as _i10.Future<_i2.TaskModel>);

  @override
  _i10.Future<_i2.TaskModel> postTask(_i2.TaskModel? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #postTask,
          [task],
        ),
        returnValue: _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #postTask,
            [task],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #postTask,
            [task],
          ),
        )),
      ) as _i10.Future<_i2.TaskModel>);

  @override
  _i10.Future<_i2.TaskModel> getTaskById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTaskById,
          [id],
        ),
        returnValue: _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #getTaskById,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #getTaskById,
            [id],
          ),
        )),
      ) as _i10.Future<_i2.TaskModel>);

  @override
  _i10.Future<Map<String, dynamic>> getUpdatedTaskIfDifferent(
          Map<String, dynamic>? json) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpdatedTaskIfDifferent,
          [json],
        ),
        returnValue:
            _i10.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i10.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i10.Future<Map<String, dynamic>>);

  @override
  _i10.Future<void> deleteTask(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTask,
          [id],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
}

/// A class which mocks [TaskSync].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskSync extends _i1.Mock implements _i14.TaskSync {
  @override
  _i10.Future<_i2.TaskModel> syncTaskWithId(int? id) => (super.noSuchMethod(
        Invocation.method(
          #syncTaskWithId,
          [id],
        ),
        returnValue: _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #syncTaskWithId,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i2.TaskModel>.value(_FakeTaskModel_0(
          this,
          Invocation.method(
            #syncTaskWithId,
            [id],
          ),
        )),
      ) as _i10.Future<_i2.TaskModel>);

  @override
  _i10.Future<_i3.OrganizerItems> syncTaskListWithIdSet(_i12.IdSet? idSet) =>
      (super.noSuchMethod(
        Invocation.method(
          #syncTaskListWithIdSet,
          [idSet],
        ),
        returnValue:
            _i10.Future<_i3.OrganizerItems>.value(_FakeOrganizerItems_1(
          this,
          Invocation.method(
            #syncTaskListWithIdSet,
            [idSet],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i3.OrganizerItems>.value(_FakeOrganizerItems_1(
          this,
          Invocation.method(
            #syncTaskListWithIdSet,
            [idSet],
          ),
        )),
      ) as _i10.Future<_i3.OrganizerItems>);
}

/// A class which mocks [TaskModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskModel extends _i1.Mock implements _i2.TaskModel {
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
        returnValueForMissingStub: <Object?>[],
      ) as List<Object?>);

  @override
  int get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  String get subject => (super.noSuchMethod(
        Invocation.getter(#subject),
        returnValue: _i15.dummyValue<String>(
          this,
          Invocation.getter(#subject),
        ),
        returnValueForMissingStub: _i15.dummyValue<String>(
          this,
          Invocation.getter(#subject),
        ),
      ) as String);

  @override
  DateTime get createdDate => (super.noSuchMethod(
        Invocation.getter(#createdDate),
        returnValue: _FakeDateTime_2(
          this,
          Invocation.getter(#createdDate),
        ),
        returnValueForMissingStub: _FakeDateTime_2(
          this,
          Invocation.getter(#createdDate),
        ),
      ) as DateTime);

  @override
  _i4.User get creator => (super.noSuchMethod(
        Invocation.getter(#creator),
        returnValue: _FakeUser_3(
          this,
          Invocation.getter(#creator),
        ),
        returnValueForMissingStub: _FakeUser_3(
          this,
          Invocation.getter(#creator),
        ),
      ) as _i4.User);

  @override
  List<_i4.User> get userList => (super.noSuchMethod(
        Invocation.getter(#userList),
        returnValue: <_i4.User>[],
        returnValueForMissingStub: <_i4.User>[],
      ) as List<_i4.User>);

  @override
  List<_i16.Tag> get tagList => (super.noSuchMethod(
        Invocation.getter(#tagList),
        returnValue: <_i16.Tag>[],
        returnValueForMissingStub: <_i16.Tag>[],
      ) as List<_i16.Tag>);

  @override
  List<_i17.Reminder> get reminderList => (super.noSuchMethod(
        Invocation.getter(#reminderList),
        returnValue: <_i17.Reminder>[],
        returnValueForMissingStub: <_i17.Reminder>[],
      ) as List<_i17.Reminder>);

  @override
  int get remoteTaskId => (super.noSuchMethod(
        Invocation.getter(#remoteTaskId),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);

  @override
  Map<String, dynamic> sendJsonToCheckIfIsUpdated() => (super.noSuchMethod(
        Invocation.method(
          #sendJsonToCheckIfIsUpdated,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);

  @override
  _i2.TaskModel copyWith({
    bool? status,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    _i18.TaskStatus? taskStatus,
    List<_i19.Work>? workList,
    List<_i20.Topic>? topicList,
    int? id,
    String? subject,
    DateTime? createdDate,
    _i4.User? creator,
    List<_i4.User>? userList,
    List<_i16.Tag>? tagList,
    List<_i17.Reminder>? reminderList,
    int? remoteTaskId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #copyWith,
          [],
          {
            #status: status,
            #startDate: startDate,
            #endDate: endDate,
            #workingTime: workingTime,
            #estimatedTime: estimatedTime,
            #estimatedLeftTime: estimatedLeftTime,
            #workingProgress: workingProgress,
            #taskStatus: taskStatus,
            #workList: workList,
            #topicList: topicList,
            #id: id,
            #subject: subject,
            #createdDate: createdDate,
            #creator: creator,
            #userList: userList,
            #tagList: tagList,
            #reminderList: reminderList,
            #remoteTaskId: remoteTaskId,
            #lastUpdate: lastUpdate,
            #lastViewDate: lastViewDate,
            #remoteViews: remoteViews,
            #views: views,
            #checksum: checksum,
          },
        ),
        returnValue: _FakeTaskModel_0(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #status: status,
              #startDate: startDate,
              #endDate: endDate,
              #workingTime: workingTime,
              #estimatedTime: estimatedTime,
              #estimatedLeftTime: estimatedLeftTime,
              #workingProgress: workingProgress,
              #taskStatus: taskStatus,
              #workList: workList,
              #topicList: topicList,
              #id: id,
              #subject: subject,
              #createdDate: createdDate,
              #creator: creator,
              #userList: userList,
              #tagList: tagList,
              #reminderList: reminderList,
              #remoteTaskId: remoteTaskId,
              #lastUpdate: lastUpdate,
              #lastViewDate: lastViewDate,
              #remoteViews: remoteViews,
              #views: views,
              #checksum: checksum,
            },
          ),
        ),
        returnValueForMissingStub: _FakeTaskModel_0(
          this,
          Invocation.method(
            #copyWith,
            [],
            {
              #status: status,
              #startDate: startDate,
              #endDate: endDate,
              #workingTime: workingTime,
              #estimatedTime: estimatedTime,
              #estimatedLeftTime: estimatedLeftTime,
              #workingProgress: workingProgress,
              #taskStatus: taskStatus,
              #workList: workList,
              #topicList: topicList,
              #id: id,
              #subject: subject,
              #createdDate: createdDate,
              #creator: creator,
              #userList: userList,
              #tagList: tagList,
              #reminderList: reminderList,
              #remoteTaskId: remoteTaskId,
              #lastUpdate: lastUpdate,
              #lastViewDate: lastViewDate,
              #remoteViews: remoteViews,
              #views: views,
              #checksum: checksum,
            },
          ),
        ),
      ) as _i2.TaskModel);

  @override
  bool changeState() => (super.noSuchMethod(
        Invocation.method(
          #changeState,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [TaskRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskRepository extends _i1.Mock implements _i8.TaskRepository {
  @override
  _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>> putTask(
          _i2.TaskEntity? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #putTask,
          [task],
        ),
        returnValue:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #putTask,
            [task],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #putTask,
            [task],
          ),
        )),
      ) as _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>);

  @override
  _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>> postTask(
          _i2.TaskEntity? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #postTask,
          [task],
        ),
        returnValue:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #postTask,
            [task],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #postTask,
            [task],
          ),
        )),
      ) as _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>);

  @override
  _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>> getTaskById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTaskById,
          [id],
        ),
        returnValue:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #getTaskById,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #getTaskById,
            [id],
          ),
        )),
      ) as _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>);

  @override
  _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>> getTaskByIdSet(
          _i12.IdSet? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTaskByIdSet,
          [id],
        ),
        returnValue:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #getTaskByIdSet,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #getTaskByIdSet,
            [id],
          ),
        )),
      ) as _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>);

  @override
  _i10.Future<_i5.Either<_i21.Failure, _i3.OrganizerItems>> getTaskListByIdSet(
          _i12.IdSet? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTaskListByIdSet,
          [id],
        ),
        returnValue:
            _i10.Future<_i5.Either<_i21.Failure, _i3.OrganizerItems>>.value(
                _FakeEither_4<_i21.Failure, _i3.OrganizerItems>(
          this,
          Invocation.method(
            #getTaskListByIdSet,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i5.Either<_i21.Failure, _i3.OrganizerItems>>.value(
                _FakeEither_4<_i21.Failure, _i3.OrganizerItems>(
          this,
          Invocation.method(
            #getTaskListByIdSet,
            [id],
          ),
        )),
      ) as _i10.Future<_i5.Either<_i21.Failure, _i3.OrganizerItems>>);

  @override
  _i10.Future<void> deleteTask(_i2.TaskEntity? task) => (super.noSuchMethod(
        Invocation.method(
          #deleteTask,
          [task],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
}

/// A class which mocks [DataConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataConnectionChecker extends _i1.Mock
    implements _i6.DataConnectionChecker {
  @override
  List<_i6.AddressCheckOptions> get addresses => (super.noSuchMethod(
        Invocation.getter(#addresses),
        returnValue: <_i6.AddressCheckOptions>[],
        returnValueForMissingStub: <_i6.AddressCheckOptions>[],
      ) as List<_i6.AddressCheckOptions>);

  @override
  set addresses(List<_i6.AddressCheckOptions>? _addresses) =>
      super.noSuchMethod(
        Invocation.setter(
          #addresses,
          _addresses,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Duration get checkInterval => (super.noSuchMethod(
        Invocation.getter(#checkInterval),
        returnValue: _FakeDuration_5(
          this,
          Invocation.getter(#checkInterval),
        ),
        returnValueForMissingStub: _FakeDuration_5(
          this,
          Invocation.getter(#checkInterval),
        ),
      ) as Duration);

  @override
  set checkInterval(Duration? _checkInterval) => super.noSuchMethod(
        Invocation.setter(
          #checkInterval,
          _checkInterval,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i6.AddressCheckResult> get lastTryResults => (super.noSuchMethod(
        Invocation.getter(#lastTryResults),
        returnValue: <_i6.AddressCheckResult>[],
        returnValueForMissingStub: <_i6.AddressCheckResult>[],
      ) as List<_i6.AddressCheckResult>);

  @override
  _i10.Future<bool> get hasConnection => (super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: _i10.Future<bool>.value(false),
        returnValueForMissingStub: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);

  @override
  _i10.Future<_i6.DataConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(
        Invocation.getter(#connectionStatus),
        returnValue: _i10.Future<_i6.DataConnectionStatus>.value(
            _i6.DataConnectionStatus.disconnected),
        returnValueForMissingStub: _i10.Future<_i6.DataConnectionStatus>.value(
            _i6.DataConnectionStatus.disconnected),
      ) as _i10.Future<_i6.DataConnectionStatus>);

  @override
  _i10.Stream<_i6.DataConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(
        Invocation.getter(#onStatusChange),
        returnValue: _i10.Stream<_i6.DataConnectionStatus>.empty(),
        returnValueForMissingStub:
            _i10.Stream<_i6.DataConnectionStatus>.empty(),
      ) as _i10.Stream<_i6.DataConnectionStatus>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isActivelyChecking => (super.noSuchMethod(
        Invocation.getter(#isActivelyChecking),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i10.Future<_i6.AddressCheckResult> isHostReachable(
          _i6.AddressCheckOptions? options) =>
      (super.noSuchMethod(
        Invocation.method(
          #isHostReachable,
          [options],
        ),
        returnValue:
            _i10.Future<_i6.AddressCheckResult>.value(_FakeAddressCheckResult_6(
          this,
          Invocation.method(
            #isHostReachable,
            [options],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i6.AddressCheckResult>.value(_FakeAddressCheckResult_6(
          this,
          Invocation.method(
            #isHostReachable,
            [options],
          ),
        )),
      ) as _i10.Future<_i6.AddressCheckResult>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i7.Client {
  @override
  _i10.Future<_i7.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i10.Future<_i7.Response>);

  @override
  _i10.Future<_i7.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i10.Future<_i7.Response>);

  @override
  _i10.Future<_i7.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i22.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i10.Future<_i7.Response>);

  @override
  _i10.Future<_i7.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i22.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i10.Future<_i7.Response>);

  @override
  _i10.Future<_i7.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i22.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i10.Future<_i7.Response>);

  @override
  _i10.Future<_i7.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i22.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i7.Response>.value(_FakeResponse_7(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i10.Future<_i7.Response>);

  @override
  _i10.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i10.Future<String>.value(_i15.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<String>.value(_i15.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i10.Future<String>);

  @override
  _i10.Future<_i23.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i10.Future<_i23.Uint8List>.value(_i23.Uint8List(0)),
        returnValueForMissingStub:
            _i10.Future<_i23.Uint8List>.value(_i23.Uint8List(0)),
      ) as _i10.Future<_i23.Uint8List>);

  @override
  _i10.Future<_i7.StreamedResponse> send(_i7.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i10.Future<_i7.StreamedResponse>.value(_FakeStreamedResponse_8(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i7.StreamedResponse>.value(_FakeStreamedResponse_8(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i10.Future<_i7.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [InputConverter].
///
/// See the documentation for Mockito's code generation for more information.
class MockInputConverter extends _i1.Mock implements _i24.InputConverter {
  @override
  _i5.Either<_i21.Failure, int> stringToUnasingInteger(String? input) =>
      (super.noSuchMethod(
        Invocation.method(
          #stringToUnasingInteger,
          [input],
        ),
        returnValue: _FakeEither_4<_i21.Failure, int>(
          this,
          Invocation.method(
            #stringToUnasingInteger,
            [input],
          ),
        ),
        returnValueForMissingStub: _FakeEither_4<_i21.Failure, int>(
          this,
          Invocation.method(
            #stringToUnasingInteger,
            [input],
          ),
        ),
      ) as _i5.Either<_i21.Failure, int>);
}

/// A class which mocks [GetTaskById].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTaskById extends _i1.Mock implements _i25.GetTaskById {
  @override
  _i8.TaskRepository get taskRepository => (super.noSuchMethod(
        Invocation.getter(#taskRepository),
        returnValue: _FakeTaskRepository_9(
          this,
          Invocation.getter(#taskRepository),
        ),
        returnValueForMissingStub: _FakeTaskRepository_9(
          this,
          Invocation.getter(#taskRepository),
        ),
      ) as _i8.TaskRepository);

  @override
  _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>> call(
          _i26.Params? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>.value(
                _FakeEither_4<_i21.Failure, _i2.TaskEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i10.Future<_i5.Either<_i21.Failure, _i2.TaskEntity>>);
}
