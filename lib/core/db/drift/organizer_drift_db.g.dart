// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_drift_db.dart';

// ignore_for_file: type=lint
class $OrganizerItemTableDriftTable extends OrganizerItemTableDrift
    with TableInfo<$OrganizerItemTableDriftTable, OrganizerItemTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizerItemTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastViewedDateMeta =
      const VerificationMeta('lastViewedDate');
  @override
  late final GeneratedColumn<DateTime> lastViewedDate =
      GeneratedColumn<DateTime>('last_viewed_date', aliasedName, true,
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        creatorId,
        subject,
        createdDate,
        lastUpdate,
        lastViewedDate,
        remoteViews,
        views,
        checksum
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organizer_item_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<OrganizerItemTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_viewed_date')) {
      context.handle(
          _lastViewedDateMeta,
          lastViewedDate.isAcceptableOrUnknown(
              data['last_viewed_date']!, _lastViewedDateMeta));
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrganizerItemTableDriftG map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganizerItemTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastViewedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_viewed_date']),
      remoteViews: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_views']),
      views: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}views']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
    );
  }

  @override
  $OrganizerItemTableDriftTable createAlias(String alias) {
    return $OrganizerItemTableDriftTable(attachedDatabase, alias);
  }
}

class OrganizerItemTableDriftG extends DataClass
    implements Insertable<OrganizerItemTableDriftG> {
  final int id;
  final int? remoteId;
  final int? creatorId;
  final String? subject;
  final DateTime createdDate;
  final DateTime? lastUpdate;
  final DateTime? lastViewedDate;
  final int? remoteViews;
  final int? views;
  final String? checksum;
  const OrganizerItemTableDriftG(
      {required this.id,
      this.remoteId,
      this.creatorId,
      this.subject,
      required this.createdDate,
      this.lastUpdate,
      this.lastViewedDate,
      this.remoteViews,
      this.views,
      this.checksum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || creatorId != null) {
      map['creator_id'] = Variable<int>(creatorId);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastViewedDate != null) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate);
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
    return map;
  }

  OrganizerItemTableDriftCompanion toCompanion(bool nullToAbsent) {
    return OrganizerItemTableDriftCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      creatorId: creatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorId),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      createdDate: Value(createdDate),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastViewedDate: lastViewedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastViewedDate),
      remoteViews: remoteViews == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteViews),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
    );
  }

  factory OrganizerItemTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizerItemTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      creatorId: serializer.fromJson<int?>(json['creatorId']),
      subject: serializer.fromJson<String?>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastViewedDate: serializer.fromJson<DateTime?>(json['lastViewedDate']),
      remoteViews: serializer.fromJson<int?>(json['remoteViews']),
      views: serializer.fromJson<int?>(json['views']),
      checksum: serializer.fromJson<String?>(json['checksum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'creatorId': serializer.toJson<int?>(creatorId),
      'subject': serializer.toJson<String?>(subject),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastViewedDate': serializer.toJson<DateTime?>(lastViewedDate),
      'remoteViews': serializer.toJson<int?>(remoteViews),
      'views': serializer.toJson<int?>(views),
      'checksum': serializer.toJson<String?>(checksum),
    };
  }

  OrganizerItemTableDriftG copyWith(
          {int? id,
          Value<int?> remoteId = const Value.absent(),
          Value<int?> creatorId = const Value.absent(),
          Value<String?> subject = const Value.absent(),
          DateTime? createdDate,
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastViewedDate = const Value.absent(),
          Value<int?> remoteViews = const Value.absent(),
          Value<int?> views = const Value.absent(),
          Value<String?> checksum = const Value.absent()}) =>
      OrganizerItemTableDriftG(
        id: id ?? this.id,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        creatorId: creatorId.present ? creatorId.value : this.creatorId,
        subject: subject.present ? subject.value : this.subject,
        createdDate: createdDate ?? this.createdDate,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastViewedDate:
            lastViewedDate.present ? lastViewedDate.value : this.lastViewedDate,
        remoteViews: remoteViews.present ? remoteViews.value : this.remoteViews,
        views: views.present ? views.value : this.views,
        checksum: checksum.present ? checksum.value : this.checksum,
      );
  OrganizerItemTableDriftG copyWithCompanion(
      OrganizerItemTableDriftCompanion data) {
    return OrganizerItemTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      subject: data.subject.present ? data.subject.value : this.subject,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastViewedDate: data.lastViewedDate.present
          ? data.lastViewedDate.value
          : this.lastViewedDate,
      remoteViews:
          data.remoteViews.present ? data.remoteViews.value : this.remoteViews,
      views: data.views.present ? data.views.value : this.views,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganizerItemTableDriftG(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, remoteId, creatorId, subject, createdDate,
      lastUpdate, lastViewedDate, remoteViews, views, checksum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizerItemTableDriftG &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.creatorId == this.creatorId &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate &&
          other.lastUpdate == this.lastUpdate &&
          other.lastViewedDate == this.lastViewedDate &&
          other.remoteViews == this.remoteViews &&
          other.views == this.views &&
          other.checksum == this.checksum);
}

class OrganizerItemTableDriftCompanion
    extends UpdateCompanion<OrganizerItemTableDriftG> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int?> creatorId;
  final Value<String?> subject;
  final Value<DateTime> createdDate;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastViewedDate;
  final Value<int?> remoteViews;
  final Value<int?> views;
  final Value<String?> checksum;
  const OrganizerItemTableDriftCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
  });
  OrganizerItemTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
  });
  static Insertable<OrganizerItemTableDriftG> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? creatorId,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastViewedDate,
    Expression<int>? remoteViews,
    Expression<int>? views,
    Expression<String>? checksum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (creatorId != null) 'creator_id': creatorId,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastViewedDate != null) 'last_viewed_date': lastViewedDate,
      if (remoteViews != null) 'remote_views': remoteViews,
      if (views != null) 'views': views,
      if (checksum != null) 'checksum': checksum,
    });
  }

  OrganizerItemTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<int?>? remoteId,
      Value<int?>? creatorId,
      Value<String?>? subject,
      Value<DateTime>? createdDate,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastViewedDate,
      Value<int?>? remoteViews,
      Value<int?>? views,
      Value<String?>? checksum}) {
    return OrganizerItemTableDriftCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      creatorId: creatorId ?? this.creatorId,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastViewedDate.present) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizerItemTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastViewedDateMeta =
      const VerificationMeta('lastViewedDate');
  @override
  late final GeneratedColumn<DateTime> lastViewedDate =
      GeneratedColumn<DateTime>('last_viewed_date', aliasedName, true,
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
        remoteId,
        creatorId,
        subject,
        createdDate,
        lastUpdate,
        lastViewedDate,
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
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_viewed_date')) {
      context.handle(
          _lastViewedDateMeta,
          lastViewedDate.isAcceptableOrUnknown(
              data['last_viewed_date']!, _lastViewedDateMeta));
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
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastViewedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_viewed_date']),
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
  final int? remoteId;
  final int? creatorId;
  final String? subject;
  final DateTime createdDate;
  final DateTime? lastUpdate;
  final DateTime? lastViewedDate;
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
      this.remoteId,
      this.creatorId,
      this.subject,
      required this.createdDate,
      this.lastUpdate,
      this.lastViewedDate,
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
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || creatorId != null) {
      map['creator_id'] = Variable<int>(creatorId);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastViewedDate != null) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate);
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
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      creatorId: creatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorId),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      createdDate: Value(createdDate),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastViewedDate: lastViewedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastViewedDate),
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
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      creatorId: serializer.fromJson<int?>(json['creatorId']),
      subject: serializer.fromJson<String?>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastViewedDate: serializer.fromJson<DateTime?>(json['lastViewedDate']),
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
      'remoteId': serializer.toJson<int?>(remoteId),
      'creatorId': serializer.toJson<int?>(creatorId),
      'subject': serializer.toJson<String?>(subject),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastViewedDate': serializer.toJson<DateTime?>(lastViewedDate),
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
          Value<int?> remoteId = const Value.absent(),
          Value<int?> creatorId = const Value.absent(),
          Value<String?> subject = const Value.absent(),
          DateTime? createdDate,
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastViewedDate = const Value.absent(),
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
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        creatorId: creatorId.present ? creatorId.value : this.creatorId,
        subject: subject.present ? subject.value : this.subject,
        createdDate: createdDate ?? this.createdDate,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastViewedDate:
            lastViewedDate.present ? lastViewedDate.value : this.lastViewedDate,
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
  TaskTableDriftG copyWithCompanion(TaskTableDriftCompanion data) {
    return TaskTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      subject: data.subject.present ? data.subject.value : this.subject,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastViewedDate: data.lastViewedDate.present
          ? data.lastViewedDate.value
          : this.lastViewedDate,
      remoteViews:
          data.remoteViews.present ? data.remoteViews.value : this.remoteViews,
      views: data.views.present ? data.views.value : this.views,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      workingTime:
          data.workingTime.present ? data.workingTime.value : this.workingTime,
      estimatedTime: data.estimatedTime.present
          ? data.estimatedTime.value
          : this.estimatedTime,
      estimatedLeftTime: data.estimatedLeftTime.present
          ? data.estimatedLeftTime.value
          : this.estimatedLeftTime,
      workingProgress: data.workingProgress.present
          ? data.workingProgress.value
          : this.workingProgress,
      taskStatus:
          data.taskStatus.present ? data.taskStatus.value : this.taskStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableDriftG(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
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
      remoteId,
      creatorId,
      subject,
      createdDate,
      lastUpdate,
      lastViewedDate,
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
          other.remoteId == this.remoteId &&
          other.creatorId == this.creatorId &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate &&
          other.lastUpdate == this.lastUpdate &&
          other.lastViewedDate == this.lastViewedDate &&
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
  final Value<int?> remoteId;
  final Value<int?> creatorId;
  final Value<String?> subject;
  final Value<DateTime> createdDate;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastViewedDate;
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
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
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
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
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
  static Insertable<TaskTableDriftG> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? creatorId,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastViewedDate,
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
      if (remoteId != null) 'remote_id': remoteId,
      if (creatorId != null) 'creator_id': creatorId,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastViewedDate != null) 'last_viewed_date': lastViewedDate,
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
      Value<int?>? remoteId,
      Value<int?>? creatorId,
      Value<String?>? subject,
      Value<DateTime>? createdDate,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastViewedDate,
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
      remoteId: remoteId ?? this.remoteId,
      creatorId: creatorId ?? this.creatorId,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
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
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastViewedDate.present) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate.value);
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
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
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

class $TaskTagLinkTableDriftTable extends TaskTagLinkTableDrift
    with TableInfo<$TaskTagLinkTableDriftTable, TaskTagTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTagLinkTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _linkingDateMeta =
      const VerificationMeta('linkingDate');
  @override
  late final GeneratedColumn<DateTime> linkingDate = GeneratedColumn<DateTime>(
      'linking_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES TaskTableDrift(id)');
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES TagTableDrift(id)');
  @override
  List<GeneratedColumn> get $columns => [id, linkingDate, taskId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_tag_link_table_drift';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTagTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('linking_date')) {
      context.handle(
          _linkingDateMeta,
          linkingDate.isAcceptableOrUnknown(
              data['linking_date']!, _linkingDateMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTagTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTagTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      linkingDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}linking_date'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $TaskTagLinkTableDriftTable createAlias(String alias) {
    return $TaskTagLinkTableDriftTable(attachedDatabase, alias);
  }
}

