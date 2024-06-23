// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_drift_db.dart';

// ignore_for_file: type=lint
class $TaskTableDriftTable extends TaskTableDrift
    with TableInfo<$TaskTableDriftTable, TaskTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _creatorMeta =
      const VerificationMeta('creator');
  @override
  late final GeneratedColumn<String> creator = GeneratedColumn<String>(
      'creator', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _userListMeta =
      const VerificationMeta('userList');
  @override
  late final GeneratedColumn<String> userList = GeneratedColumn<String>(
      'user_list', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagListMeta =
      const VerificationMeta('tagList');
  @override
  late final GeneratedColumn<String> tagList = GeneratedColumn<String>(
      'tag_list', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reminderListMeta =
      const VerificationMeta('reminderList');
  @override
  late final GeneratedColumn<String> reminderList = GeneratedColumn<String>(
      'reminder_list', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastViewDateMeta =
      const VerificationMeta('lastViewDate');
  @override
  late final GeneratedColumn<DateTime> lastViewDate = GeneratedColumn<DateTime>(
      'last_view_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteViewsMeta =
      const VerificationMeta('remoteViews');
  @override
  late final GeneratedColumn<int> remoteViews = GeneratedColumn<int>(
      'remote_views', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int> views = GeneratedColumn<int>(
      'views', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _checksumMeta =
      const VerificationMeta('checksum');
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
      'checksum', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _workingTimeMeta =
      const VerificationMeta('workingTime');
  @override
  late final GeneratedColumn<double> workingTime = GeneratedColumn<double>(
      'working_time', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _estimatedTimeMeta =
      const VerificationMeta('estimatedTime');
  @override
  late final GeneratedColumn<double> estimatedTime = GeneratedColumn<double>(
      'estimated_time', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _estimatedLeftTimeMeta =
      const VerificationMeta('estimatedLeftTime');
  @override
  late final GeneratedColumn<double> estimatedLeftTime =
      GeneratedColumn<double>('estimated_left_time', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _workingProgressMeta =
      const VerificationMeta('workingProgress');
  @override
  late final GeneratedColumn<double> workingProgress = GeneratedColumn<double>(
      'working_progress', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _taskStatusMeta =
      const VerificationMeta('taskStatus');
  @override
  late final GeneratedColumn<String> taskStatus = GeneratedColumn<String>(
      'task_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        subject,
        createdDate,
        creator,
        userList,
        tagList,
        reminderList,
        remoteId,
        lastUpdate,
        lastViewDate,
        remoteViews,
        views,
        checksum,
        startDate,
        endDate,
        workingTime,
        estimatedTime,
        estimatedLeftTime,
        workingProgress,
        taskStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_table_drift';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('creator')) {
      context.handle(_creatorMeta,
          creator.isAcceptableOrUnknown(data['creator']!, _creatorMeta));
    } else if (isInserting) {
      context.missing(_creatorMeta);
    }
    if (data.containsKey('user_list')) {
      context.handle(_userListMeta,
          userList.isAcceptableOrUnknown(data['user_list']!, _userListMeta));
    } else if (isInserting) {
      context.missing(_userListMeta);
    }
    if (data.containsKey('tag_list')) {
      context.handle(_tagListMeta,
          tagList.isAcceptableOrUnknown(data['tag_list']!, _tagListMeta));
    } else if (isInserting) {
      context.missing(_tagListMeta);
    }
    if (data.containsKey('reminder_list')) {
      context.handle(
          _reminderListMeta,
          reminderList.isAcceptableOrUnknown(
              data['reminder_list']!, _reminderListMeta));
    } else if (isInserting) {
      context.missing(_reminderListMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_view_date')) {
      context.handle(
          _lastViewDateMeta,
          lastViewDate.isAcceptableOrUnknown(
              data['last_view_date']!, _lastViewDateMeta));
    }
    if (data.containsKey('remote_views')) {
      context.handle(
          _remoteViewsMeta,
          remoteViews.isAcceptableOrUnknown(
              data['remote_views']!, _remoteViewsMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('checksum')) {
      context.handle(_checksumMeta,
          checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('working_time')) {
      context.handle(
          _workingTimeMeta,
          workingTime.isAcceptableOrUnknown(
              data['working_time']!, _workingTimeMeta));
    }
    if (data.containsKey('estimated_time')) {
      context.handle(
          _estimatedTimeMeta,
          estimatedTime.isAcceptableOrUnknown(
              data['estimated_time']!, _estimatedTimeMeta));
    }
    if (data.containsKey('estimated_left_time')) {
      context.handle(
          _estimatedLeftTimeMeta,
          estimatedLeftTime.isAcceptableOrUnknown(
              data['estimated_left_time']!, _estimatedLeftTimeMeta));
    }
    if (data.containsKey('working_progress')) {
      context.handle(
          _workingProgressMeta,
          workingProgress.isAcceptableOrUnknown(
              data['working_progress']!, _workingProgressMeta));
    }
    if (data.containsKey('task_status')) {
      context.handle(
          _taskStatusMeta,
          taskStatus.isAcceptableOrUnknown(
              data['task_status']!, _taskStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      creator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}creator'])!,
      userList: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_list'])!,
      tagList: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_list'])!,
      reminderList: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reminder_list'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id'])!,
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastViewDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_view_date']),
      remoteViews: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_views']),
      views: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}views']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      workingTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}working_time']),
      estimatedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}estimated_time']),
      estimatedLeftTime: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}estimated_left_time']),
      workingProgress: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}working_progress']),
      taskStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_status']),
    );
  }

  @override
  $TaskTableDriftTable createAlias(String alias) {
    return $TaskTableDriftTable(attachedDatabase, alias);
  }
}

class TaskTableDriftG extends DataClass implements Insertable<TaskTableDriftG> {
  final int id;
  final String subject;
  final DateTime createdDate;
  final String creator;
  final String userList;
  final String tagList;
  final String reminderList;
  final int remoteId;
  final DateTime? lastUpdate;
  final DateTime? lastViewDate;
  final int? remoteViews;
  final int? views;
  final String? checksum;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? workingTime;
  final double? estimatedTime;
  final double? estimatedLeftTime;
  final double? workingProgress;
  final String? taskStatus;
  const TaskTableDriftG(
      {required this.id,
      required this.subject,
      required this.createdDate,
      required this.creator,
      required this.userList,
      required this.tagList,
      required this.reminderList,
      required this.remoteId,
      this.lastUpdate,
      this.lastViewDate,
      this.remoteViews,
      this.views,
      this.checksum,
      this.startDate,
      this.endDate,
      this.workingTime,
      this.estimatedTime,
      this.estimatedLeftTime,
      this.workingProgress,
      this.taskStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject'] = Variable<String>(subject);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['creator'] = Variable<String>(creator);
    map['user_list'] = Variable<String>(userList);
    map['tag_list'] = Variable<String>(tagList);
    map['reminder_list'] = Variable<String>(reminderList);
    map['remote_id'] = Variable<int>(remoteId);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastViewDate != null) {
      map['last_view_date'] = Variable<DateTime>(lastViewDate);
    }
    if (!nullToAbsent || remoteViews != null) {
      map['remote_views'] = Variable<int>(remoteViews);
    }
    if (!nullToAbsent || views != null) {
      map['views'] = Variable<int>(views);
    }
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || workingTime != null) {
      map['working_time'] = Variable<double>(workingTime);
    }
    if (!nullToAbsent || estimatedTime != null) {
      map['estimated_time'] = Variable<double>(estimatedTime);
    }
    if (!nullToAbsent || estimatedLeftTime != null) {
      map['estimated_left_time'] = Variable<double>(estimatedLeftTime);
    }
    if (!nullToAbsent || workingProgress != null) {
      map['working_progress'] = Variable<double>(workingProgress);
    }
    if (!nullToAbsent || taskStatus != null) {
      map['task_status'] = Variable<String>(taskStatus);
    }
    return map;
  }

  TaskTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TaskTableDriftCompanion(
      id: Value(id),
      subject: Value(subject),
      createdDate: Value(createdDate),
      creator: Value(creator),
      userList: Value(userList),
      tagList: Value(tagList),
      reminderList: Value(reminderList),
      remoteId: Value(remoteId),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastViewDate: lastViewDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastViewDate),
      remoteViews: remoteViews == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteViews),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      workingTime: workingTime == null && nullToAbsent
          ? const Value.absent()
          : Value(workingTime),
      estimatedTime: estimatedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedTime),
      estimatedLeftTime: estimatedLeftTime == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedLeftTime),
      workingProgress: workingProgress == null && nullToAbsent
          ? const Value.absent()
          : Value(workingProgress),
      taskStatus: taskStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(taskStatus),
    );
  }

  factory TaskTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      creator: serializer.fromJson<String>(json['creator']),
      userList: serializer.fromJson<String>(json['userList']),
      tagList: serializer.fromJson<String>(json['tagList']),
      reminderList: serializer.fromJson<String>(json['reminderList']),
      remoteId: serializer.fromJson<int>(json['remoteId']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastViewDate: serializer.fromJson<DateTime?>(json['lastViewDate']),
      remoteViews: serializer.fromJson<int?>(json['remoteViews']),
      views: serializer.fromJson<int?>(json['views']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      workingTime: serializer.fromJson<double?>(json['workingTime']),
      estimatedTime: serializer.fromJson<double?>(json['estimatedTime']),
      estimatedLeftTime:
          serializer.fromJson<double?>(json['estimatedLeftTime']),
      workingProgress: serializer.fromJson<double?>(json['workingProgress']),
      taskStatus: serializer.fromJson<String?>(json['taskStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subject': serializer.toJson<String>(subject),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'creator': serializer.toJson<String>(creator),
      'userList': serializer.toJson<String>(userList),
      'tagList': serializer.toJson<String>(tagList),
      'reminderList': serializer.toJson<String>(reminderList),
      'remoteId': serializer.toJson<int>(remoteId),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastViewDate': serializer.toJson<DateTime?>(lastViewDate),
      'remoteViews': serializer.toJson<int?>(remoteViews),
      'views': serializer.toJson<int?>(views),
      'checksum': serializer.toJson<String?>(checksum),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'workingTime': serializer.toJson<double?>(workingTime),
      'estimatedTime': serializer.toJson<double?>(estimatedTime),
      'estimatedLeftTime': serializer.toJson<double?>(estimatedLeftTime),
      'workingProgress': serializer.toJson<double?>(workingProgress),
      'taskStatus': serializer.toJson<String?>(taskStatus),
    };
  }

  TaskTableDriftG copyWith(
          {int? id,
          String? subject,
          DateTime? createdDate,
          String? creator,
          String? userList,
          String? tagList,
          String? reminderList,
          int? remoteId,
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastViewDate = const Value.absent(),
          Value<int?> remoteViews = const Value.absent(),
          Value<int?> views = const Value.absent(),
          Value<String?> checksum = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<double?> workingTime = const Value.absent(),
          Value<double?> estimatedTime = const Value.absent(),
          Value<double?> estimatedLeftTime = const Value.absent(),
          Value<double?> workingProgress = const Value.absent(),
          Value<String?> taskStatus = const Value.absent()}) =>
      TaskTableDriftG(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        createdDate: createdDate ?? this.createdDate,
        creator: creator ?? this.creator,
        userList: userList ?? this.userList,
        tagList: tagList ?? this.tagList,
        reminderList: reminderList ?? this.reminderList,
        remoteId: remoteId ?? this.remoteId,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastViewDate:
            lastViewDate.present ? lastViewDate.value : this.lastViewDate,
        remoteViews: remoteViews.present ? remoteViews.value : this.remoteViews,
        views: views.present ? views.value : this.views,
        checksum: checksum.present ? checksum.value : this.checksum,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        workingTime: workingTime.present ? workingTime.value : this.workingTime,
        estimatedTime:
            estimatedTime.present ? estimatedTime.value : this.estimatedTime,
        estimatedLeftTime: estimatedLeftTime.present
            ? estimatedLeftTime.value
            : this.estimatedLeftTime,
        workingProgress: workingProgress.present
            ? workingProgress.value
            : this.workingProgress,
        taskStatus: taskStatus.present ? taskStatus.value : this.taskStatus,
      );
  @override
  String toString() {
    return (StringBuffer('TaskTableDriftG(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('creator: $creator, ')
          ..write('userList: $userList, ')
          ..write('tagList: $tagList, ')
          ..write('reminderList: $reminderList, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewDate: $lastViewDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('workingTime: $workingTime, ')
          ..write('estimatedTime: $estimatedTime, ')
          ..write('estimatedLeftTime: $estimatedLeftTime, ')
          ..write('workingProgress: $workingProgress, ')
          ..write('taskStatus: $taskStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      subject,
      createdDate,
      creator,
      userList,
      tagList,
      reminderList,
      remoteId,
      lastUpdate,
      lastViewDate,
      remoteViews,
      views,
      checksum,
      startDate,
      endDate,
      workingTime,
      estimatedTime,
      estimatedLeftTime,
      workingProgress,
      taskStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableDriftG &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate &&
          other.creator == this.creator &&
          other.userList == this.userList &&
          other.tagList == this.tagList &&
          other.reminderList == this.reminderList &&
          other.remoteId == this.remoteId &&
          other.lastUpdate == this.lastUpdate &&
          other.lastViewDate == this.lastViewDate &&
          other.remoteViews == this.remoteViews &&
          other.views == this.views &&
          other.checksum == this.checksum &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.workingTime == this.workingTime &&
          other.estimatedTime == this.estimatedTime &&
          other.estimatedLeftTime == this.estimatedLeftTime &&
          other.workingProgress == this.workingProgress &&
          other.taskStatus == this.taskStatus);
}

class TaskTableDriftCompanion extends UpdateCompanion<TaskTableDriftG> {
  final Value<int> id;
  final Value<String> subject;
  final Value<DateTime> createdDate;
  final Value<String> creator;
  final Value<String> userList;
  final Value<String> tagList;
  final Value<String> reminderList;
  final Value<int> remoteId;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastViewDate;
  final Value<int?> remoteViews;
  final Value<int?> views;
  final Value<String?> checksum;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<double?> workingTime;
  final Value<double?> estimatedTime;
  final Value<double?> estimatedLeftTime;
  final Value<double?> workingProgress;
  final Value<String?> taskStatus;
  const TaskTableDriftCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.creator = const Value.absent(),
    this.userList = const Value.absent(),
    this.tagList = const Value.absent(),
    this.reminderList = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.workingTime = const Value.absent(),
    this.estimatedTime = const Value.absent(),
    this.estimatedLeftTime = const Value.absent(),
    this.workingProgress = const Value.absent(),
    this.taskStatus = const Value.absent(),
  });
  TaskTableDriftCompanion.insert({
    this.id = const Value.absent(),
    required String subject,
    required DateTime createdDate,
    required String creator,
    required String userList,
    required String tagList,
    required String reminderList,
    required int remoteId,
    this.lastUpdate = const Value.absent(),
    this.lastViewDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.workingTime = const Value.absent(),
    this.estimatedTime = const Value.absent(),
    this.estimatedLeftTime = const Value.absent(),
    this.workingProgress = const Value.absent(),
    this.taskStatus = const Value.absent(),
  })  : subject = Value(subject),
        createdDate = Value(createdDate),
        creator = Value(creator),
        userList = Value(userList),
        tagList = Value(tagList),
        reminderList = Value(reminderList),
        remoteId = Value(remoteId);
  static Insertable<TaskTableDriftG> custom({
    Expression<int>? id,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<String>? creator,
    Expression<String>? userList,
    Expression<String>? tagList,
    Expression<String>? reminderList,
    Expression<int>? remoteId,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastViewDate,
    Expression<int>? remoteViews,
    Expression<int>? views,
    Expression<String>? checksum,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<double>? workingTime,
    Expression<double>? estimatedTime,
    Expression<double>? estimatedLeftTime,
    Expression<double>? workingProgress,
    Expression<String>? taskStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
      if (creator != null) 'creator': creator,
      if (userList != null) 'user_list': userList,
      if (tagList != null) 'tag_list': tagList,
      if (reminderList != null) 'reminder_list': reminderList,
      if (remoteId != null) 'remote_id': remoteId,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastViewDate != null) 'last_view_date': lastViewDate,
      if (remoteViews != null) 'remote_views': remoteViews,
      if (views != null) 'views': views,
      if (checksum != null) 'checksum': checksum,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (workingTime != null) 'working_time': workingTime,
      if (estimatedTime != null) 'estimated_time': estimatedTime,
      if (estimatedLeftTime != null) 'estimated_left_time': estimatedLeftTime,
      if (workingProgress != null) 'working_progress': workingProgress,
      if (taskStatus != null) 'task_status': taskStatus,
    });
  }

  TaskTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<String>? subject,
      Value<DateTime>? createdDate,
      Value<String>? creator,
      Value<String>? userList,
      Value<String>? tagList,
      Value<String>? reminderList,
      Value<int>? remoteId,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastViewDate,
      Value<int?>? remoteViews,
      Value<int?>? views,
      Value<String?>? checksum,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<double?>? workingTime,
      Value<double?>? estimatedTime,
      Value<double?>? estimatedLeftTime,
      Value<double?>? workingProgress,
      Value<String?>? taskStatus}) {
    return TaskTableDriftCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      creator: creator ?? this.creator,
      userList: userList ?? this.userList,
      tagList: tagList ?? this.tagList,
      reminderList: reminderList ?? this.reminderList,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewDate: lastViewDate ?? this.lastViewDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      workingTime: workingTime ?? this.workingTime,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      estimatedLeftTime: estimatedLeftTime ?? this.estimatedLeftTime,
      workingProgress: workingProgress ?? this.workingProgress,
      taskStatus: taskStatus ?? this.taskStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (creator.present) {
      map['creator'] = Variable<String>(creator.value);
    }
    if (userList.present) {
      map['user_list'] = Variable<String>(userList.value);
    }
    if (tagList.present) {
      map['tag_list'] = Variable<String>(tagList.value);
    }
    if (reminderList.present) {
      map['reminder_list'] = Variable<String>(reminderList.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastViewDate.present) {
      map['last_view_date'] = Variable<DateTime>(lastViewDate.value);
    }
    if (remoteViews.present) {
      map['remote_views'] = Variable<int>(remoteViews.value);
    }
    if (views.present) {
      map['views'] = Variable<int>(views.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (workingTime.present) {
      map['working_time'] = Variable<double>(workingTime.value);
    }
    if (estimatedTime.present) {
      map['estimated_time'] = Variable<double>(estimatedTime.value);
    }
    if (estimatedLeftTime.present) {
      map['estimated_left_time'] = Variable<double>(estimatedLeftTime.value);
    }
    if (workingProgress.present) {
      map['working_progress'] = Variable<double>(workingProgress.value);
    }
    if (taskStatus.present) {
      map['task_status'] = Variable<String>(taskStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('creator: $creator, ')
          ..write('userList: $userList, ')
          ..write('tagList: $tagList, ')
          ..write('reminderList: $reminderList, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewDate: $lastViewDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('workingTime: $workingTime, ')
          ..write('estimatedTime: $estimatedTime, ')
          ..write('estimatedLeftTime: $estimatedLeftTime, ')
          ..write('workingProgress: $workingProgress, ')
          ..write('taskStatus: $taskStatus')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, subject, createdDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_table';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final int id;
  final String subject;
  final DateTime createdDate;
  const TaskTableData(
      {required this.id, required this.subject, required this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject'] = Variable<String>(subject);
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      subject: Value(subject),
      createdDate: Value(createdDate),
    );
  }

  factory TaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<int>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subject': serializer.toJson<String>(subject),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  TaskTableData copyWith({int? id, String? subject, DateTime? createdDate}) =>
      TaskTableData(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subject, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> id;
  final Value<String> subject;
  final Value<DateTime> createdDate;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String subject,
    required DateTime createdDate,
  })  : subject = Value(subject),
        createdDate = Value(createdDate);
  static Insertable<TaskTableData> custom({
    Expression<int>? id,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  TaskTableCompanion copyWith(
      {Value<int>? id, Value<String>? subject, Value<DateTime>? createdDate}) {
    return TaskTableCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$OrganizerDriftDB extends GeneratedDatabase {
  _$OrganizerDriftDB(QueryExecutor e) : super(e);
  _$OrganizerDriftDBManager get managers => _$OrganizerDriftDBManager(this);
  late final $TaskTableDriftTable taskTableDrift = $TaskTableDriftTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final TaskDaoDrift taskDaoDrift = TaskDaoDrift(this as OrganizerDriftDB);
  late final TaskDao taskDao = TaskDao(this as OrganizerDriftDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [taskTableDrift, taskTable];
}

typedef $$TaskTableDriftTableInsertCompanionBuilder = TaskTableDriftCompanion
    Function({
  Value<int> id,
  required String subject,
  required DateTime createdDate,
  required String creator,
  required String userList,
  required String tagList,
  required String reminderList,
  required int remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<double?> workingTime,
  Value<double?> estimatedTime,
  Value<double?> estimatedLeftTime,
  Value<double?> workingProgress,
  Value<String?> taskStatus,
});
typedef $$TaskTableDriftTableUpdateCompanionBuilder = TaskTableDriftCompanion
    Function({
  Value<int> id,
  Value<String> subject,
  Value<DateTime> createdDate,
  Value<String> creator,
  Value<String> userList,
  Value<String> tagList,
  Value<String> reminderList,
  Value<int> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<double?> workingTime,
  Value<double?> estimatedTime,
  Value<double?> estimatedLeftTime,
  Value<double?> workingProgress,
  Value<String?> taskStatus,
});

class $$TaskTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskTableDriftTable,
    TaskTableDriftG,
    $$TaskTableDriftTableFilterComposer,
    $$TaskTableDriftTableOrderingComposer,
    $$TaskTableDriftTableProcessedTableManager,
    $$TaskTableDriftTableInsertCompanionBuilder,
    $$TaskTableDriftTableUpdateCompanionBuilder> {
  $$TaskTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TaskTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaskTableDriftTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TaskTableDriftTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TaskTableDriftTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<String> creator = const Value.absent(),
            Value<String> userList = const Value.absent(),
            Value<String> tagList = const Value.absent(),
            Value<String> reminderList = const Value.absent(),
            Value<int> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<double?> workingTime = const Value.absent(),
            Value<double?> estimatedTime = const Value.absent(),
            Value<double?> estimatedLeftTime = const Value.absent(),
            Value<double?> workingProgress = const Value.absent(),
            Value<String?> taskStatus = const Value.absent(),
          }) =>
              TaskTableDriftCompanion(
            id: id,
            subject: subject,
            createdDate: createdDate,
            creator: creator,
            userList: userList,
            tagList: tagList,
            reminderList: reminderList,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastViewDate: lastViewDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
            startDate: startDate,
            endDate: endDate,
            workingTime: workingTime,
            estimatedTime: estimatedTime,
            estimatedLeftTime: estimatedLeftTime,
            workingProgress: workingProgress,
            taskStatus: taskStatus,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String subject,
            required DateTime createdDate,
            required String creator,
            required String userList,
            required String tagList,
            required String reminderList,
            required int remoteId,
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<double?> workingTime = const Value.absent(),
            Value<double?> estimatedTime = const Value.absent(),
            Value<double?> estimatedLeftTime = const Value.absent(),
            Value<double?> workingProgress = const Value.absent(),
            Value<String?> taskStatus = const Value.absent(),
          }) =>
              TaskTableDriftCompanion.insert(
            id: id,
            subject: subject,
            createdDate: createdDate,
            creator: creator,
            userList: userList,
            tagList: tagList,
            reminderList: reminderList,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastViewDate: lastViewDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
            startDate: startDate,
            endDate: endDate,
            workingTime: workingTime,
            estimatedTime: estimatedTime,
            estimatedLeftTime: estimatedLeftTime,
            workingProgress: workingProgress,
            taskStatus: taskStatus,
          ),
        ));
}

class $$TaskTableDriftTableProcessedTableManager extends ProcessedTableManager<
    _$OrganizerDriftDB,
    $TaskTableDriftTable,
    TaskTableDriftG,
    $$TaskTableDriftTableFilterComposer,
    $$TaskTableDriftTableOrderingComposer,
    $$TaskTableDriftTableProcessedTableManager,
    $$TaskTableDriftTableInsertCompanionBuilder,
    $$TaskTableDriftTableUpdateCompanionBuilder> {
  $$TaskTableDriftTableProcessedTableManager(super.$state);
}

class $$TaskTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $TaskTableDriftTable> {
  $$TaskTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get creator => $state.composableBuilder(
      column: $state.table.creator,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userList => $state.composableBuilder(
      column: $state.table.userList,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tagList => $state.composableBuilder(
      column: $state.table.tagList,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get reminderList => $state.composableBuilder(
      column: $state.table.reminderList,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastUpdate => $state.composableBuilder(
      column: $state.table.lastUpdate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastViewDate => $state.composableBuilder(
      column: $state.table.lastViewDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get remoteViews => $state.composableBuilder(
      column: $state.table.remoteViews,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get views => $state.composableBuilder(
      column: $state.table.views,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get workingTime => $state.composableBuilder(
      column: $state.table.workingTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get estimatedTime => $state.composableBuilder(
      column: $state.table.estimatedTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get estimatedLeftTime => $state.composableBuilder(
      column: $state.table.estimatedLeftTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get workingProgress => $state.composableBuilder(
      column: $state.table.workingProgress,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get taskStatus => $state.composableBuilder(
      column: $state.table.taskStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskTableDriftTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $TaskTableDriftTable> {
  $$TaskTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get creator => $state.composableBuilder(
      column: $state.table.creator,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userList => $state.composableBuilder(
      column: $state.table.userList,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tagList => $state.composableBuilder(
      column: $state.table.tagList,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reminderList => $state.composableBuilder(
      column: $state.table.reminderList,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get remoteId => $state.composableBuilder(
      column: $state.table.remoteId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastUpdate => $state.composableBuilder(
      column: $state.table.lastUpdate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastViewDate => $state.composableBuilder(
      column: $state.table.lastViewDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get remoteViews => $state.composableBuilder(
      column: $state.table.remoteViews,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get views => $state.composableBuilder(
      column: $state.table.views,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get workingTime => $state.composableBuilder(
      column: $state.table.workingTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get estimatedTime => $state.composableBuilder(
      column: $state.table.estimatedTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get estimatedLeftTime => $state.composableBuilder(
      column: $state.table.estimatedLeftTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get workingProgress => $state.composableBuilder(
      column: $state.table.workingProgress,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get taskStatus => $state.composableBuilder(
      column: $state.table.taskStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TaskTableTableInsertCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  required String subject,
  required DateTime createdDate,
});
typedef $$TaskTableTableUpdateCompanionBuilder = TaskTableCompanion Function({
  Value<int> id,
  Value<String> subject,
  Value<DateTime> createdDate,
});

class $$TaskTableTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskTableTable,
    TaskTableData,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableProcessedTableManager,
    $$TaskTableTableInsertCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder> {
  $$TaskTableTableTableManager(_$OrganizerDriftDB db, $TaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaskTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TaskTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TaskTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
          }) =>
              TaskTableCompanion(
            id: id,
            subject: subject,
            createdDate: createdDate,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String subject,
            required DateTime createdDate,
          }) =>
              TaskTableCompanion.insert(
            id: id,
            subject: subject,
            createdDate: createdDate,
          ),
        ));
}

class $$TaskTableTableProcessedTableManager extends ProcessedTableManager<
    _$OrganizerDriftDB,
    $TaskTableTable,
    TaskTableData,
    $$TaskTableTableFilterComposer,
    $$TaskTableTableOrderingComposer,
    $$TaskTableTableProcessedTableManager,
    $$TaskTableTableInsertCompanionBuilder,
    $$TaskTableTableUpdateCompanionBuilder> {
  $$TaskTableTableProcessedTableManager(super.$state);
}

class $$TaskTableTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $TaskTableTable> {
  $$TaskTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskTableTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $TaskTableTable> {
  $$TaskTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$OrganizerDriftDBManager {
  final _$OrganizerDriftDB _db;
  _$OrganizerDriftDBManager(this._db);
  $$TaskTableDriftTableTableManager get taskTableDrift =>
      $$TaskTableDriftTableTableManager(_db, _db.taskTableDrift);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
}