class TaskTagTableDriftG extends DataClass
    implements Insertable<TaskTagTableDriftG> {
  final int id;
  final DateTime linkingDate;
  final int taskId;
  final int tagId;
  const TaskTagTableDriftG(
      {required this.id,
      required this.linkingDate,
      required this.taskId,
      required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['linking_date'] = Variable<DateTime>(linkingDate);
    map['task_id'] = Variable<int>(taskId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  TaskTagLinkTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TaskTagLinkTableDriftCompanion(
      id: Value(id),
      linkingDate: Value(linkingDate),
      taskId: Value(taskId),
      tagId: Value(tagId),
    );
  }

  factory TaskTagTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTagTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      linkingDate: serializer.fromJson<DateTime>(json['linkingDate']),
      taskId: serializer.fromJson<int>(json['taskId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'linkingDate': serializer.toJson<DateTime>(linkingDate),
      'taskId': serializer.toJson<int>(taskId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  TaskTagTableDriftG copyWith(
          {int? id, DateTime? linkingDate, int? taskId, int? tagId}) =>
      TaskTagTableDriftG(
        id: id ?? this.id,
        linkingDate: linkingDate ?? this.linkingDate,
        taskId: taskId ?? this.taskId,
        tagId: tagId ?? this.tagId,
      );
  TaskTagTableDriftG copyWithCompanion(TaskTagLinkTableDriftCompanion data) {
    return TaskTagTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      linkingDate:
          data.linkingDate.present ? data.linkingDate.value : this.linkingDate,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTagTableDriftG(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, linkingDate, taskId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTagTableDriftG &&
          other.id == this.id &&
          other.linkingDate == this.linkingDate &&
          other.taskId == this.taskId &&
          other.tagId == this.tagId);
}

class TaskTagLinkTableDriftCompanion
    extends UpdateCompanion<TaskTagTableDriftG> {
  final Value<int> id;
  final Value<DateTime> linkingDate;
  final Value<int> taskId;
  final Value<int> tagId;
  const TaskTagLinkTableDriftCompanion({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    this.taskId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  TaskTagLinkTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    required int taskId,
    required int tagId,
  })  : taskId = Value(taskId),
        tagId = Value(tagId);
  static Insertable<TaskTagTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? linkingDate,
    Expression<int>? taskId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkingDate != null) 'linking_date': linkingDate,
      if (taskId != null) 'task_id': taskId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  TaskTagLinkTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? linkingDate,
      Value<int>? taskId,
      Value<int>? tagId}) {
    return TaskTagLinkTableDriftCompanion(
      id: id ?? this.id,
      linkingDate: linkingDate ?? this.linkingDate,
      taskId: taskId ?? this.taskId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (linkingDate.present) {
      map['linking_date'] = Variable<DateTime>(linkingDate.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTagLinkTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $TaskReminderLinkTableDriftTable extends TaskReminderLinkTableDrift
    with TableInfo<$TaskReminderLinkTableDriftTable, TaskReminderTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskReminderLinkTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _linkingDateMeta =
      const VerificationMeta('linkingDate');
  @override
  late final GeneratedColumn<DateTime> linkingDate = GeneratedColumn<DateTime>(
      'linking_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES TaskTableDrift(id)');
  static const VerificationMeta _reminderIdMeta =
      const VerificationMeta('reminderId');
  @override
  late final GeneratedColumn<int> reminderId = GeneratedColumn<int>(
      'reminder_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES ReminderTableDrift(id)');
  @override
  List<GeneratedColumn> get $columns => [id, linkingDate, taskId, reminderId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_reminder_link_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<TaskReminderTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('linking_date')) {
      context.handle(
          _linkingDateMeta,
          linkingDate.isAcceptableOrUnknown(
              data['linking_date']!, _linkingDateMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('reminder_id')) {
      context.handle(
          _reminderIdMeta,
          reminderId.isAcceptableOrUnknown(
              data['reminder_id']!, _reminderIdMeta));
    } else if (isInserting) {
      context.missing(_reminderIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskReminderTableDriftG map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskReminderTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      linkingDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}linking_date'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      reminderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reminder_id'])!,
    );
  }

  @override
  $TaskReminderLinkTableDriftTable createAlias(String alias) {
    return $TaskReminderLinkTableDriftTable(attachedDatabase, alias);
  }
}

class TaskReminderTableDriftG extends DataClass
    implements Insertable<TaskReminderTableDriftG> {
  final int id;
  final DateTime linkingDate;
  final int taskId;
  final int reminderId;
  const TaskReminderTableDriftG(
      {required this.id,
      required this.linkingDate,
      required this.taskId,
      required this.reminderId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['linking_date'] = Variable<DateTime>(linkingDate);
    map['task_id'] = Variable<int>(taskId);
    map['reminder_id'] = Variable<int>(reminderId);
    return map;
  }

  TaskReminderLinkTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TaskReminderLinkTableDriftCompanion(
      id: Value(id),
      linkingDate: Value(linkingDate),
      taskId: Value(taskId),
      reminderId: Value(reminderId),
    );
  }

  factory TaskReminderTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskReminderTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      linkingDate: serializer.fromJson<DateTime>(json['linkingDate']),
      taskId: serializer.fromJson<int>(json['taskId']),
      reminderId: serializer.fromJson<int>(json['reminderId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'linkingDate': serializer.toJson<DateTime>(linkingDate),
      'taskId': serializer.toJson<int>(taskId),
      'reminderId': serializer.toJson<int>(reminderId),
    };
  }

  TaskReminderTableDriftG copyWith(
          {int? id, DateTime? linkingDate, int? taskId, int? reminderId}) =>
      TaskReminderTableDriftG(
        id: id ?? this.id,
        linkingDate: linkingDate ?? this.linkingDate,
        taskId: taskId ?? this.taskId,
        reminderId: reminderId ?? this.reminderId,
      );
  TaskReminderTableDriftG copyWithCompanion(
      TaskReminderLinkTableDriftCompanion data) {
    return TaskReminderTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      linkingDate:
          data.linkingDate.present ? data.linkingDate.value : this.linkingDate,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      reminderId:
          data.reminderId.present ? data.reminderId.value : this.reminderId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskReminderTableDriftG(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('reminderId: $reminderId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, linkingDate, taskId, reminderId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskReminderTableDriftG &&
          other.id == this.id &&
          other.linkingDate == this.linkingDate &&
          other.taskId == this.taskId &&
          other.reminderId == this.reminderId);
}

class TaskReminderLinkTableDriftCompanion
    extends UpdateCompanion<TaskReminderTableDriftG> {
  final Value<int> id;
  final Value<DateTime> linkingDate;
  final Value<int> taskId;
  final Value<int> reminderId;
  const TaskReminderLinkTableDriftCompanion({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    this.taskId = const Value.absent(),
    this.reminderId = const Value.absent(),
  });
  TaskReminderLinkTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    required int taskId,
    required int reminderId,
  })  : taskId = Value(taskId),
        reminderId = Value(reminderId);
  static Insertable<TaskReminderTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? linkingDate,
    Expression<int>? taskId,
    Expression<int>? reminderId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkingDate != null) 'linking_date': linkingDate,
      if (taskId != null) 'task_id': taskId,
      if (reminderId != null) 'reminder_id': reminderId,
    });
  }

  TaskReminderLinkTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? linkingDate,
      Value<int>? taskId,
      Value<int>? reminderId}) {
    return TaskReminderLinkTableDriftCompanion(
      id: id ?? this.id,
      linkingDate: linkingDate ?? this.linkingDate,
      taskId: taskId ?? this.taskId,
      reminderId: reminderId ?? this.reminderId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (linkingDate.present) {
      map['linking_date'] = Variable<DateTime>(linkingDate.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (reminderId.present) {
      map['reminder_id'] = Variable<int>(reminderId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskReminderLinkTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('reminderId: $reminderId')
          ..write(')'))
        .toString();
  }
}

class $TaskUserLinkTableDriftTable extends TaskUserLinkTableDrift
    with TableInfo<$TaskUserLinkTableDriftTable, TaskUserLinkTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskUserLinkTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _linkingDateMeta =
      const VerificationMeta('linkingDate');
  @override
  late final GeneratedColumn<DateTime> linkingDate = GeneratedColumn<DateTime>(
      'linking_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<int> taskId = GeneratedColumn<int>(
      'task_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES TaskTableDrift(id)');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES UserTableDrift(id)');
  static const VerificationMeta _selectedByUserMeta =
      const VerificationMeta('selectedByUser');
  @override
  late final GeneratedColumn<bool> selectedByUser = GeneratedColumn<bool>(
      'selected_by_user', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("selected_by_user" IN (0, 1))'));
  static const VerificationMeta _orderedByUserMeta =
      const VerificationMeta('orderedByUser');
  @override
  late final GeneratedColumn<int> orderedByUser = GeneratedColumn<int>(
      'ordered_by_user', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, linkingDate, taskId, userId, selectedByUser, orderedByUser];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_user_link_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<TaskUserLinkTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('linking_date')) {
      context.handle(
          _linkingDateMeta,
          linkingDate.isAcceptableOrUnknown(
              data['linking_date']!, _linkingDateMeta));
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('selected_by_user')) {
      context.handle(
          _selectedByUserMeta,
          selectedByUser.isAcceptableOrUnknown(
              data['selected_by_user']!, _selectedByUserMeta));
    }
    if (data.containsKey('ordered_by_user')) {
      context.handle(
          _orderedByUserMeta,
          orderedByUser.isAcceptableOrUnknown(
              data['ordered_by_user']!, _orderedByUserMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskUserLinkTableDriftG map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskUserLinkTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      linkingDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}linking_date'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      selectedByUser: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}selected_by_user']),
      orderedByUser: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ordered_by_user']),
    );
  }

  @override
  $TaskUserLinkTableDriftTable createAlias(String alias) {
    return $TaskUserLinkTableDriftTable(attachedDatabase, alias);
  }
}

class TaskUserLinkTableDriftG extends DataClass
    implements Insertable<TaskUserLinkTableDriftG> {
  final int id;
  final DateTime linkingDate;
  final int taskId;
  final int userId;
  final bool? selectedByUser;
  final int? orderedByUser;
  const TaskUserLinkTableDriftG(
      {required this.id,
      required this.linkingDate,
      required this.taskId,
      required this.userId,
      this.selectedByUser,
      this.orderedByUser});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['linking_date'] = Variable<DateTime>(linkingDate);
    map['task_id'] = Variable<int>(taskId);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || selectedByUser != null) {
      map['selected_by_user'] = Variable<bool>(selectedByUser);
    }
    if (!nullToAbsent || orderedByUser != null) {
      map['ordered_by_user'] = Variable<int>(orderedByUser);
    }
    return map;
  }

  TaskUserLinkTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TaskUserLinkTableDriftCompanion(
      id: Value(id),
      linkingDate: Value(linkingDate),
      taskId: Value(taskId),
      userId: Value(userId),
      selectedByUser: selectedByUser == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedByUser),
      orderedByUser: orderedByUser == null && nullToAbsent
          ? const Value.absent()
          : Value(orderedByUser),
    );
  }

  factory TaskUserLinkTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskUserLinkTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      linkingDate: serializer.fromJson<DateTime>(json['linkingDate']),
      taskId: serializer.fromJson<int>(json['taskId']),
      userId: serializer.fromJson<int>(json['userId']),
      selectedByUser: serializer.fromJson<bool?>(json['selectedByUser']),
      orderedByUser: serializer.fromJson<int?>(json['orderedByUser']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'linkingDate': serializer.toJson<DateTime>(linkingDate),
      'taskId': serializer.toJson<int>(taskId),
      'userId': serializer.toJson<int>(userId),
      'selectedByUser': serializer.toJson<bool?>(selectedByUser),
      'orderedByUser': serializer.toJson<int?>(orderedByUser),
    };
  }

  TaskUserLinkTableDriftG copyWith(
          {int? id,
          DateTime? linkingDate,
          int? taskId,
          int? userId,
          Value<bool?> selectedByUser = const Value.absent(),
          Value<int?> orderedByUser = const Value.absent()}) =>
      TaskUserLinkTableDriftG(
        id: id ?? this.id,
        linkingDate: linkingDate ?? this.linkingDate,
        taskId: taskId ?? this.taskId,
        userId: userId ?? this.userId,
        selectedByUser:
            selectedByUser.present ? selectedByUser.value : this.selectedByUser,
        orderedByUser:
            orderedByUser.present ? orderedByUser.value : this.orderedByUser,
      );
  TaskUserLinkTableDriftG copyWithCompanion(
      TaskUserLinkTableDriftCompanion data) {
    return TaskUserLinkTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      linkingDate:
          data.linkingDate.present ? data.linkingDate.value : this.linkingDate,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      userId: data.userId.present ? data.userId.value : this.userId,
      selectedByUser: data.selectedByUser.present
          ? data.selectedByUser.value
          : this.selectedByUser,
      orderedByUser: data.orderedByUser.present
          ? data.orderedByUser.value
          : this.orderedByUser,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskUserLinkTableDriftG(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('userId: $userId, ')
          ..write('selectedByUser: $selectedByUser, ')
          ..write('orderedByUser: $orderedByUser')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, linkingDate, taskId, userId, selectedByUser, orderedByUser);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskUserLinkTableDriftG &&
          other.id == this.id &&
          other.linkingDate == this.linkingDate &&
          other.taskId == this.taskId &&
          other.userId == this.userId &&
          other.selectedByUser == this.selectedByUser &&
          other.orderedByUser == this.orderedByUser);
}

class TaskUserLinkTableDriftCompanion
    extends UpdateCompanion<TaskUserLinkTableDriftG> {
  final Value<int> id;
  final Value<DateTime> linkingDate;
  final Value<int> taskId;
  final Value<int> userId;
  final Value<bool?> selectedByUser;
  final Value<int?> orderedByUser;
  const TaskUserLinkTableDriftCompanion({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    this.taskId = const Value.absent(),
    this.userId = const Value.absent(),
    this.selectedByUser = const Value.absent(),
    this.orderedByUser = const Value.absent(),
  });
  TaskUserLinkTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    required int taskId,
    required int userId,
    this.selectedByUser = const Value.absent(),
    this.orderedByUser = const Value.absent(),
  })  : taskId = Value(taskId),
        userId = Value(userId);
  static Insertable<TaskUserLinkTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? linkingDate,
    Expression<int>? taskId,
    Expression<int>? userId,
    Expression<bool>? selectedByUser,
    Expression<int>? orderedByUser,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkingDate != null) 'linking_date': linkingDate,
      if (taskId != null) 'task_id': taskId,
      if (userId != null) 'user_id': userId,
      if (selectedByUser != null) 'selected_by_user': selectedByUser,
      if (orderedByUser != null) 'ordered_by_user': orderedByUser,
    });
  }

  TaskUserLinkTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? linkingDate,
      Value<int>? taskId,
      Value<int>? userId,
      Value<bool?>? selectedByUser,
      Value<int?>? orderedByUser}) {
    return TaskUserLinkTableDriftCompanion(
      id: id ?? this.id,
      linkingDate: linkingDate ?? this.linkingDate,
      taskId: taskId ?? this.taskId,
      userId: userId ?? this.userId,
      selectedByUser: selectedByUser ?? this.selectedByUser,
      orderedByUser: orderedByUser ?? this.orderedByUser,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (linkingDate.present) {
      map['linking_date'] = Variable<DateTime>(linkingDate.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<int>(taskId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (selectedByUser.present) {
      map['selected_by_user'] = Variable<bool>(selectedByUser.value);
    }
    if (orderedByUser.present) {
      map['ordered_by_user'] = Variable<int>(orderedByUser.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskUserLinkTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('userId: $userId, ')
          ..write('selectedByUser: $selectedByUser, ')
          ..write('orderedByUser: $orderedByUser')
          ..write(')'))
        .toString();
  }
}

class $UserTableDriftTable extends UserTableDrift
    with TableInfo<$UserTableDriftTable, UserTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastViewedDateMeta =
      const VerificationMeta('lastViewedDate');
  @override
  late final GeneratedColumn<DateTime> lastViewedDate =
      GeneratedColumn<DateTime>('last_viewed_date', aliasedName, true,
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hashedPasswordMeta =
      const VerificationMeta('hashedPassword');
  @override
  late final GeneratedColumn<String> hashedPassword = GeneratedColumn<String>(
      'hashed_password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userTypeMeta =
      const VerificationMeta('userType');
  @override
  late final GeneratedColumn<String> userType = GeneratedColumn<String>(
      'user_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('local'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        creatorId,
        subject,
        createdDate,
        lastUpdate,
        lastViewedDate,
        remoteViews,
        views,
        checksum,
        name,
        email,
        hashedPassword,
        userType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table_drift';
  @override
  VerificationContext validateIntegrity(Insertable<UserTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_viewed_date')) {
      context.handle(
          _lastViewedDateMeta,
          lastViewedDate.isAcceptableOrUnknown(
              data['last_viewed_date']!, _lastViewedDateMeta));
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
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('hashed_password')) {
      context.handle(
          _hashedPasswordMeta,
          hashedPassword.isAcceptableOrUnknown(
              data['hashed_password']!, _hashedPasswordMeta));
    } else if (isInserting) {
      context.missing(_hashedPasswordMeta);
    }
    if (data.containsKey('user_type')) {
      context.handle(_userTypeMeta,
          userType.isAcceptableOrUnknown(data['user_type']!, _userTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastViewedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_viewed_date']),
      remoteViews: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_views']),
      views: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}views']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      hashedPassword: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}hashed_password'])!,
      userType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_type'])!,
    );
  }

  @override
  $UserTableDriftTable createAlias(String alias) {
    return $UserTableDriftTable(attachedDatabase, alias);
  }
}

class UserTableDriftG extends DataClass implements Insertable<UserTableDriftG> {
  final int id;
  final int? remoteId;
  final int? creatorId;
  final String? subject;
  final DateTime createdDate;
  final DateTime? lastUpdate;
  final DateTime? lastViewedDate;
  final int? remoteViews;
  final int? views;
  final String? checksum;
  final String name;
  final String email;
  final String hashedPassword;
  final String userType;
  const UserTableDriftG(
      {required this.id,
      this.remoteId,
      this.creatorId,
      this.subject,
      required this.createdDate,
      this.lastUpdate,
      this.lastViewedDate,
      this.remoteViews,
      this.views,
      this.checksum,
      required this.name,
      required this.email,
      required this.hashedPassword,
      required this.userType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || creatorId != null) {
      map['creator_id'] = Variable<int>(creatorId);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastViewedDate != null) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate);
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
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['hashed_password'] = Variable<String>(hashedPassword);
    map['user_type'] = Variable<String>(userType);
    return map;
  }

  UserTableDriftCompanion toCompanion(bool nullToAbsent) {
    return UserTableDriftCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      creatorId: creatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorId),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      createdDate: Value(createdDate),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastViewedDate: lastViewedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastViewedDate),
      remoteViews: remoteViews == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteViews),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      name: Value(name),
      email: Value(email),
      hashedPassword: Value(hashedPassword),
      userType: Value(userType),
    );
  }

  factory UserTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      creatorId: serializer.fromJson<int?>(json['creatorId']),
      subject: serializer.fromJson<String?>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastViewedDate: serializer.fromJson<DateTime?>(json['lastViewedDate']),
      remoteViews: serializer.fromJson<int?>(json['remoteViews']),
      views: serializer.fromJson<int?>(json['views']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      hashedPassword: serializer.fromJson<String>(json['hashedPassword']),
      userType: serializer.fromJson<String>(json['userType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'creatorId': serializer.toJson<int?>(creatorId),
      'subject': serializer.toJson<String?>(subject),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastViewedDate': serializer.toJson<DateTime?>(lastViewedDate),
      'remoteViews': serializer.toJson<int?>(remoteViews),
      'views': serializer.toJson<int?>(views),
      'checksum': serializer.toJson<String?>(checksum),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'hashedPassword': serializer.toJson<String>(hashedPassword),
      'userType': serializer.toJson<String>(userType),
    };
  }

  UserTableDriftG copyWith(
          {int? id,
          Value<int?> remoteId = const Value.absent(),
          Value<int?> creatorId = const Value.absent(),
          Value<String?> subject = const Value.absent(),
          DateTime? createdDate,
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastViewedDate = const Value.absent(),
          Value<int?> remoteViews = const Value.absent(),
          Value<int?> views = const Value.absent(),
          Value<String?> checksum = const Value.absent(),
          String? name,
          String? email,
          String? hashedPassword,
          String? userType}) =>
      UserTableDriftG(
        id: id ?? this.id,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        creatorId: creatorId.present ? creatorId.value : this.creatorId,
        subject: subject.present ? subject.value : this.subject,
        createdDate: createdDate ?? this.createdDate,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastViewedDate:
            lastViewedDate.present ? lastViewedDate.value : this.lastViewedDate,
        remoteViews: remoteViews.present ? remoteViews.value : this.remoteViews,
        views: views.present ? views.value : this.views,
        checksum: checksum.present ? checksum.value : this.checksum,
        name: name ?? this.name,
        email: email ?? this.email,
        hashedPassword: hashedPassword ?? this.hashedPassword,
        userType: userType ?? this.userType,
      );
  UserTableDriftG copyWithCompanion(UserTableDriftCompanion data) {
    return UserTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      subject: data.subject.present ? data.subject.value : this.subject,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastViewedDate: data.lastViewedDate.present
          ? data.lastViewedDate.value
          : this.lastViewedDate,
      remoteViews:
          data.remoteViews.present ? data.remoteViews.value : this.remoteViews,
      views: data.views.present ? data.views.value : this.views,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      hashedPassword: data.hashedPassword.present
          ? data.hashedPassword.value
          : this.hashedPassword,
      userType: data.userType.present ? data.userType.value : this.userType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableDriftG(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('hashedPassword: $hashedPassword, ')
          ..write('userType: $userType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      remoteId,
      creatorId,
      subject,
      createdDate,
      lastUpdate,
      lastViewedDate,
      remoteViews,
      views,
      checksum,
      name,
      email,
      hashedPassword,
      userType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableDriftG &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.creatorId == this.creatorId &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate &&
          other.lastUpdate == this.lastUpdate &&
          other.lastViewedDate == this.lastViewedDate &&
          other.remoteViews == this.remoteViews &&
          other.views == this.views &&
          other.checksum == this.checksum &&
          other.name == this.name &&
          other.email == this.email &&
          other.hashedPassword == this.hashedPassword &&
          other.userType == this.userType);
}

class UserTableDriftCompanion extends UpdateCompanion<UserTableDriftG> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int?> creatorId;
  final Value<String?> subject;
  final Value<DateTime> createdDate;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastViewedDate;
  final Value<int?> remoteViews;
  final Value<int?> views;
  final Value<String?> checksum;
  final Value<String> name;
  final Value<String> email;
  final Value<String> hashedPassword;
  final Value<String> userType;
  const UserTableDriftCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.hashedPassword = const Value.absent(),
    this.userType = const Value.absent(),
  });
  UserTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
    required String name,
    required String email,
    required String hashedPassword,
    this.userType = const Value.absent(),
  })  : name = Value(name),
        email = Value(email),
        hashedPassword = Value(hashedPassword);
  static Insertable<UserTableDriftG> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? creatorId,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastViewedDate,
    Expression<int>? remoteViews,
    Expression<int>? views,
    Expression<String>? checksum,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? hashedPassword,
    Expression<String>? userType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (creatorId != null) 'creator_id': creatorId,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastViewedDate != null) 'last_viewed_date': lastViewedDate,
      if (remoteViews != null) 'remote_views': remoteViews,
      if (views != null) 'views': views,
      if (checksum != null) 'checksum': checksum,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (hashedPassword != null) 'hashed_password': hashedPassword,
      if (userType != null) 'user_type': userType,
    });
  }

  UserTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<int?>? remoteId,
      Value<int?>? creatorId,
      Value<String?>? subject,
      Value<DateTime>? createdDate,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastViewedDate,
      Value<int?>? remoteViews,
      Value<int?>? views,
      Value<String?>? checksum,
      Value<String>? name,
      Value<String>? email,
      Value<String>? hashedPassword,
      Value<String>? userType}) {
    return UserTableDriftCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      creatorId: creatorId ?? this.creatorId,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
      name: name ?? this.name,
      email: email ?? this.email,
      hashedPassword: hashedPassword ?? this.hashedPassword,
      userType: userType ?? this.userType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastViewedDate.present) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate.value);
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (hashedPassword.present) {
      map['hashed_password'] = Variable<String>(hashedPassword.value);
    }
    if (userType.present) {
      map['user_type'] = Variable<String>(userType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('hashedPassword: $hashedPassword, ')
          ..write('userType: $userType')
          ..write(')'))
        .toString();
  }
}

class $UserUserTableDriftTable extends UserUserTableDrift
    with TableInfo<$UserUserTableDriftTable, UserUserTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserUserTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES UserTableDrift(id)');
  static const VerificationMeta _userIdLinkedMeta =
      const VerificationMeta('userIdLinked');
  @override
  late final GeneratedColumn<int> userIdLinked = GeneratedColumn<int>(
      'user_id_linked', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES UserTableDrift(id)');
  static const VerificationMeta _userNameLinkedMeta =
      const VerificationMeta('userNameLinked');
  @override
  late final GeneratedColumn<String> userNameLinked = GeneratedColumn<String>(
      'user_name_linked', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _muteUntilDateMeta =
      const VerificationMeta('muteUntilDate');
  @override
  late final GeneratedColumn<DateTime> muteUntilDate =
      GeneratedColumn<DateTime>('mute_until_date', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          defaultValue: currentDateAndTime);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  @override
  late final GeneratedColumn<DateTime> updatedDate = GeneratedColumn<DateTime>(
      'updated_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        userIdLinked,
        userNameLinked,
        status,
        muteUntilDate,
        createdDate,
        updatedDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_user_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserUserTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_id_linked')) {
      context.handle(
          _userIdLinkedMeta,
          userIdLinked.isAcceptableOrUnknown(
              data['user_id_linked']!, _userIdLinkedMeta));
    } else if (isInserting) {
      context.missing(_userIdLinkedMeta);
    }
    if (data.containsKey('user_name_linked')) {
      context.handle(
          _userNameLinkedMeta,
          userNameLinked.isAcceptableOrUnknown(
              data['user_name_linked']!, _userNameLinkedMeta));
    } else if (isInserting) {
      context.missing(_userNameLinkedMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('mute_until_date')) {
      context.handle(
          _muteUntilDateMeta,
          muteUntilDate.isAcceptableOrUnknown(
              data['mute_until_date']!, _muteUntilDateMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date']!, _updatedDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserUserTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserUserTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      userIdLinked: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id_linked'])!,
      userNameLinked: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}user_name_linked'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      muteUntilDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}mute_until_date'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      updatedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_date'])!,
    );
  }

  @override
  $UserUserTableDriftTable createAlias(String alias) {
    return $UserUserTableDriftTable(attachedDatabase, alias);
  }
}

class UserUserTableDriftG extends DataClass
    implements Insertable<UserUserTableDriftG> {
  final int id;
  final int userId;
  final int userIdLinked;
  final String userNameLinked;
  final String status;
  final DateTime muteUntilDate;
  final DateTime createdDate;
  final DateTime updatedDate;
  const UserUserTableDriftG(
      {required this.id,
      required this.userId,
      required this.userIdLinked,
      required this.userNameLinked,
      required this.status,
      required this.muteUntilDate,
      required this.createdDate,
      required this.updatedDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['user_id_linked'] = Variable<int>(userIdLinked);
    map['user_name_linked'] = Variable<String>(userNameLinked);
    map['status'] = Variable<String>(status);
    map['mute_until_date'] = Variable<DateTime>(muteUntilDate);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['updated_date'] = Variable<DateTime>(updatedDate);
    return map;
  }

  UserUserTableDriftCompanion toCompanion(bool nullToAbsent) {
    return UserUserTableDriftCompanion(
      id: Value(id),
      userId: Value(userId),
      userIdLinked: Value(userIdLinked),
      userNameLinked: Value(userNameLinked),
      status: Value(status),
      muteUntilDate: Value(muteUntilDate),
      createdDate: Value(createdDate),
      updatedDate: Value(updatedDate),
    );
  }

  factory UserUserTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserUserTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      userIdLinked: serializer.fromJson<int>(json['userIdLinked']),
      userNameLinked: serializer.fromJson<String>(json['userNameLinked']),
      status: serializer.fromJson<String>(json['status']),
      muteUntilDate: serializer.fromJson<DateTime>(json['muteUntilDate']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'userIdLinked': serializer.toJson<int>(userIdLinked),
      'userNameLinked': serializer.toJson<String>(userNameLinked),
      'status': serializer.toJson<String>(status),
      'muteUntilDate': serializer.toJson<DateTime>(muteUntilDate),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
    };
  }

  UserUserTableDriftG copyWith(
          {int? id,
          int? userId,
          int? userIdLinked,
          String? userNameLinked,
          String? status,
          DateTime? muteUntilDate,
          DateTime? createdDate,
          DateTime? updatedDate}) =>
      UserUserTableDriftG(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        userIdLinked: userIdLinked ?? this.userIdLinked,
        userNameLinked: userNameLinked ?? this.userNameLinked,
        status: status ?? this.status,
        muteUntilDate: muteUntilDate ?? this.muteUntilDate,
        createdDate: createdDate ?? this.createdDate,
        updatedDate: updatedDate ?? this.updatedDate,
      );
  UserUserTableDriftG copyWithCompanion(UserUserTableDriftCompanion data) {
    return UserUserTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      userIdLinked: data.userIdLinked.present
          ? data.userIdLinked.value
          : this.userIdLinked,
      userNameLinked: data.userNameLinked.present
          ? data.userNameLinked.value
          : this.userNameLinked,
      status: data.status.present ? data.status.value : this.status,
      muteUntilDate: data.muteUntilDate.present
          ? data.muteUntilDate.value
          : this.muteUntilDate,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      updatedDate:
          data.updatedDate.present ? data.updatedDate.value : this.updatedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserUserTableDriftG(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userIdLinked: $userIdLinked, ')
          ..write('userNameLinked: $userNameLinked, ')
          ..write('status: $status, ')
          ..write('muteUntilDate: $muteUntilDate, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedDate: $updatedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, userIdLinked, userNameLinked,
      status, muteUntilDate, createdDate, updatedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserUserTableDriftG &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.userIdLinked == this.userIdLinked &&
          other.userNameLinked == this.userNameLinked &&
          other.status == this.status &&
          other.muteUntilDate == this.muteUntilDate &&
          other.createdDate == this.createdDate &&
          other.updatedDate == this.updatedDate);
}

class UserUserTableDriftCompanion extends UpdateCompanion<UserUserTableDriftG> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> userIdLinked;
  final Value<String> userNameLinked;
  final Value<String> status;
  final Value<DateTime> muteUntilDate;
  final Value<DateTime> createdDate;
  final Value<DateTime> updatedDate;
  const UserUserTableDriftCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.userIdLinked = const Value.absent(),
    this.userNameLinked = const Value.absent(),
    this.status = const Value.absent(),
    this.muteUntilDate = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedDate = const Value.absent(),
  });
  UserUserTableDriftCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int userIdLinked,
    required String userNameLinked,
    required String status,
    this.muteUntilDate = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedDate = const Value.absent(),
  })  : userId = Value(userId),
        userIdLinked = Value(userIdLinked),
        userNameLinked = Value(userNameLinked),
        status = Value(status);
  static Insertable<UserUserTableDriftG> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? userIdLinked,
    Expression<String>? userNameLinked,
    Expression<String>? status,
    Expression<DateTime>? muteUntilDate,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? updatedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (userIdLinked != null) 'user_id_linked': userIdLinked,
      if (userNameLinked != null) 'user_name_linked': userNameLinked,
      if (status != null) 'status': status,
      if (muteUntilDate != null) 'mute_until_date': muteUntilDate,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedDate != null) 'updated_date': updatedDate,
    });
  }

  UserUserTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? userIdLinked,
      Value<String>? userNameLinked,
      Value<String>? status,
      Value<DateTime>? muteUntilDate,
      Value<DateTime>? createdDate,
      Value<DateTime>? updatedDate}) {
    return UserUserTableDriftCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userIdLinked: userIdLinked ?? this.userIdLinked,
      userNameLinked: userNameLinked ?? this.userNameLinked,
      status: status ?? this.status,
      muteUntilDate: muteUntilDate ?? this.muteUntilDate,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (userIdLinked.present) {
      map['user_id_linked'] = Variable<int>(userIdLinked.value);
    }
    if (userNameLinked.present) {
      map['user_name_linked'] = Variable<String>(userNameLinked.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (muteUntilDate.present) {
      map['mute_until_date'] = Variable<DateTime>(muteUntilDate.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserUserTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('userIdLinked: $userIdLinked, ')
          ..write('userNameLinked: $userNameLinked, ')
          ..write('status: $status, ')
          ..write('muteUntilDate: $muteUntilDate, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedDate: $updatedDate')
          ..write(')'))
        .toString();
  }
}

class $ReminderTableDriftTable extends ReminderTableDrift
    with TableInfo<$ReminderTableDriftTable, ReminderTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastViewedDateMeta =
      const VerificationMeta('lastViewedDate');
  @override
  late final GeneratedColumn<DateTime> lastViewedDate =
      GeneratedColumn<DateTime>('last_viewed_date', aliasedName, true,
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
  static const VerificationMeta _remindAtMeta =
      const VerificationMeta('remindAt');
  @override
  late final GeneratedColumn<DateTime> remindAt = GeneratedColumn<DateTime>(
      'remind_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        creatorId,
        subject,
        createdDate,
        lastUpdate,
        lastViewedDate,
        remoteViews,
        views,
        checksum,
        remindAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReminderTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_viewed_date')) {
      context.handle(
          _lastViewedDateMeta,
          lastViewedDate.isAcceptableOrUnknown(
              data['last_viewed_date']!, _lastViewedDateMeta));
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
    if (data.containsKey('remind_at')) {
      context.handle(_remindAtMeta,
          remindAt.isAcceptableOrUnknown(data['remind_at']!, _remindAtMeta));
    } else if (isInserting) {
      context.missing(_remindAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastViewedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_viewed_date']),
      remoteViews: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_views']),
      views: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}views']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
      remindAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}remind_at'])!,
    );
  }

  @override
  $ReminderTableDriftTable createAlias(String alias) {
    return $ReminderTableDriftTable(attachedDatabase, alias);
  }
}

class ReminderTableDriftG extends DataClass
    implements Insertable<ReminderTableDriftG> {
  final int id;
  final int? remoteId;
  final int? creatorId;
  final String? subject;
  final DateTime createdDate;
  final DateTime? lastUpdate;
  final DateTime? lastViewedDate;
  final int? remoteViews;
  final int? views;
  final String? checksum;
  final DateTime remindAt;
  const ReminderTableDriftG(
      {required this.id,
      this.remoteId,
      this.creatorId,
      this.subject,
      required this.createdDate,
      this.lastUpdate,
      this.lastViewedDate,
      this.remoteViews,
      this.views,
      this.checksum,
      required this.remindAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || creatorId != null) {
      map['creator_id'] = Variable<int>(creatorId);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastViewedDate != null) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate);
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
    map['remind_at'] = Variable<DateTime>(remindAt);
    return map;
  }

  ReminderTableDriftCompanion toCompanion(bool nullToAbsent) {
    return ReminderTableDriftCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      creatorId: creatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorId),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      createdDate: Value(createdDate),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastViewedDate: lastViewedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastViewedDate),
      remoteViews: remoteViews == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteViews),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      remindAt: Value(remindAt),
    );
  }

  factory ReminderTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      creatorId: serializer.fromJson<int?>(json['creatorId']),
      subject: serializer.fromJson<String?>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastViewedDate: serializer.fromJson<DateTime?>(json['lastViewedDate']),
      remoteViews: serializer.fromJson<int?>(json['remoteViews']),
      views: serializer.fromJson<int?>(json['views']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      remindAt: serializer.fromJson<DateTime>(json['remindAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'creatorId': serializer.toJson<int?>(creatorId),
      'subject': serializer.toJson<String?>(subject),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastViewedDate': serializer.toJson<DateTime?>(lastViewedDate),
      'remoteViews': serializer.toJson<int?>(remoteViews),
      'views': serializer.toJson<int?>(views),
      'checksum': serializer.toJson<String?>(checksum),
      'remindAt': serializer.toJson<DateTime>(remindAt),
    };
  }

  ReminderTableDriftG copyWith(
          {int? id,
          Value<int?> remoteId = const Value.absent(),
          Value<int?> creatorId = const Value.absent(),
          Value<String?> subject = const Value.absent(),
          DateTime? createdDate,
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastViewedDate = const Value.absent(),
          Value<int?> remoteViews = const Value.absent(),
          Value<int?> views = const Value.absent(),
          Value<String?> checksum = const Value.absent(),
          DateTime? remindAt}) =>
      ReminderTableDriftG(
        id: id ?? this.id,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        creatorId: creatorId.present ? creatorId.value : this.creatorId,
        subject: subject.present ? subject.value : this.subject,
        createdDate: createdDate ?? this.createdDate,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastViewedDate:
            lastViewedDate.present ? lastViewedDate.value : this.lastViewedDate,
        remoteViews: remoteViews.present ? remoteViews.value : this.remoteViews,
        views: views.present ? views.value : this.views,
        checksum: checksum.present ? checksum.value : this.checksum,
        remindAt: remindAt ?? this.remindAt,
      );
  ReminderTableDriftG copyWithCompanion(ReminderTableDriftCompanion data) {
    return ReminderTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      subject: data.subject.present ? data.subject.value : this.subject,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastViewedDate: data.lastViewedDate.present
          ? data.lastViewedDate.value
          : this.lastViewedDate,
      remoteViews:
          data.remoteViews.present ? data.remoteViews.value : this.remoteViews,
      views: data.views.present ? data.views.value : this.views,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      remindAt: data.remindAt.present ? data.remindAt.value : this.remindAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTableDriftG(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum, ')
          ..write('remindAt: $remindAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, remoteId, creatorId, subject, createdDate,
      lastUpdate, lastViewedDate, remoteViews, views, checksum, remindAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderTableDriftG &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.creatorId == this.creatorId &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate &&
          other.lastUpdate == this.lastUpdate &&
          other.lastViewedDate == this.lastViewedDate &&
          other.remoteViews == this.remoteViews &&
          other.views == this.views &&
          other.checksum == this.checksum &&
          other.remindAt == this.remindAt);
}

class ReminderTableDriftCompanion extends UpdateCompanion<ReminderTableDriftG> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int?> creatorId;
  final Value<String?> subject;
  final Value<DateTime> createdDate;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastViewedDate;
  final Value<int?> remoteViews;
  final Value<int?> views;
  final Value<String?> checksum;
  final Value<DateTime> remindAt;
  const ReminderTableDriftCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
    this.remindAt = const Value.absent(),
  });
  ReminderTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
    required DateTime remindAt,
  }) : remindAt = Value(remindAt);
  static Insertable<ReminderTableDriftG> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? creatorId,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastViewedDate,
    Expression<int>? remoteViews,
    Expression<int>? views,
    Expression<String>? checksum,
    Expression<DateTime>? remindAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (creatorId != null) 'creator_id': creatorId,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastViewedDate != null) 'last_viewed_date': lastViewedDate,
      if (remoteViews != null) 'remote_views': remoteViews,
      if (views != null) 'views': views,
      if (checksum != null) 'checksum': checksum,
      if (remindAt != null) 'remind_at': remindAt,
    });
  }

  ReminderTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<int?>? remoteId,
      Value<int?>? creatorId,
      Value<String?>? subject,
      Value<DateTime>? createdDate,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastViewedDate,
      Value<int?>? remoteViews,
      Value<int?>? views,
      Value<String?>? checksum,
      Value<DateTime>? remindAt}) {
    return ReminderTableDriftCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      creatorId: creatorId ?? this.creatorId,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
      remindAt: remindAt ?? this.remindAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastViewedDate.present) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate.value);
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
    if (remindAt.present) {
      map['remind_at'] = Variable<DateTime>(remindAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum, ')
          ..write('remindAt: $remindAt')
          ..write(')'))
        .toString();
  }
}

class $TagTableDriftTable extends TagTableDrift
    with TableInfo<$TagTableDriftTable, TagTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastViewedDateMeta =
      const VerificationMeta('lastViewedDate');
  @override
  late final GeneratedColumn<DateTime> lastViewedDate =
      GeneratedColumn<DateTime>('last_viewed_date', aliasedName, true,
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        creatorId,
        subject,
        createdDate,
        lastUpdate,
        lastViewedDate,
        remoteViews,
        views,
        checksum
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_table_drift';
  @override
  VerificationContext validateIntegrity(Insertable<TagTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_viewed_date')) {
      context.handle(
          _lastViewedDateMeta,
          lastViewedDate.isAcceptableOrUnknown(
              data['last_viewed_date']!, _lastViewedDateMeta));
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject']),
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastViewedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_viewed_date']),
      remoteViews: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_views']),
      views: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}views']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
    );
  }

  @override
  $TagTableDriftTable createAlias(String alias) {
    return $TagTableDriftTable(attachedDatabase, alias);
  }
}

class TagTableDriftG extends DataClass implements Insertable<TagTableDriftG> {
  final int id;
  final int? remoteId;
  final int? creatorId;
  final String? subject;
  final DateTime createdDate;
  final DateTime? lastUpdate;
  final DateTime? lastViewedDate;
  final int? remoteViews;
  final int? views;
  final String? checksum;
  const TagTableDriftG(
      {required this.id,
      this.remoteId,
      this.creatorId,
      this.subject,
      required this.createdDate,
      this.lastUpdate,
      this.lastViewedDate,
      this.remoteViews,
      this.views,
      this.checksum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || creatorId != null) {
      map['creator_id'] = Variable<int>(creatorId);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    map['created_date'] = Variable<DateTime>(createdDate);
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastViewedDate != null) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate);
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
    return map;
  }

  TagTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TagTableDriftCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      creatorId: creatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorId),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      createdDate: Value(createdDate),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastViewedDate: lastViewedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastViewedDate),
      remoteViews: remoteViews == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteViews),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
    );
  }

  factory TagTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      creatorId: serializer.fromJson<int?>(json['creatorId']),
      subject: serializer.fromJson<String?>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastViewedDate: serializer.fromJson<DateTime?>(json['lastViewedDate']),
      remoteViews: serializer.fromJson<int?>(json['remoteViews']),
      views: serializer.fromJson<int?>(json['views']),
      checksum: serializer.fromJson<String?>(json['checksum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<int?>(remoteId),
      'creatorId': serializer.toJson<int?>(creatorId),
      'subject': serializer.toJson<String?>(subject),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastViewedDate': serializer.toJson<DateTime?>(lastViewedDate),
      'remoteViews': serializer.toJson<int?>(remoteViews),
      'views': serializer.toJson<int?>(views),
      'checksum': serializer.toJson<String?>(checksum),
    };
  }

  TagTableDriftG copyWith(
          {int? id,
          Value<int?> remoteId = const Value.absent(),
          Value<int?> creatorId = const Value.absent(),
          Value<String?> subject = const Value.absent(),
          DateTime? createdDate,
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastViewedDate = const Value.absent(),
          Value<int?> remoteViews = const Value.absent(),
          Value<int?> views = const Value.absent(),
          Value<String?> checksum = const Value.absent()}) =>
      TagTableDriftG(
        id: id ?? this.id,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        creatorId: creatorId.present ? creatorId.value : this.creatorId,
        subject: subject.present ? subject.value : this.subject,
        createdDate: createdDate ?? this.createdDate,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastViewedDate:
            lastViewedDate.present ? lastViewedDate.value : this.lastViewedDate,
        remoteViews: remoteViews.present ? remoteViews.value : this.remoteViews,
        views: views.present ? views.value : this.views,
        checksum: checksum.present ? checksum.value : this.checksum,
      );
  TagTableDriftG copyWithCompanion(TagTableDriftCompanion data) {
    return TagTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      subject: data.subject.present ? data.subject.value : this.subject,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastViewedDate: data.lastViewedDate.present
          ? data.lastViewedDate.value
          : this.lastViewedDate,
      remoteViews:
          data.remoteViews.present ? data.remoteViews.value : this.remoteViews,
      views: data.views.present ? data.views.value : this.views,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagTableDriftG(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, remoteId, creatorId, subject, createdDate,
      lastUpdate, lastViewedDate, remoteViews, views, checksum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagTableDriftG &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.creatorId == this.creatorId &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate &&
          other.lastUpdate == this.lastUpdate &&
          other.lastViewedDate == this.lastViewedDate &&
          other.remoteViews == this.remoteViews &&
          other.views == this.views &&
          other.checksum == this.checksum);
}

class TagTableDriftCompanion extends UpdateCompanion<TagTableDriftG> {
  final Value<int> id;
  final Value<int?> remoteId;
  final Value<int?> creatorId;
  final Value<String?> subject;
  final Value<DateTime> createdDate;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastViewedDate;
  final Value<int?> remoteViews;
  final Value<int?> views;
  final Value<String?> checksum;
  const TagTableDriftCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
  });
  TagTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewedDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
  });
  static Insertable<TagTableDriftG> custom({
    Expression<int>? id,
    Expression<int>? remoteId,
    Expression<int>? creatorId,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastViewedDate,
    Expression<int>? remoteViews,
    Expression<int>? views,
    Expression<String>? checksum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (creatorId != null) 'creator_id': creatorId,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastViewedDate != null) 'last_viewed_date': lastViewedDate,
      if (remoteViews != null) 'remote_views': remoteViews,
      if (views != null) 'views': views,
      if (checksum != null) 'checksum': checksum,
    });
  }

  TagTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<int?>? remoteId,
      Value<int?>? creatorId,
      Value<String?>? subject,
      Value<DateTime>? createdDate,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastViewedDate,
      Value<int?>? remoteViews,
      Value<int?>? views,
      Value<String?>? checksum}) {
    return TagTableDriftCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      creatorId: creatorId ?? this.creatorId,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastViewedDate.present) {
      map['last_viewed_date'] = Variable<DateTime>(lastViewedDate.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('creatorId: $creatorId, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewedDate: $lastViewedDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }
}

class $TagUserLinkTableDriftTable extends TagUserLinkTableDrift
    with TableInfo<$TagUserLinkTableDriftTable, TagUserLinkTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagUserLinkTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _linkingDateMeta =
      const VerificationMeta('linkingDate');
  @override
  late final GeneratedColumn<DateTime> linkingDate = GeneratedColumn<DateTime>(
      'linking_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES TagTableDrift(id)');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES UserTableDrift(id)');
  static const VerificationMeta _selectedByUserMeta =
      const VerificationMeta('selectedByUser');
  @override
  late final GeneratedColumn<bool> selectedByUser = GeneratedColumn<bool>(
      'selected_by_user', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("selected_by_user" IN (0, 1))'));
  static const VerificationMeta _orderedByUserMeta =
      const VerificationMeta('orderedByUser');
  @override
  late final GeneratedColumn<int> orderedByUser = GeneratedColumn<int>(
      'ordered_by_user', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, linkingDate, tagId, userId, selectedByUser, orderedByUser];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tag_user_link_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<TagUserLinkTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('linking_date')) {
      context.handle(
          _linkingDateMeta,
          linkingDate.isAcceptableOrUnknown(
              data['linking_date']!, _linkingDateMeta));
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('selected_by_user')) {
      context.handle(
          _selectedByUserMeta,
          selectedByUser.isAcceptableOrUnknown(
              data['selected_by_user']!, _selectedByUserMeta));
    }
    if (data.containsKey('ordered_by_user')) {
      context.handle(
          _orderedByUserMeta,
          orderedByUser.isAcceptableOrUnknown(
              data['ordered_by_user']!, _orderedByUserMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagUserLinkTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagUserLinkTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      linkingDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}linking_date'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      selectedByUser: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}selected_by_user']),
      orderedByUser: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ordered_by_user']),
    );
  }

  @override
  $TagUserLinkTableDriftTable createAlias(String alias) {
    return $TagUserLinkTableDriftTable(attachedDatabase, alias);
  }
}

class TagUserLinkTableDriftG extends DataClass
    implements Insertable<TagUserLinkTableDriftG> {
  final int id;
  final DateTime linkingDate;
  final int tagId;
  final int userId;
  final bool? selectedByUser;
  final int? orderedByUser;
  const TagUserLinkTableDriftG(
      {required this.id,
      required this.linkingDate,
      required this.tagId,
      required this.userId,
      this.selectedByUser,
      this.orderedByUser});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['linking_date'] = Variable<DateTime>(linkingDate);
    map['tag_id'] = Variable<int>(tagId);
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || selectedByUser != null) {
      map['selected_by_user'] = Variable<bool>(selectedByUser);
    }
    if (!nullToAbsent || orderedByUser != null) {
      map['ordered_by_user'] = Variable<int>(orderedByUser);
    }
    return map;
  }

  TagUserLinkTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TagUserLinkTableDriftCompanion(
      id: Value(id),
      linkingDate: Value(linkingDate),
      tagId: Value(tagId),
      userId: Value(userId),
      selectedByUser: selectedByUser == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedByUser),
      orderedByUser: orderedByUser == null && nullToAbsent
          ? const Value.absent()
          : Value(orderedByUser),
    );
  }

  factory TagUserLinkTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagUserLinkTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      linkingDate: serializer.fromJson<DateTime>(json['linkingDate']),
      tagId: serializer.fromJson<int>(json['tagId']),
      userId: serializer.fromJson<int>(json['userId']),
      selectedByUser: serializer.fromJson<bool?>(json['selectedByUser']),
      orderedByUser: serializer.fromJson<int?>(json['orderedByUser']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'linkingDate': serializer.toJson<DateTime>(linkingDate),
      'tagId': serializer.toJson<int>(tagId),
      'userId': serializer.toJson<int>(userId),
      'selectedByUser': serializer.toJson<bool?>(selectedByUser),
      'orderedByUser': serializer.toJson<int?>(orderedByUser),
    };
  }

  TagUserLinkTableDriftG copyWith(
          {int? id,
          DateTime? linkingDate,
          int? tagId,
          int? userId,
          Value<bool?> selectedByUser = const Value.absent(),
          Value<int?> orderedByUser = const Value.absent()}) =>
      TagUserLinkTableDriftG(
        id: id ?? this.id,
        linkingDate: linkingDate ?? this.linkingDate,
        tagId: tagId ?? this.tagId,
        userId: userId ?? this.userId,
        selectedByUser:
            selectedByUser.present ? selectedByUser.value : this.selectedByUser,
        orderedByUser:
            orderedByUser.present ? orderedByUser.value : this.orderedByUser,
      );
  TagUserLinkTableDriftG copyWithCompanion(
      TagUserLinkTableDriftCompanion data) {
    return TagUserLinkTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      linkingDate:
          data.linkingDate.present ? data.linkingDate.value : this.linkingDate,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
      userId: data.userId.present ? data.userId.value : this.userId,
      selectedByUser: data.selectedByUser.present
          ? data.selectedByUser.value
          : this.selectedByUser,
      orderedByUser: data.orderedByUser.present
          ? data.orderedByUser.value
          : this.orderedByUser,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagUserLinkTableDriftG(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('tagId: $tagId, ')
          ..write('userId: $userId, ')
          ..write('selectedByUser: $selectedByUser, ')
          ..write('orderedByUser: $orderedByUser')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, linkingDate, tagId, userId, selectedByUser, orderedByUser);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagUserLinkTableDriftG &&
          other.id == this.id &&
          other.linkingDate == this.linkingDate &&
          other.tagId == this.tagId &&
          other.userId == this.userId &&
          other.selectedByUser == this.selectedByUser &&
          other.orderedByUser == this.orderedByUser);
}

class TagUserLinkTableDriftCompanion
    extends UpdateCompanion<TagUserLinkTableDriftG> {
  final Value<int> id;
  final Value<DateTime> linkingDate;
  final Value<int> tagId;
  final Value<int> userId;
  final Value<bool?> selectedByUser;
  final Value<int?> orderedByUser;
  const TagUserLinkTableDriftCompanion({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    this.tagId = const Value.absent(),
    this.userId = const Value.absent(),
    this.selectedByUser = const Value.absent(),
    this.orderedByUser = const Value.absent(),
  });
  TagUserLinkTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    required int tagId,
    required int userId,
    this.selectedByUser = const Value.absent(),
    this.orderedByUser = const Value.absent(),
  })  : tagId = Value(tagId),
        userId = Value(userId);
  static Insertable<TagUserLinkTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? linkingDate,
    Expression<int>? tagId,
    Expression<int>? userId,
    Expression<bool>? selectedByUser,
    Expression<int>? orderedByUser,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkingDate != null) 'linking_date': linkingDate,
      if (tagId != null) 'tag_id': tagId,
      if (userId != null) 'user_id': userId,
      if (selectedByUser != null) 'selected_by_user': selectedByUser,
      if (orderedByUser != null) 'ordered_by_user': orderedByUser,
    });
  }

  TagUserLinkTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? linkingDate,
      Value<int>? tagId,
      Value<int>? userId,
      Value<bool?>? selectedByUser,
      Value<int?>? orderedByUser}) {
    return TagUserLinkTableDriftCompanion(
      id: id ?? this.id,
      linkingDate: linkingDate ?? this.linkingDate,
      tagId: tagId ?? this.tagId,
      userId: userId ?? this.userId,
      selectedByUser: selectedByUser ?? this.selectedByUser,
      orderedByUser: orderedByUser ?? this.orderedByUser,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (linkingDate.present) {
      map['linking_date'] = Variable<DateTime>(linkingDate.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (selectedByUser.present) {
      map['selected_by_user'] = Variable<bool>(selectedByUser.value);
    }
    if (orderedByUser.present) {
      map['ordered_by_user'] = Variable<int>(orderedByUser.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagUserLinkTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('tagId: $tagId, ')
          ..write('userId: $userId, ')
          ..write('selectedByUser: $selectedByUser, ')
          ..write('orderedByUser: $orderedByUser')
          ..write(')'))
        .toString();
  }
}

abstract class _$OrganizerDriftDB extends GeneratedDatabase {
  _$OrganizerDriftDB(QueryExecutor e) : super(e);
  $OrganizerDriftDBManager get managers => $OrganizerDriftDBManager(this);
  late final $OrganizerItemTableDriftTable organizerItemTableDrift =
      $OrganizerItemTableDriftTable(this);
  late final $TaskTableDriftTable taskTableDrift = $TaskTableDriftTable(this);
  late final $TaskTagLinkTableDriftTable taskTagLinkTableDrift =
      $TaskTagLinkTableDriftTable(this);
  late final $TaskReminderLinkTableDriftTable taskReminderLinkTableDrift =
      $TaskReminderLinkTableDriftTable(this);
  late final $TaskUserLinkTableDriftTable taskUserLinkTableDrift =
      $TaskUserLinkTableDriftTable(this);
  late final $UserTableDriftTable userTableDrift = $UserTableDriftTable(this);
  late final $UserUserTableDriftTable userUserTableDrift =
      $UserUserTableDriftTable(this);
  late final $ReminderTableDriftTable reminderTableDrift =
      $ReminderTableDriftTable(this);
  late final $TagTableDriftTable tagTableDrift = $TagTableDriftTable(this);
  late final $TagUserLinkTableDriftTable tagUserLinkTableDrift =
      $TagUserLinkTableDriftTable(this);
  late final OrganizerItemDaoDrift organizerItemDaoDrift =
      OrganizerItemDaoDrift(this as OrganizerDriftDB);
  late final TaskDaoDrift taskDaoDrift = TaskDaoDrift(this as OrganizerDriftDB);
  late final TaskTagLinkDaoDrift taskTagLinkDaoDrift =
      TaskTagLinkDaoDrift(this as OrganizerDriftDB);
  late final TaskReminderLinkDaoDrift taskReminderLinkDaoDrift =
      TaskReminderLinkDaoDrift(this as OrganizerDriftDB);
  late final TaskUserLinkDaoDrift taskUserLinkDaoDrift =
      TaskUserLinkDaoDrift(this as OrganizerDriftDB);
  late final UserDaoDrift userDaoDrift = UserDaoDrift(this as OrganizerDriftDB);
  late final UserUserDaoDrift userUserDaoDrift =
      UserUserDaoDrift(this as OrganizerDriftDB);
  late final ReminderDaoDrift reminderDaoDrift =
      ReminderDaoDrift(this as OrganizerDriftDB);
  late final TagDaoDrift tagDaoDrift = TagDaoDrift(this as OrganizerDriftDB);
  late final TagUserLinkDaoDrift tagUserLinkDaoDrift =
      TagUserLinkDaoDrift(this as OrganizerDriftDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        organizerItemTableDrift,
        taskTableDrift,
        taskTagLinkTableDrift,
        taskReminderLinkTableDrift,
        taskUserLinkTableDrift,
        userTableDrift,
        userUserTableDrift,
        reminderTableDrift,
        tagTableDrift,
        tagUserLinkTableDrift
      ];
}

typedef $$OrganizerItemTableDriftTableCreateCompanionBuilder
    = OrganizerItemTableDriftCompanion Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
});
typedef $$OrganizerItemTableDriftTableUpdateCompanionBuilder
    = OrganizerItemTableDriftCompanion Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
});

class $$OrganizerItemTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $OrganizerItemTableDriftTable> {
  $$OrganizerItemTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnFilters(column));
}

class $$OrganizerItemTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $OrganizerItemTableDriftTable> {
  $$OrganizerItemTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnOrderings(column));
}

class $$OrganizerItemTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $OrganizerItemTableDriftTable> {
  $$OrganizerItemTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get creatorId =>
      $composableBuilder(column: $table.creatorId, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate, builder: (column) => column);

  GeneratedColumn<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => column);

  GeneratedColumn<int> get views =>
      $composableBuilder(column: $table.views, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);
}

class $$OrganizerItemTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $OrganizerItemTableDriftTable,
    OrganizerItemTableDriftG,
    $$OrganizerItemTableDriftTableFilterComposer,
    $$OrganizerItemTableDriftTableOrderingComposer,
    $$OrganizerItemTableDriftTableAnnotationComposer,
    $$OrganizerItemTableDriftTableCreateCompanionBuilder,
    $$OrganizerItemTableDriftTableUpdateCompanionBuilder,
    (
      OrganizerItemTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $OrganizerItemTableDriftTable,
          OrganizerItemTableDriftG>
    ),
    OrganizerItemTableDriftG,
    PrefetchHooks Function()> {
  $$OrganizerItemTableDriftTableTableManager(
      _$OrganizerDriftDB db, $OrganizerItemTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrganizerItemTableDriftTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$OrganizerItemTableDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrganizerItemTableDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
          }) =>
              OrganizerItemTableDriftCompanion(
            id: id,
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
          }) =>
              OrganizerItemTableDriftCompanion.insert(
            id: id,
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrganizerItemTableDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$OrganizerDriftDB,
        $OrganizerItemTableDriftTable,
        OrganizerItemTableDriftG,
        $$OrganizerItemTableDriftTableFilterComposer,
        $$OrganizerItemTableDriftTableOrderingComposer,
        $$OrganizerItemTableDriftTableAnnotationComposer,
        $$OrganizerItemTableDriftTableCreateCompanionBuilder,
        $$OrganizerItemTableDriftTableUpdateCompanionBuilder,
        (
          OrganizerItemTableDriftG,
          BaseReferences<_$OrganizerDriftDB, $OrganizerItemTableDriftTable,
              OrganizerItemTableDriftG>
        ),
        OrganizerItemTableDriftG,
        PrefetchHooks Function()>;
typedef $$TaskTableDriftTableCreateCompanionBuilder = TaskTableDriftCompanion
    Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
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
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
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

class $$TaskTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $TaskTableDriftTable> {
  $$TaskTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get workingTime => $composableBuilder(
      column: $table.workingTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get estimatedTime => $composableBuilder(
      column: $table.estimatedTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get estimatedLeftTime => $composableBuilder(
      column: $table.estimatedLeftTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get workingProgress => $composableBuilder(
      column: $table.workingProgress,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get taskStatus => $composableBuilder(
      column: $table.taskStatus, builder: (column) => ColumnFilters(column));
}

class $$TaskTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $TaskTableDriftTable> {
  $$TaskTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get workingTime => $composableBuilder(
      column: $table.workingTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get estimatedTime => $composableBuilder(
      column: $table.estimatedTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get estimatedLeftTime => $composableBuilder(
      column: $table.estimatedLeftTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get workingProgress => $composableBuilder(
      column: $table.workingProgress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get taskStatus => $composableBuilder(
      column: $table.taskStatus, builder: (column) => ColumnOrderings(column));
}

class $$TaskTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $TaskTableDriftTable> {
  $$TaskTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get creatorId =>
      $composableBuilder(column: $table.creatorId, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate, builder: (column) => column);

  GeneratedColumn<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => column);

  GeneratedColumn<int> get views =>
      $composableBuilder(column: $table.views, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<double> get workingTime => $composableBuilder(
      column: $table.workingTime, builder: (column) => column);

  GeneratedColumn<double> get estimatedTime => $composableBuilder(
      column: $table.estimatedTime, builder: (column) => column);

  GeneratedColumn<double> get estimatedLeftTime => $composableBuilder(
      column: $table.estimatedLeftTime, builder: (column) => column);

  GeneratedColumn<double> get workingProgress => $composableBuilder(
      column: $table.workingProgress, builder: (column) => column);

  GeneratedColumn<String> get taskStatus => $composableBuilder(
      column: $table.taskStatus, builder: (column) => column);
}

class $$TaskTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskTableDriftTable,
    TaskTableDriftG,
    $$TaskTableDriftTableFilterComposer,
    $$TaskTableDriftTableOrderingComposer,
    $$TaskTableDriftTableAnnotationComposer,
    $$TaskTableDriftTableCreateCompanionBuilder,
    $$TaskTableDriftTableUpdateCompanionBuilder,
    (
      TaskTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $TaskTableDriftTable, TaskTableDriftG>
    ),
    TaskTableDriftG,
    PrefetchHooks Function()> {
  $$TaskTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TaskTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTableDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTableDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTableDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
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
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
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
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
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
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
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
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskTableDriftTableProcessedTableManager = ProcessedTableManager<
    _$OrganizerDriftDB,
    $TaskTableDriftTable,
    TaskTableDriftG,
    $$TaskTableDriftTableFilterComposer,
    $$TaskTableDriftTableOrderingComposer,
    $$TaskTableDriftTableAnnotationComposer,
    $$TaskTableDriftTableCreateCompanionBuilder,
    $$TaskTableDriftTableUpdateCompanionBuilder,
    (
      TaskTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $TaskTableDriftTable, TaskTableDriftG>
    ),
    TaskTableDriftG,
    PrefetchHooks Function()>;
typedef $$TaskTagLinkTableDriftTableCreateCompanionBuilder
    = TaskTagLinkTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  required int taskId,
  required int tagId,
});
typedef $$TaskTagLinkTableDriftTableUpdateCompanionBuilder
    = TaskTagLinkTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  Value<int> taskId,
  Value<int> tagId,
});

class $$TaskTagLinkTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $TaskTagLinkTableDriftTable> {
  $$TaskTagLinkTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tagId => $composableBuilder(
      column: $table.tagId, builder: (column) => ColumnFilters(column));
}

class $$TaskTagLinkTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $TaskTagLinkTableDriftTable> {
  $$TaskTagLinkTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tagId => $composableBuilder(
      column: $table.tagId, builder: (column) => ColumnOrderings(column));
}

class $$TaskTagLinkTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $TaskTagLinkTableDriftTable> {
  $$TaskTagLinkTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => column);

  GeneratedColumn<int> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<int> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);
}

class $$TaskTagLinkTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskTagLinkTableDriftTable,
    TaskTagTableDriftG,
    $$TaskTagLinkTableDriftTableFilterComposer,
    $$TaskTagLinkTableDriftTableOrderingComposer,
    $$TaskTagLinkTableDriftTableAnnotationComposer,
    $$TaskTagLinkTableDriftTableCreateCompanionBuilder,
    $$TaskTagLinkTableDriftTableUpdateCompanionBuilder,
    (
      TaskTagTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $TaskTagLinkTableDriftTable,
          TaskTagTableDriftG>
    ),
    TaskTagTableDriftG,
    PrefetchHooks Function()> {
  $$TaskTagLinkTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TaskTagLinkTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTagLinkTableDriftTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTagLinkTableDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTagLinkTableDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            Value<int> taskId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
          }) =>
              TaskTagLinkTableDriftCompanion(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            tagId: tagId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            required int taskId,
            required int tagId,
          }) =>
              TaskTagLinkTableDriftCompanion.insert(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            tagId: tagId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskTagLinkTableDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$OrganizerDriftDB,
        $TaskTagLinkTableDriftTable,
        TaskTagTableDriftG,
        $$TaskTagLinkTableDriftTableFilterComposer,
        $$TaskTagLinkTableDriftTableOrderingComposer,
        $$TaskTagLinkTableDriftTableAnnotationComposer,
        $$TaskTagLinkTableDriftTableCreateCompanionBuilder,
        $$TaskTagLinkTableDriftTableUpdateCompanionBuilder,
        (
          TaskTagTableDriftG,
          BaseReferences<_$OrganizerDriftDB, $TaskTagLinkTableDriftTable,
              TaskTagTableDriftG>
        ),
        TaskTagTableDriftG,
        PrefetchHooks Function()>;
typedef $$TaskReminderLinkTableDriftTableCreateCompanionBuilder
    = TaskReminderLinkTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  required int taskId,
  required int reminderId,
});
typedef $$TaskReminderLinkTableDriftTableUpdateCompanionBuilder
    = TaskReminderLinkTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  Value<int> taskId,
  Value<int> reminderId,
});

class $$TaskReminderLinkTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $TaskReminderLinkTableDriftTable> {
  $$TaskReminderLinkTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reminderId => $composableBuilder(
      column: $table.reminderId, builder: (column) => ColumnFilters(column));
}

class $$TaskReminderLinkTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $TaskReminderLinkTableDriftTable> {
  $$TaskReminderLinkTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reminderId => $composableBuilder(
      column: $table.reminderId, builder: (column) => ColumnOrderings(column));
}

class $$TaskReminderLinkTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $TaskReminderLinkTableDriftTable> {
  $$TaskReminderLinkTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => column);

  GeneratedColumn<int> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<int> get reminderId => $composableBuilder(
      column: $table.reminderId, builder: (column) => column);
}

class $$TaskReminderLinkTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskReminderLinkTableDriftTable,
    TaskReminderTableDriftG,
    $$TaskReminderLinkTableDriftTableFilterComposer,
    $$TaskReminderLinkTableDriftTableOrderingComposer,
    $$TaskReminderLinkTableDriftTableAnnotationComposer,
    $$TaskReminderLinkTableDriftTableCreateCompanionBuilder,
    $$TaskReminderLinkTableDriftTableUpdateCompanionBuilder,
    (
      TaskReminderTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $TaskReminderLinkTableDriftTable,
          TaskReminderTableDriftG>
    ),
    TaskReminderTableDriftG,
    PrefetchHooks Function()> {
  $$TaskReminderLinkTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TaskReminderLinkTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskReminderLinkTableDriftTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskReminderLinkTableDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskReminderLinkTableDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            Value<int> taskId = const Value.absent(),
            Value<int> reminderId = const Value.absent(),
          }) =>
              TaskReminderLinkTableDriftCompanion(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            reminderId: reminderId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            required int taskId,
            required int reminderId,
          }) =>
              TaskReminderLinkTableDriftCompanion.insert(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            reminderId: reminderId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskReminderLinkTableDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$OrganizerDriftDB,
        $TaskReminderLinkTableDriftTable,
        TaskReminderTableDriftG,
        $$TaskReminderLinkTableDriftTableFilterComposer,
        $$TaskReminderLinkTableDriftTableOrderingComposer,
        $$TaskReminderLinkTableDriftTableAnnotationComposer,
        $$TaskReminderLinkTableDriftTableCreateCompanionBuilder,
        $$TaskReminderLinkTableDriftTableUpdateCompanionBuilder,
        (
          TaskReminderTableDriftG,
          BaseReferences<_$OrganizerDriftDB, $TaskReminderLinkTableDriftTable,
              TaskReminderTableDriftG>
        ),
        TaskReminderTableDriftG,
        PrefetchHooks Function()>;
typedef $$TaskUserLinkTableDriftTableCreateCompanionBuilder
    = TaskUserLinkTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  required int taskId,
  required int userId,
  Value<bool?> selectedByUser,
  Value<int?> orderedByUser,
});
typedef $$TaskUserLinkTableDriftTableUpdateCompanionBuilder
    = TaskUserLinkTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  Value<int> taskId,
  Value<int> userId,
  Value<bool?> selectedByUser,
  Value<int?> orderedByUser,
});

class $$TaskUserLinkTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $TaskUserLinkTableDriftTable> {
  $$TaskUserLinkTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get selectedByUser => $composableBuilder(
      column: $table.selectedByUser,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orderedByUser => $composableBuilder(
      column: $table.orderedByUser, builder: (column) => ColumnFilters(column));
}

class $$TaskUserLinkTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $TaskUserLinkTableDriftTable> {
  $$TaskUserLinkTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get taskId => $composableBuilder(
      column: $table.taskId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get selectedByUser => $composableBuilder(
      column: $table.selectedByUser,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orderedByUser => $composableBuilder(
      column: $table.orderedByUser,
      builder: (column) => ColumnOrderings(column));
}

class $$TaskUserLinkTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $TaskUserLinkTableDriftTable> {
  $$TaskUserLinkTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => column);

  GeneratedColumn<int> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get selectedByUser => $composableBuilder(
      column: $table.selectedByUser, builder: (column) => column);

  GeneratedColumn<int> get orderedByUser => $composableBuilder(
      column: $table.orderedByUser, builder: (column) => column);
}

class $$TaskUserLinkTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskUserLinkTableDriftTable,
    TaskUserLinkTableDriftG,
    $$TaskUserLinkTableDriftTableFilterComposer,
    $$TaskUserLinkTableDriftTableOrderingComposer,
    $$TaskUserLinkTableDriftTableAnnotationComposer,
    $$TaskUserLinkTableDriftTableCreateCompanionBuilder,
    $$TaskUserLinkTableDriftTableUpdateCompanionBuilder,
    (
      TaskUserLinkTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $TaskUserLinkTableDriftTable,
          TaskUserLinkTableDriftG>
    ),
    TaskUserLinkTableDriftG,
    PrefetchHooks Function()> {
  $$TaskUserLinkTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TaskUserLinkTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskUserLinkTableDriftTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskUserLinkTableDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskUserLinkTableDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            Value<int> taskId = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<bool?> selectedByUser = const Value.absent(),
            Value<int?> orderedByUser = const Value.absent(),
          }) =>
              TaskUserLinkTableDriftCompanion(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            userId: userId,
            selectedByUser: selectedByUser,
            orderedByUser: orderedByUser,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            required int taskId,
            required int userId,
            Value<bool?> selectedByUser = const Value.absent(),
            Value<int?> orderedByUser = const Value.absent(),
          }) =>
              TaskUserLinkTableDriftCompanion.insert(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            userId: userId,
            selectedByUser: selectedByUser,
            orderedByUser: orderedByUser,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TaskUserLinkTableDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$OrganizerDriftDB,
        $TaskUserLinkTableDriftTable,
        TaskUserLinkTableDriftG,
        $$TaskUserLinkTableDriftTableFilterComposer,
        $$TaskUserLinkTableDriftTableOrderingComposer,
        $$TaskUserLinkTableDriftTableAnnotationComposer,
        $$TaskUserLinkTableDriftTableCreateCompanionBuilder,
        $$TaskUserLinkTableDriftTableUpdateCompanionBuilder,
        (
          TaskUserLinkTableDriftG,
          BaseReferences<_$OrganizerDriftDB, $TaskUserLinkTableDriftTable,
              TaskUserLinkTableDriftG>
        ),
        TaskUserLinkTableDriftG,
        PrefetchHooks Function()>;
typedef $$UserTableDriftTableCreateCompanionBuilder = UserTableDriftCompanion
    Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
  required String name,
  required String email,
  required String hashedPassword,
  Value<String> userType,
});
typedef $$UserTableDriftTableUpdateCompanionBuilder = UserTableDriftCompanion
    Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
  Value<String> name,
  Value<String> email,
  Value<String> hashedPassword,
  Value<String> userType,
});

class $$UserTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $UserTableDriftTable> {
  $$UserTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hashedPassword => $composableBuilder(
      column: $table.hashedPassword,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userType => $composableBuilder(
      column: $table.userType, builder: (column) => ColumnFilters(column));
}

class $$UserTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $UserTableDriftTable> {
  $$UserTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hashedPassword => $composableBuilder(
      column: $table.hashedPassword,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userType => $composableBuilder(
      column: $table.userType, builder: (column) => ColumnOrderings(column));
}

class $$UserTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $UserTableDriftTable> {
  $$UserTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get creatorId =>
      $composableBuilder(column: $table.creatorId, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate, builder: (column) => column);

  GeneratedColumn<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => column);

  GeneratedColumn<int> get views =>
      $composableBuilder(column: $table.views, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get hashedPassword => $composableBuilder(
      column: $table.hashedPassword, builder: (column) => column);

  GeneratedColumn<String> get userType =>
      $composableBuilder(column: $table.userType, builder: (column) => column);
}

class $$UserTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $UserTableDriftTable,
    UserTableDriftG,
    $$UserTableDriftTableFilterComposer,
    $$UserTableDriftTableOrderingComposer,
    $$UserTableDriftTableAnnotationComposer,
    $$UserTableDriftTableCreateCompanionBuilder,
    $$UserTableDriftTableUpdateCompanionBuilder,
    (
      UserTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $UserTableDriftTable, UserTableDriftG>
    ),
    UserTableDriftG,
    PrefetchHooks Function()> {
  $$UserTableDriftTableTableManager(
      _$OrganizerDriftDB db, $UserTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> hashedPassword = const Value.absent(),
            Value<String> userType = const Value.absent(),
          }) =>
              UserTableDriftCompanion(
            id: id,
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
            name: name,
            email: email,
            hashedPassword: hashedPassword,
            userType: userType,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            required String name,
            required String email,
            required String hashedPassword,
            Value<String> userType = const Value.absent(),
          }) =>
              UserTableDriftCompanion.insert(
            id: id,
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
            name: name,
            email: email,
            hashedPassword: hashedPassword,
            userType: userType,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserTableDriftTableProcessedTableManager = ProcessedTableManager<
    _$OrganizerDriftDB,
    $UserTableDriftTable,
    UserTableDriftG,
    $$UserTableDriftTableFilterComposer,
    $$UserTableDriftTableOrderingComposer,
    $$UserTableDriftTableAnnotationComposer,
    $$UserTableDriftTableCreateCompanionBuilder,
    $$UserTableDriftTableUpdateCompanionBuilder,
    (
      UserTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $UserTableDriftTable, UserTableDriftG>
    ),
    UserTableDriftG,
    PrefetchHooks Function()>;
typedef $$UserUserTableDriftTableCreateCompanionBuilder
    = UserUserTableDriftCompanion Function({
  Value<int> id,
  required int userId,
  required int userIdLinked,
  required String userNameLinked,
  required String status,
  Value<DateTime> muteUntilDate,
  Value<DateTime> createdDate,
  Value<DateTime> updatedDate,
});
typedef $$UserUserTableDriftTableUpdateCompanionBuilder
    = UserUserTableDriftCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<int> userIdLinked,
  Value<String> userNameLinked,
  Value<String> status,
  Value<DateTime> muteUntilDate,
  Value<DateTime> createdDate,
  Value<DateTime> updatedDate,
});

class $$UserUserTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $UserUserTableDriftTable> {
  $$UserUserTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userIdLinked => $composableBuilder(
      column: $table.userIdLinked, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userNameLinked => $composableBuilder(
      column: $table.userNameLinked,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get muteUntilDate => $composableBuilder(
      column: $table.muteUntilDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedDate => $composableBuilder(
      column: $table.updatedDate, builder: (column) => ColumnFilters(column));
}

class $$UserUserTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $UserUserTableDriftTable> {
  $$UserUserTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userIdLinked => $composableBuilder(
      column: $table.userIdLinked,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userNameLinked => $composableBuilder(
      column: $table.userNameLinked,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get muteUntilDate => $composableBuilder(
      column: $table.muteUntilDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedDate => $composableBuilder(
      column: $table.updatedDate, builder: (column) => ColumnOrderings(column));
}

class $$UserUserTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $UserUserTableDriftTable> {
  $$UserUserTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get userIdLinked => $composableBuilder(
      column: $table.userIdLinked, builder: (column) => column);

  GeneratedColumn<String> get userNameLinked => $composableBuilder(
      column: $table.userNameLinked, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get muteUntilDate => $composableBuilder(
      column: $table.muteUntilDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedDate => $composableBuilder(
      column: $table.updatedDate, builder: (column) => column);
}

class $$UserUserTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $UserUserTableDriftTable,
    UserUserTableDriftG,
    $$UserUserTableDriftTableFilterComposer,
    $$UserUserTableDriftTableOrderingComposer,
    $$UserUserTableDriftTableAnnotationComposer,
    $$UserUserTableDriftTableCreateCompanionBuilder,
    $$UserUserTableDriftTableUpdateCompanionBuilder,
    (
      UserUserTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $UserUserTableDriftTable,
          UserUserTableDriftG>
    ),
    UserUserTableDriftG,
    PrefetchHooks Function()> {
  $$UserUserTableDriftTableTableManager(
      _$OrganizerDriftDB db, $UserUserTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserUserTableDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserUserTableDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserUserTableDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> userIdLinked = const Value.absent(),
            Value<String> userNameLinked = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> muteUntilDate = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> updatedDate = const Value.absent(),
          }) =>
              UserUserTableDriftCompanion(
            id: id,
            userId: userId,
            userIdLinked: userIdLinked,
            userNameLinked: userNameLinked,
            status: status,
            muteUntilDate: muteUntilDate,
            createdDate: createdDate,
            updatedDate: updatedDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required int userIdLinked,
            required String userNameLinked,
            required String status,
            Value<DateTime> muteUntilDate = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> updatedDate = const Value.absent(),
          }) =>
              UserUserTableDriftCompanion.insert(
            id: id,
            userId: userId,
            userIdLinked: userIdLinked,
            userNameLinked: userNameLinked,
            status: status,
            muteUntilDate: muteUntilDate,
            createdDate: createdDate,
            updatedDate: updatedDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserUserTableDriftTableProcessedTableManager = ProcessedTableManager<
    _$OrganizerDriftDB,
    $UserUserTableDriftTable,
    UserUserTableDriftG,
    $$UserUserTableDriftTableFilterComposer,
    $$UserUserTableDriftTableOrderingComposer,
    $$UserUserTableDriftTableAnnotationComposer,
    $$UserUserTableDriftTableCreateCompanionBuilder,
    $$UserUserTableDriftTableUpdateCompanionBuilder,
    (
      UserUserTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $UserUserTableDriftTable,
          UserUserTableDriftG>
    ),
    UserUserTableDriftG,
    PrefetchHooks Function()>;
typedef $$ReminderTableDriftTableCreateCompanionBuilder
    = ReminderTableDriftCompanion Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
  required DateTime remindAt,
});
typedef $$ReminderTableDriftTableUpdateCompanionBuilder
    = ReminderTableDriftCompanion Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
  Value<DateTime> remindAt,
});

class $$ReminderTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $ReminderTableDriftTable> {
  $$ReminderTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get remindAt => $composableBuilder(
      column: $table.remindAt, builder: (column) => ColumnFilters(column));
}

class $$ReminderTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $ReminderTableDriftTable> {
  $$ReminderTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get remindAt => $composableBuilder(
      column: $table.remindAt, builder: (column) => ColumnOrderings(column));
}

class $$ReminderTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $ReminderTableDriftTable> {
  $$ReminderTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get creatorId =>
      $composableBuilder(column: $table.creatorId, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate, builder: (column) => column);

  GeneratedColumn<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => column);

  GeneratedColumn<int> get views =>
      $composableBuilder(column: $table.views, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<DateTime> get remindAt =>
      $composableBuilder(column: $table.remindAt, builder: (column) => column);
}

class $$ReminderTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $ReminderTableDriftTable,
    ReminderTableDriftG,
    $$ReminderTableDriftTableFilterComposer,
    $$ReminderTableDriftTableOrderingComposer,
    $$ReminderTableDriftTableAnnotationComposer,
    $$ReminderTableDriftTableCreateCompanionBuilder,
    $$ReminderTableDriftTableUpdateCompanionBuilder,
    (
      ReminderTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $ReminderTableDriftTable,
          ReminderTableDriftG>
    ),
    ReminderTableDriftG,
    PrefetchHooks Function()> {
  $$ReminderTableDriftTableTableManager(
      _$OrganizerDriftDB db, $ReminderTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderTableDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderTableDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderTableDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<DateTime> remindAt = const Value.absent(),
          }) =>
              ReminderTableDriftCompanion(
            id: id,
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
            remindAt: remindAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            required DateTime remindAt,
          }) =>
              ReminderTableDriftCompanion.insert(
            id: id,
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
            remindAt: remindAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReminderTableDriftTableProcessedTableManager = ProcessedTableManager<
    _$OrganizerDriftDB,
    $ReminderTableDriftTable,
    ReminderTableDriftG,
    $$ReminderTableDriftTableFilterComposer,
    $$ReminderTableDriftTableOrderingComposer,
    $$ReminderTableDriftTableAnnotationComposer,
    $$ReminderTableDriftTableCreateCompanionBuilder,
    $$ReminderTableDriftTableUpdateCompanionBuilder,
    (
      ReminderTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $ReminderTableDriftTable,
          ReminderTableDriftG>
    ),
    ReminderTableDriftG,
    PrefetchHooks Function()>;
typedef $$TagTableDriftTableCreateCompanionBuilder = TagTableDriftCompanion
    Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
});
typedef $$TagTableDriftTableUpdateCompanionBuilder = TagTableDriftCompanion
    Function({
  Value<int> id,
  Value<int?> remoteId,
  Value<int?> creatorId,
  Value<String?> subject,
  Value<DateTime> createdDate,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewedDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
});

class $$TagTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $TagTableDriftTable> {
  $$TagTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnFilters(column));
}

class $$TagTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $TagTableDriftTable> {
  $$TagTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get creatorId => $composableBuilder(
      column: $table.creatorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnOrderings(column));
}

class $$TagTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $TagTableDriftTable> {
  $$TagTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get creatorId =>
      $composableBuilder(column: $table.creatorId, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
      column: $table.createdDate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdate => $composableBuilder(
      column: $table.lastUpdate, builder: (column) => column);

  GeneratedColumn<DateTime> get lastViewedDate => $composableBuilder(
      column: $table.lastViewedDate, builder: (column) => column);

  GeneratedColumn<int> get remoteViews => $composableBuilder(
      column: $table.remoteViews, builder: (column) => column);

  GeneratedColumn<int> get views =>
      $composableBuilder(column: $table.views, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);
}

class $$TagTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TagTableDriftTable,
    TagTableDriftG,
    $$TagTableDriftTableFilterComposer,
    $$TagTableDriftTableOrderingComposer,
    $$TagTableDriftTableAnnotationComposer,
    $$TagTableDriftTableCreateCompanionBuilder,
    $$TagTableDriftTableUpdateCompanionBuilder,
    (
      TagTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $TagTableDriftTable, TagTableDriftG>
    ),
    TagTableDriftG,
    PrefetchHooks Function()> {
  $$TagTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TagTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagTableDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagTableDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagTableDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
          }) =>
              TagTableDriftCompanion(
            id: id,
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<int?> creatorId = const Value.absent(),
            Value<String?> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewedDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
          }) =>
              TagTableDriftCompanion.insert(
            id: id,
            remoteId: remoteId,
            creatorId: creatorId,
            subject: subject,
            createdDate: createdDate,
            lastUpdate: lastUpdate,
            lastViewedDate: lastViewedDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TagTableDriftTableProcessedTableManager = ProcessedTableManager<
    _$OrganizerDriftDB,
    $TagTableDriftTable,
    TagTableDriftG,
    $$TagTableDriftTableFilterComposer,
    $$TagTableDriftTableOrderingComposer,
    $$TagTableDriftTableAnnotationComposer,
    $$TagTableDriftTableCreateCompanionBuilder,
    $$TagTableDriftTableUpdateCompanionBuilder,
    (
      TagTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $TagTableDriftTable, TagTableDriftG>
    ),
    TagTableDriftG,
    PrefetchHooks Function()>;
typedef $$TagUserLinkTableDriftTableCreateCompanionBuilder
    = TagUserLinkTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  required int tagId,
  required int userId,
  Value<bool?> selectedByUser,
  Value<int?> orderedByUser,
});
typedef $$TagUserLinkTableDriftTableUpdateCompanionBuilder
    = TagUserLinkTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  Value<int> tagId,
  Value<int> userId,
  Value<bool?> selectedByUser,
  Value<int?> orderedByUser,
});

class $$TagUserLinkTableDriftTableFilterComposer
    extends Composer<_$OrganizerDriftDB, $TagUserLinkTableDriftTable> {
  $$TagUserLinkTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get tagId => $composableBuilder(
      column: $table.tagId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get selectedByUser => $composableBuilder(
      column: $table.selectedByUser,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get orderedByUser => $composableBuilder(
      column: $table.orderedByUser, builder: (column) => ColumnFilters(column));
}

class $$TagUserLinkTableDriftTableOrderingComposer
    extends Composer<_$OrganizerDriftDB, $TagUserLinkTableDriftTable> {
  $$TagUserLinkTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get tagId => $composableBuilder(
      column: $table.tagId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get selectedByUser => $composableBuilder(
      column: $table.selectedByUser,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get orderedByUser => $composableBuilder(
      column: $table.orderedByUser,
      builder: (column) => ColumnOrderings(column));
}

class $$TagUserLinkTableDriftTableAnnotationComposer
    extends Composer<_$OrganizerDriftDB, $TagUserLinkTableDriftTable> {
  $$TagUserLinkTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get linkingDate => $composableBuilder(
      column: $table.linkingDate, builder: (column) => column);

  GeneratedColumn<int> get tagId =>
      $composableBuilder(column: $table.tagId, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get selectedByUser => $composableBuilder(
      column: $table.selectedByUser, builder: (column) => column);

  GeneratedColumn<int> get orderedByUser => $composableBuilder(
      column: $table.orderedByUser, builder: (column) => column);
}

class $$TagUserLinkTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TagUserLinkTableDriftTable,
    TagUserLinkTableDriftG,
    $$TagUserLinkTableDriftTableFilterComposer,
    $$TagUserLinkTableDriftTableOrderingComposer,
    $$TagUserLinkTableDriftTableAnnotationComposer,
    $$TagUserLinkTableDriftTableCreateCompanionBuilder,
    $$TagUserLinkTableDriftTableUpdateCompanionBuilder,
    (
      TagUserLinkTableDriftG,
      BaseReferences<_$OrganizerDriftDB, $TagUserLinkTableDriftTable,
          TagUserLinkTableDriftG>
    ),
    TagUserLinkTableDriftG,
    PrefetchHooks Function()> {
  $$TagUserLinkTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TagUserLinkTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagUserLinkTableDriftTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TagUserLinkTableDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagUserLinkTableDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            Value<int> tagId = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<bool?> selectedByUser = const Value.absent(),
            Value<int?> orderedByUser = const Value.absent(),
          }) =>
              TagUserLinkTableDriftCompanion(
            id: id,
            linkingDate: linkingDate,
            tagId: tagId,
            userId: userId,
            selectedByUser: selectedByUser,
            orderedByUser: orderedByUser,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            required int tagId,
            required int userId,
            Value<bool?> selectedByUser = const Value.absent(),
            Value<int?> orderedByUser = const Value.absent(),
          }) =>
              TagUserLinkTableDriftCompanion.insert(
            id: id,
            linkingDate: linkingDate,
            tagId: tagId,
            userId: userId,
            selectedByUser: selectedByUser,
            orderedByUser: orderedByUser,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TagUserLinkTableDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$OrganizerDriftDB,
        $TagUserLinkTableDriftTable,
        TagUserLinkTableDriftG,
        $$TagUserLinkTableDriftTableFilterComposer,
        $$TagUserLinkTableDriftTableOrderingComposer,
        $$TagUserLinkTableDriftTableAnnotationComposer,
        $$TagUserLinkTableDriftTableCreateCompanionBuilder,
        $$TagUserLinkTableDriftTableUpdateCompanionBuilder,
        (
          TagUserLinkTableDriftG,
          BaseReferences<_$OrganizerDriftDB, $TagUserLinkTableDriftTable,
              TagUserLinkTableDriftG>
        ),
        TagUserLinkTableDriftG,
        PrefetchHooks Function()>;

class $OrganizerDriftDBManager {
  final _$OrganizerDriftDB _db;
  $OrganizerDriftDBManager(this._db);
  $$OrganizerItemTableDriftTableTableManager get organizerItemTableDrift =>
      $$OrganizerItemTableDriftTableTableManager(
          _db, _db.organizerItemTableDrift);
  $$TaskTableDriftTableTableManager get taskTableDrift =>
      $$TaskTableDriftTableTableManager(_db, _db.taskTableDrift);
  $$TaskTagLinkTableDriftTableTableManager get taskTagLinkTableDrift =>
      $$TaskTagLinkTableDriftTableTableManager(_db, _db.taskTagLinkTableDrift);
  $$TaskReminderLinkTableDriftTableTableManager
      get taskReminderLinkTableDrift =>
          $$TaskReminderLinkTableDriftTableTableManager(
              _db, _db.taskReminderLinkTableDrift);
  $$TaskUserLinkTableDriftTableTableManager get taskUserLinkTableDrift =>
      $$TaskUserLinkTableDriftTableTableManager(
          _db, _db.taskUserLinkTableDrift);
  $$UserTableDriftTableTableManager get userTableDrift =>
      $$UserTableDriftTableTableManager(_db, _db.userTableDrift);
  $$UserUserTableDriftTableTableManager get userUserTableDrift =>
      $$UserUserTableDriftTableTableManager(_db, _db.userUserTableDrift);
  $$ReminderTableDriftTableTableManager get reminderTableDrift =>
      $$ReminderTableDriftTableTableManager(_db, _db.reminderTableDrift);
  $$TagTableDriftTableTableManager get tagTableDrift =>
      $$TagTableDriftTableTableManager(_db, _db.tagTableDrift);
  $$TagUserLinkTableDriftTableTableManager get tagUserLinkTableDrift =>
      $$TagUserLinkTableDriftTableTableManager(_db, _db.tagUserLinkTableDrift);
}
