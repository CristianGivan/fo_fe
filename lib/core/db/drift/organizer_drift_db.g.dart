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
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastAccessedDateMeta =
      const VerificationMeta('lastAccessedDate');
  @override
  late final GeneratedColumn<DateTime> lastAccessedDate =
      GeneratedColumn<DateTime>('last_accessed_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteAccessesMeta =
      const VerificationMeta('remoteAccesses');
  @override
  late final GeneratedColumn<int> remoteAccesses = GeneratedColumn<int>(
      'remote_accesses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accessesMeta =
      const VerificationMeta('accesses');
  @override
  late final GeneratedColumn<int> accesses = GeneratedColumn<int>(
      'accesses', aliasedName, true,
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
        createdDate,
        creatorId,
        remoteId,
        lastUpdate,
        lastAccessedDate,
        remoteAccesses,
        accesses,
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
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    } else if (isInserting) {
      context.missing(_creatorIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_accessed_date')) {
      context.handle(
          _lastAccessedDateMeta,
          lastAccessedDate.isAcceptableOrUnknown(
              data['last_accessed_date']!, _lastAccessedDateMeta));
    }
    if (data.containsKey('remote_accesses')) {
      context.handle(
          _remoteAccessesMeta,
          remoteAccesses.isAcceptableOrUnknown(
              data['remote_accesses']!, _remoteAccessesMeta));
    }
    if (data.containsKey('accesses')) {
      context.handle(_accessesMeta,
          accesses.isAcceptableOrUnknown(data['accesses']!, _accessesMeta));
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
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastAccessedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_accessed_date']),
      remoteAccesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_accesses']),
      accesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}accesses']),
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
  final DateTime createdDate;
  final int creatorId;
  final int? remoteId;
  final DateTime? lastUpdate;
  final DateTime? lastAccessedDate;
  final int? remoteAccesses;
  final int? accesses;
  final String? checksum;
  const OrganizerItemTableDriftG(
      {required this.id,
      required this.createdDate,
      required this.creatorId,
      this.remoteId,
      this.lastUpdate,
      this.lastAccessedDate,
      this.remoteAccesses,
      this.accesses,
      this.checksum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['creator_id'] = Variable<int>(creatorId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastAccessedDate != null) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate);
    }
    if (!nullToAbsent || remoteAccesses != null) {
      map['remote_accesses'] = Variable<int>(remoteAccesses);
    }
    if (!nullToAbsent || accesses != null) {
      map['accesses'] = Variable<int>(accesses);
    }
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    return map;
  }

  OrganizerItemTableDriftCompanion toCompanion(bool nullToAbsent) {
    return OrganizerItemTableDriftCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      creatorId: Value(creatorId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastAccessedDate: lastAccessedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAccessedDate),
      remoteAccesses: remoteAccesses == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteAccesses),
      accesses: accesses == null && nullToAbsent
          ? const Value.absent()
          : Value(accesses),
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
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      creatorId: serializer.fromJson<int>(json['creatorId']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastAccessedDate:
          serializer.fromJson<DateTime?>(json['lastAccessedDate']),
      remoteAccesses: serializer.fromJson<int?>(json['remoteAccesses']),
      accesses: serializer.fromJson<int?>(json['accesses']),
      checksum: serializer.fromJson<String?>(json['checksum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'creatorId': serializer.toJson<int>(creatorId),
      'remoteId': serializer.toJson<int?>(remoteId),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastAccessedDate': serializer.toJson<DateTime?>(lastAccessedDate),
      'remoteAccesses': serializer.toJson<int?>(remoteAccesses),
      'accesses': serializer.toJson<int?>(accesses),
      'checksum': serializer.toJson<String?>(checksum),
    };
  }

  OrganizerItemTableDriftG copyWith(
          {int? id,
          DateTime? createdDate,
          int? creatorId,
          Value<int?> remoteId = const Value.absent(),
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastAccessedDate = const Value.absent(),
          Value<int?> remoteAccesses = const Value.absent(),
          Value<int?> accesses = const Value.absent(),
          Value<String?> checksum = const Value.absent()}) =>
      OrganizerItemTableDriftG(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        creatorId: creatorId ?? this.creatorId,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastAccessedDate: lastAccessedDate.present
            ? lastAccessedDate.value
            : this.lastAccessedDate,
        remoteAccesses:
            remoteAccesses.present ? remoteAccesses.value : this.remoteAccesses,
        accesses: accesses.present ? accesses.value : this.accesses,
        checksum: checksum.present ? checksum.value : this.checksum,
      );
  OrganizerItemTableDriftG copyWithCompanion(
      OrganizerItemTableDriftCompanion data) {
    return OrganizerItemTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastAccessedDate: data.lastAccessedDate.present
          ? data.lastAccessedDate.value
          : this.lastAccessedDate,
      remoteAccesses: data.remoteAccesses.present
          ? data.remoteAccesses.value
          : this.remoteAccesses,
      accesses: data.accesses.present ? data.accesses.value : this.accesses,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganizerItemTableDriftG(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdDate, creatorId, remoteId,
      lastUpdate, lastAccessedDate, remoteAccesses, accesses, checksum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizerItemTableDriftG &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.creatorId == this.creatorId &&
          other.remoteId == this.remoteId &&
          other.lastUpdate == this.lastUpdate &&
          other.lastAccessedDate == this.lastAccessedDate &&
          other.remoteAccesses == this.remoteAccesses &&
          other.accesses == this.accesses &&
          other.checksum == this.checksum);
}

class OrganizerItemTableDriftCompanion
    extends UpdateCompanion<OrganizerItemTableDriftG> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<int> creatorId;
  final Value<int?> remoteId;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastAccessedDate;
  final Value<int?> remoteAccesses;
  final Value<int?> accesses;
  final Value<String?> checksum;
  const OrganizerItemTableDriftCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
  });
  OrganizerItemTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    required int creatorId,
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
  }) : creatorId = Value(creatorId);
  static Insertable<OrganizerItemTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<int>? creatorId,
    Expression<int>? remoteId,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastAccessedDate,
    Expression<int>? remoteAccesses,
    Expression<int>? accesses,
    Expression<String>? checksum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (creatorId != null) 'creator_id': creatorId,
      if (remoteId != null) 'remote_id': remoteId,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastAccessedDate != null) 'last_accessed_date': lastAccessedDate,
      if (remoteAccesses != null) 'remote_accesses': remoteAccesses,
      if (accesses != null) 'accesses': accesses,
      if (checksum != null) 'checksum': checksum,
    });
  }

  OrganizerItemTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<int>? creatorId,
      Value<int?>? remoteId,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastAccessedDate,
      Value<int?>? remoteAccesses,
      Value<int?>? accesses,
      Value<String?>? checksum}) {
    return OrganizerItemTableDriftCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastAccessedDate: lastAccessedDate ?? this.lastAccessedDate,
      remoteAccesses: remoteAccesses ?? this.remoteAccesses,
      accesses: accesses ?? this.accesses,
      checksum: checksum ?? this.checksum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastAccessedDate.present) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate.value);
    }
    if (remoteAccesses.present) {
      map['remote_accesses'] = Variable<int>(remoteAccesses.value);
    }
    if (accesses.present) {
      map['accesses'] = Variable<int>(accesses.value);
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
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
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
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastAccessedDateMeta =
      const VerificationMeta('lastAccessedDate');
  @override
  late final GeneratedColumn<DateTime> lastAccessedDate =
      GeneratedColumn<DateTime>('last_accessed_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteAccessesMeta =
      const VerificationMeta('remoteAccesses');
  @override
  late final GeneratedColumn<int> remoteAccesses = GeneratedColumn<int>(
      'remote_accesses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accessesMeta =
      const VerificationMeta('accesses');
  @override
  late final GeneratedColumn<int> accesses = GeneratedColumn<int>(
      'accesses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _checksumMeta =
      const VerificationMeta('checksum');
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
      'checksum', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
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
        createdDate,
        creatorId,
        remoteId,
        lastUpdate,
        lastAccessedDate,
        remoteAccesses,
        accesses,
        checksum,
        subject,
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
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    } else if (isInserting) {
      context.missing(_creatorIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_accessed_date')) {
      context.handle(
          _lastAccessedDateMeta,
          lastAccessedDate.isAcceptableOrUnknown(
              data['last_accessed_date']!, _lastAccessedDateMeta));
    }
    if (data.containsKey('remote_accesses')) {
      context.handle(
          _remoteAccessesMeta,
          remoteAccesses.isAcceptableOrUnknown(
              data['remote_accesses']!, _remoteAccessesMeta));
    }
    if (data.containsKey('accesses')) {
      context.handle(_accessesMeta,
          accesses.isAcceptableOrUnknown(data['accesses']!, _accessesMeta));
    }
    if (data.containsKey('checksum')) {
      context.handle(_checksumMeta,
          checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
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
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastAccessedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_accessed_date']),
      remoteAccesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_accesses']),
      accesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}accesses']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
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
  final DateTime createdDate;
  final int creatorId;
  final int? remoteId;
  final DateTime? lastUpdate;
  final DateTime? lastAccessedDate;
  final int? remoteAccesses;
  final int? accesses;
  final String? checksum;
  final String subject;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? workingTime;
  final double? estimatedTime;
  final double? estimatedLeftTime;
  final double? workingProgress;
  final String? taskStatus;
  const TaskTableDriftG(
      {required this.id,
      required this.createdDate,
      required this.creatorId,
      this.remoteId,
      this.lastUpdate,
      this.lastAccessedDate,
      this.remoteAccesses,
      this.accesses,
      this.checksum,
      required this.subject,
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
    map['created_date'] = Variable<DateTime>(createdDate);
    map['creator_id'] = Variable<int>(creatorId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastAccessedDate != null) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate);
    }
    if (!nullToAbsent || remoteAccesses != null) {
      map['remote_accesses'] = Variable<int>(remoteAccesses);
    }
    if (!nullToAbsent || accesses != null) {
      map['accesses'] = Variable<int>(accesses);
    }
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    map['subject'] = Variable<String>(subject);
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
      createdDate: Value(createdDate),
      creatorId: Value(creatorId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastAccessedDate: lastAccessedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAccessedDate),
      remoteAccesses: remoteAccesses == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteAccesses),
      accesses: accesses == null && nullToAbsent
          ? const Value.absent()
          : Value(accesses),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      subject: Value(subject),
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
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      creatorId: serializer.fromJson<int>(json['creatorId']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastAccessedDate:
          serializer.fromJson<DateTime?>(json['lastAccessedDate']),
      remoteAccesses: serializer.fromJson<int?>(json['remoteAccesses']),
      accesses: serializer.fromJson<int?>(json['accesses']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      subject: serializer.fromJson<String>(json['subject']),
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
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'creatorId': serializer.toJson<int>(creatorId),
      'remoteId': serializer.toJson<int?>(remoteId),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastAccessedDate': serializer.toJson<DateTime?>(lastAccessedDate),
      'remoteAccesses': serializer.toJson<int?>(remoteAccesses),
      'accesses': serializer.toJson<int?>(accesses),
      'checksum': serializer.toJson<String?>(checksum),
      'subject': serializer.toJson<String>(subject),
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
          DateTime? createdDate,
          int? creatorId,
          Value<int?> remoteId = const Value.absent(),
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastAccessedDate = const Value.absent(),
          Value<int?> remoteAccesses = const Value.absent(),
          Value<int?> accesses = const Value.absent(),
          Value<String?> checksum = const Value.absent(),
          String? subject,
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<double?> workingTime = const Value.absent(),
          Value<double?> estimatedTime = const Value.absent(),
          Value<double?> estimatedLeftTime = const Value.absent(),
          Value<double?> workingProgress = const Value.absent(),
          Value<String?> taskStatus = const Value.absent()}) =>
      TaskTableDriftG(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        creatorId: creatorId ?? this.creatorId,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastAccessedDate: lastAccessedDate.present
            ? lastAccessedDate.value
            : this.lastAccessedDate,
        remoteAccesses:
            remoteAccesses.present ? remoteAccesses.value : this.remoteAccesses,
        accesses: accesses.present ? accesses.value : this.accesses,
        checksum: checksum.present ? checksum.value : this.checksum,
        subject: subject ?? this.subject,
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
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastAccessedDate: data.lastAccessedDate.present
          ? data.lastAccessedDate.value
          : this.lastAccessedDate,
      remoteAccesses: data.remoteAccesses.present
          ? data.remoteAccesses.value
          : this.remoteAccesses,
      accesses: data.accesses.present ? data.accesses.value : this.accesses,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      subject: data.subject.present ? data.subject.value : this.subject,
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
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum, ')
          ..write('subject: $subject, ')
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
      createdDate,
      creatorId,
      remoteId,
      lastUpdate,
      lastAccessedDate,
      remoteAccesses,
      accesses,
      checksum,
      subject,
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
          other.createdDate == this.createdDate &&
          other.creatorId == this.creatorId &&
          other.remoteId == this.remoteId &&
          other.lastUpdate == this.lastUpdate &&
          other.lastAccessedDate == this.lastAccessedDate &&
          other.remoteAccesses == this.remoteAccesses &&
          other.accesses == this.accesses &&
          other.checksum == this.checksum &&
          other.subject == this.subject &&
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
  final Value<DateTime> createdDate;
  final Value<int> creatorId;
  final Value<int?> remoteId;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastAccessedDate;
  final Value<int?> remoteAccesses;
  final Value<int?> accesses;
  final Value<String?> checksum;
  final Value<String> subject;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<double?> workingTime;
  final Value<double?> estimatedTime;
  final Value<double?> estimatedLeftTime;
  final Value<double?> workingProgress;
  final Value<String?> taskStatus;
  const TaskTableDriftCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
    this.subject = const Value.absent(),
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
    this.createdDate = const Value.absent(),
    required int creatorId,
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
    required String subject,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.workingTime = const Value.absent(),
    this.estimatedTime = const Value.absent(),
    this.estimatedLeftTime = const Value.absent(),
    this.workingProgress = const Value.absent(),
    this.taskStatus = const Value.absent(),
  })  : creatorId = Value(creatorId),
        subject = Value(subject);
  static Insertable<TaskTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<int>? creatorId,
    Expression<int>? remoteId,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastAccessedDate,
    Expression<int>? remoteAccesses,
    Expression<int>? accesses,
    Expression<String>? checksum,
    Expression<String>? subject,
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
      if (createdDate != null) 'created_date': createdDate,
      if (creatorId != null) 'creator_id': creatorId,
      if (remoteId != null) 'remote_id': remoteId,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastAccessedDate != null) 'last_accessed_date': lastAccessedDate,
      if (remoteAccesses != null) 'remote_accesses': remoteAccesses,
      if (accesses != null) 'accesses': accesses,
      if (checksum != null) 'checksum': checksum,
      if (subject != null) 'subject': subject,
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
      Value<DateTime>? createdDate,
      Value<int>? creatorId,
      Value<int?>? remoteId,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastAccessedDate,
      Value<int?>? remoteAccesses,
      Value<int?>? accesses,
      Value<String?>? checksum,
      Value<String>? subject,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<double?>? workingTime,
      Value<double?>? estimatedTime,
      Value<double?>? estimatedLeftTime,
      Value<double?>? workingProgress,
      Value<String?>? taskStatus}) {
    return TaskTableDriftCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastAccessedDate: lastAccessedDate ?? this.lastAccessedDate,
      remoteAccesses: remoteAccesses ?? this.remoteAccesses,
      accesses: accesses ?? this.accesses,
      checksum: checksum ?? this.checksum,
      subject: subject ?? this.subject,
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
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastAccessedDate.present) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate.value);
    }
    if (remoteAccesses.present) {
      map['remote_accesses'] = Variable<int>(remoteAccesses.value);
    }
    if (accesses.present) {
      map['accesses'] = Variable<int>(accesses.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
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
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum, ')
          ..write('subject: $subject, ')
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

class $TaskTagTableDriftTable extends TaskTagTableDrift
    with TableInfo<$TaskTagTableDriftTable, TaskTagTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTagTableDriftTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'task_tag_table_drift';
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
  $TaskTagTableDriftTable createAlias(String alias) {
    return $TaskTagTableDriftTable(attachedDatabase, alias);
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

  TaskTagTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TaskTagTableDriftCompanion(
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
  TaskTagTableDriftG copyWithCompanion(TaskTagTableDriftCompanion data) {
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

class TaskTagTableDriftCompanion extends UpdateCompanion<TaskTagTableDriftG> {
  final Value<int> id;
  final Value<DateTime> linkingDate;
  final Value<int> taskId;
  final Value<int> tagId;
  const TaskTagTableDriftCompanion({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    this.taskId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  TaskTagTableDriftCompanion.insert({
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

  TaskTagTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? linkingDate,
      Value<int>? taskId,
      Value<int>? tagId}) {
    return TaskTagTableDriftCompanion(
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
    return (StringBuffer('TaskTagTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $TaskReminderTableDriftTable extends TaskReminderTableDrift
    with TableInfo<$TaskReminderTableDriftTable, TaskReminderTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskReminderTableDriftTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'task_reminder_table_drift';
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
  $TaskReminderTableDriftTable createAlias(String alias) {
    return $TaskReminderTableDriftTable(attachedDatabase, alias);
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

  TaskReminderTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TaskReminderTableDriftCompanion(
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
      TaskReminderTableDriftCompanion data) {
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

class TaskReminderTableDriftCompanion
    extends UpdateCompanion<TaskReminderTableDriftG> {
  final Value<int> id;
  final Value<DateTime> linkingDate;
  final Value<int> taskId;
  final Value<int> reminderId;
  const TaskReminderTableDriftCompanion({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    this.taskId = const Value.absent(),
    this.reminderId = const Value.absent(),
  });
  TaskReminderTableDriftCompanion.insert({
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

  TaskReminderTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? linkingDate,
      Value<int>? taskId,
      Value<int>? reminderId}) {
    return TaskReminderTableDriftCompanion(
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
    return (StringBuffer('TaskReminderTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('reminderId: $reminderId')
          ..write(')'))
        .toString();
  }
}

class $TaskUserTableDriftTable extends TaskUserTableDrift
    with TableInfo<$TaskUserTableDriftTable, TaskUserTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskUserTableDriftTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, linkingDate, taskId, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_user_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<TaskUserTableDriftG> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskUserTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskUserTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      linkingDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}linking_date'])!,
      taskId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $TaskUserTableDriftTable createAlias(String alias) {
    return $TaskUserTableDriftTable(attachedDatabase, alias);
  }
}

class TaskUserTableDriftG extends DataClass
    implements Insertable<TaskUserTableDriftG> {
  final int id;
  final DateTime linkingDate;
  final int taskId;
  final int userId;
  const TaskUserTableDriftG(
      {required this.id,
      required this.linkingDate,
      required this.taskId,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['linking_date'] = Variable<DateTime>(linkingDate);
    map['task_id'] = Variable<int>(taskId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  TaskUserTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TaskUserTableDriftCompanion(
      id: Value(id),
      linkingDate: Value(linkingDate),
      taskId: Value(taskId),
      userId: Value(userId),
    );
  }

  factory TaskUserTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskUserTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      linkingDate: serializer.fromJson<DateTime>(json['linkingDate']),
      taskId: serializer.fromJson<int>(json['taskId']),
      userId: serializer.fromJson<int>(json['userId']),
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
    };
  }

  TaskUserTableDriftG copyWith(
          {int? id, DateTime? linkingDate, int? taskId, int? userId}) =>
      TaskUserTableDriftG(
        id: id ?? this.id,
        linkingDate: linkingDate ?? this.linkingDate,
        taskId: taskId ?? this.taskId,
        userId: userId ?? this.userId,
      );
  TaskUserTableDriftG copyWithCompanion(TaskUserTableDriftCompanion data) {
    return TaskUserTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      linkingDate:
          data.linkingDate.present ? data.linkingDate.value : this.linkingDate,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskUserTableDriftG(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, linkingDate, taskId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskUserTableDriftG &&
          other.id == this.id &&
          other.linkingDate == this.linkingDate &&
          other.taskId == this.taskId &&
          other.userId == this.userId);
}

class TaskUserTableDriftCompanion extends UpdateCompanion<TaskUserTableDriftG> {
  final Value<int> id;
  final Value<DateTime> linkingDate;
  final Value<int> taskId;
  final Value<int> userId;
  const TaskUserTableDriftCompanion({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    this.taskId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  TaskUserTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    required int taskId,
    required int userId,
  })  : taskId = Value(taskId),
        userId = Value(userId);
  static Insertable<TaskUserTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? linkingDate,
    Expression<int>? taskId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkingDate != null) 'linking_date': linkingDate,
      if (taskId != null) 'task_id': taskId,
      if (userId != null) 'user_id': userId,
    });
  }

  TaskUserTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? linkingDate,
      Value<int>? taskId,
      Value<int>? userId}) {
    return TaskUserTableDriftCompanion(
      id: id ?? this.id,
      linkingDate: linkingDate ?? this.linkingDate,
      taskId: taskId ?? this.taskId,
      userId: userId ?? this.userId,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskUserTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('taskId: $taskId, ')
          ..write('userId: $userId')
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
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastAccessedDateMeta =
      const VerificationMeta('lastAccessedDate');
  @override
  late final GeneratedColumn<DateTime> lastAccessedDate =
      GeneratedColumn<DateTime>('last_accessed_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteAccessesMeta =
      const VerificationMeta('remoteAccesses');
  @override
  late final GeneratedColumn<int> remoteAccesses = GeneratedColumn<int>(
      'remote_accesses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accessesMeta =
      const VerificationMeta('accesses');
  @override
  late final GeneratedColumn<int> accesses = GeneratedColumn<int>(
      'accesses', aliasedName, true,
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
  static const VerificationMeta _hashedPasswordMeta =
      const VerificationMeta('hashedPassword');
  @override
  late final GeneratedColumn<String> hashedPassword = GeneratedColumn<String>(
      'hashed_password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdDate,
        creatorId,
        remoteId,
        lastUpdate,
        lastAccessedDate,
        remoteAccesses,
        accesses,
        checksum,
        name,
        hashedPassword,
        email
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
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    } else if (isInserting) {
      context.missing(_creatorIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_accessed_date')) {
      context.handle(
          _lastAccessedDateMeta,
          lastAccessedDate.isAcceptableOrUnknown(
              data['last_accessed_date']!, _lastAccessedDateMeta));
    }
    if (data.containsKey('remote_accesses')) {
      context.handle(
          _remoteAccessesMeta,
          remoteAccesses.isAcceptableOrUnknown(
              data['remote_accesses']!, _remoteAccessesMeta));
    }
    if (data.containsKey('accesses')) {
      context.handle(_accessesMeta,
          accesses.isAcceptableOrUnknown(data['accesses']!, _accessesMeta));
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
    if (data.containsKey('hashed_password')) {
      context.handle(
          _hashedPasswordMeta,
          hashedPassword.isAcceptableOrUnknown(
              data['hashed_password']!, _hashedPasswordMeta));
    } else if (isInserting) {
      context.missing(_hashedPasswordMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
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
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastAccessedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_accessed_date']),
      remoteAccesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_accesses']),
      accesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}accesses']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      hashedPassword: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}hashed_password'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
    );
  }

  @override
  $UserTableDriftTable createAlias(String alias) {
    return $UserTableDriftTable(attachedDatabase, alias);
  }
}

class UserTableDriftG extends DataClass implements Insertable<UserTableDriftG> {
  final int id;
  final DateTime createdDate;
  final int creatorId;
  final int? remoteId;
  final DateTime? lastUpdate;
  final DateTime? lastAccessedDate;
  final int? remoteAccesses;
  final int? accesses;
  final String? checksum;
  final String name;
  final String hashedPassword;
  final String? email;
  const UserTableDriftG(
      {required this.id,
      required this.createdDate,
      required this.creatorId,
      this.remoteId,
      this.lastUpdate,
      this.lastAccessedDate,
      this.remoteAccesses,
      this.accesses,
      this.checksum,
      required this.name,
      required this.hashedPassword,
      this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['creator_id'] = Variable<int>(creatorId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastAccessedDate != null) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate);
    }
    if (!nullToAbsent || remoteAccesses != null) {
      map['remote_accesses'] = Variable<int>(remoteAccesses);
    }
    if (!nullToAbsent || accesses != null) {
      map['accesses'] = Variable<int>(accesses);
    }
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    map['name'] = Variable<String>(name);
    map['hashed_password'] = Variable<String>(hashedPassword);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
  }

  UserTableDriftCompanion toCompanion(bool nullToAbsent) {
    return UserTableDriftCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      creatorId: Value(creatorId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastAccessedDate: lastAccessedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAccessedDate),
      remoteAccesses: remoteAccesses == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteAccesses),
      accesses: accesses == null && nullToAbsent
          ? const Value.absent()
          : Value(accesses),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      name: Value(name),
      hashedPassword: Value(hashedPassword),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory UserTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      creatorId: serializer.fromJson<int>(json['creatorId']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastAccessedDate:
          serializer.fromJson<DateTime?>(json['lastAccessedDate']),
      remoteAccesses: serializer.fromJson<int?>(json['remoteAccesses']),
      accesses: serializer.fromJson<int?>(json['accesses']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      name: serializer.fromJson<String>(json['name']),
      hashedPassword: serializer.fromJson<String>(json['hashedPassword']),
      email: serializer.fromJson<String?>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'creatorId': serializer.toJson<int>(creatorId),
      'remoteId': serializer.toJson<int?>(remoteId),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastAccessedDate': serializer.toJson<DateTime?>(lastAccessedDate),
      'remoteAccesses': serializer.toJson<int?>(remoteAccesses),
      'accesses': serializer.toJson<int?>(accesses),
      'checksum': serializer.toJson<String?>(checksum),
      'name': serializer.toJson<String>(name),
      'hashedPassword': serializer.toJson<String>(hashedPassword),
      'email': serializer.toJson<String?>(email),
    };
  }

  UserTableDriftG copyWith(
          {int? id,
          DateTime? createdDate,
          int? creatorId,
          Value<int?> remoteId = const Value.absent(),
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastAccessedDate = const Value.absent(),
          Value<int?> remoteAccesses = const Value.absent(),
          Value<int?> accesses = const Value.absent(),
          Value<String?> checksum = const Value.absent(),
          String? name,
          String? hashedPassword,
          Value<String?> email = const Value.absent()}) =>
      UserTableDriftG(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        creatorId: creatorId ?? this.creatorId,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastAccessedDate: lastAccessedDate.present
            ? lastAccessedDate.value
            : this.lastAccessedDate,
        remoteAccesses:
            remoteAccesses.present ? remoteAccesses.value : this.remoteAccesses,
        accesses: accesses.present ? accesses.value : this.accesses,
        checksum: checksum.present ? checksum.value : this.checksum,
        name: name ?? this.name,
        hashedPassword: hashedPassword ?? this.hashedPassword,
        email: email.present ? email.value : this.email,
      );
  UserTableDriftG copyWithCompanion(UserTableDriftCompanion data) {
    return UserTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastAccessedDate: data.lastAccessedDate.present
          ? data.lastAccessedDate.value
          : this.lastAccessedDate,
      remoteAccesses: data.remoteAccesses.present
          ? data.remoteAccesses.value
          : this.remoteAccesses,
      accesses: data.accesses.present ? data.accesses.value : this.accesses,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      name: data.name.present ? data.name.value : this.name,
      hashedPassword: data.hashedPassword.present
          ? data.hashedPassword.value
          : this.hashedPassword,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableDriftG(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum, ')
          ..write('name: $name, ')
          ..write('hashedPassword: $hashedPassword, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdDate,
      creatorId,
      remoteId,
      lastUpdate,
      lastAccessedDate,
      remoteAccesses,
      accesses,
      checksum,
      name,
      hashedPassword,
      email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableDriftG &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.creatorId == this.creatorId &&
          other.remoteId == this.remoteId &&
          other.lastUpdate == this.lastUpdate &&
          other.lastAccessedDate == this.lastAccessedDate &&
          other.remoteAccesses == this.remoteAccesses &&
          other.accesses == this.accesses &&
          other.checksum == this.checksum &&
          other.name == this.name &&
          other.hashedPassword == this.hashedPassword &&
          other.email == this.email);
}

class UserTableDriftCompanion extends UpdateCompanion<UserTableDriftG> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<int> creatorId;
  final Value<int?> remoteId;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastAccessedDate;
  final Value<int?> remoteAccesses;
  final Value<int?> accesses;
  final Value<String?> checksum;
  final Value<String> name;
  final Value<String> hashedPassword;
  final Value<String?> email;
  const UserTableDriftCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
    this.name = const Value.absent(),
    this.hashedPassword = const Value.absent(),
    this.email = const Value.absent(),
  });
  UserTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    required int creatorId,
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
    required String name,
    required String hashedPassword,
    this.email = const Value.absent(),
  })  : creatorId = Value(creatorId),
        name = Value(name),
        hashedPassword = Value(hashedPassword);
  static Insertable<UserTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<int>? creatorId,
    Expression<int>? remoteId,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastAccessedDate,
    Expression<int>? remoteAccesses,
    Expression<int>? accesses,
    Expression<String>? checksum,
    Expression<String>? name,
    Expression<String>? hashedPassword,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (creatorId != null) 'creator_id': creatorId,
      if (remoteId != null) 'remote_id': remoteId,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastAccessedDate != null) 'last_accessed_date': lastAccessedDate,
      if (remoteAccesses != null) 'remote_accesses': remoteAccesses,
      if (accesses != null) 'accesses': accesses,
      if (checksum != null) 'checksum': checksum,
      if (name != null) 'name': name,
      if (hashedPassword != null) 'hashed_password': hashedPassword,
      if (email != null) 'email': email,
    });
  }

  UserTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<int>? creatorId,
      Value<int?>? remoteId,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastAccessedDate,
      Value<int?>? remoteAccesses,
      Value<int?>? accesses,
      Value<String?>? checksum,
      Value<String>? name,
      Value<String>? hashedPassword,
      Value<String?>? email}) {
    return UserTableDriftCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastAccessedDate: lastAccessedDate ?? this.lastAccessedDate,
      remoteAccesses: remoteAccesses ?? this.remoteAccesses,
      accesses: accesses ?? this.accesses,
      checksum: checksum ?? this.checksum,
      name: name ?? this.name,
      hashedPassword: hashedPassword ?? this.hashedPassword,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastAccessedDate.present) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate.value);
    }
    if (remoteAccesses.present) {
      map['remote_accesses'] = Variable<int>(remoteAccesses.value);
    }
    if (accesses.present) {
      map['accesses'] = Variable<int>(accesses.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (hashedPassword.present) {
      map['hashed_password'] = Variable<String>(hashedPassword.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum, ')
          ..write('name: $name, ')
          ..write('hashedPassword: $hashedPassword, ')
          ..write('email: $email')
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
  static const VerificationMeta _linkingDateMeta =
      const VerificationMeta('linkingDate');
  @override
  late final GeneratedColumn<DateTime> linkingDate = GeneratedColumn<DateTime>(
      'linking_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES UserTableDrift(id)');
  static const VerificationMeta _userLinkedIdMeta =
      const VerificationMeta('userLinkedId');
  @override
  late final GeneratedColumn<int> userLinkedId = GeneratedColumn<int>(
      'user_linked_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES UserTableDrift(id)');
  @override
  List<GeneratedColumn> get $columns => [id, linkingDate, userId, userLinkedId];
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
    if (data.containsKey('linking_date')) {
      context.handle(
          _linkingDateMeta,
          linkingDate.isAcceptableOrUnknown(
              data['linking_date']!, _linkingDateMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_linked_id')) {
      context.handle(
          _userLinkedIdMeta,
          userLinkedId.isAcceptableOrUnknown(
              data['user_linked_id']!, _userLinkedIdMeta));
    } else if (isInserting) {
      context.missing(_userLinkedIdMeta);
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
      linkingDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}linking_date'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      userLinkedId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_linked_id'])!,
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
  final DateTime linkingDate;
  final int userId;
  final int userLinkedId;
  const UserUserTableDriftG(
      {required this.id,
      required this.linkingDate,
      required this.userId,
      required this.userLinkedId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['linking_date'] = Variable<DateTime>(linkingDate);
    map['user_id'] = Variable<int>(userId);
    map['user_linked_id'] = Variable<int>(userLinkedId);
    return map;
  }

  UserUserTableDriftCompanion toCompanion(bool nullToAbsent) {
    return UserUserTableDriftCompanion(
      id: Value(id),
      linkingDate: Value(linkingDate),
      userId: Value(userId),
      userLinkedId: Value(userLinkedId),
    );
  }

  factory UserUserTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserUserTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      linkingDate: serializer.fromJson<DateTime>(json['linkingDate']),
      userId: serializer.fromJson<int>(json['userId']),
      userLinkedId: serializer.fromJson<int>(json['userLinkedId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'linkingDate': serializer.toJson<DateTime>(linkingDate),
      'userId': serializer.toJson<int>(userId),
      'userLinkedId': serializer.toJson<int>(userLinkedId),
    };
  }

  UserUserTableDriftG copyWith(
          {int? id, DateTime? linkingDate, int? userId, int? userLinkedId}) =>
      UserUserTableDriftG(
        id: id ?? this.id,
        linkingDate: linkingDate ?? this.linkingDate,
        userId: userId ?? this.userId,
        userLinkedId: userLinkedId ?? this.userLinkedId,
      );
  UserUserTableDriftG copyWithCompanion(UserUserTableDriftCompanion data) {
    return UserUserTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      linkingDate:
          data.linkingDate.present ? data.linkingDate.value : this.linkingDate,
      userId: data.userId.present ? data.userId.value : this.userId,
      userLinkedId: data.userLinkedId.present
          ? data.userLinkedId.value
          : this.userLinkedId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserUserTableDriftG(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('userId: $userId, ')
          ..write('userLinkedId: $userLinkedId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, linkingDate, userId, userLinkedId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserUserTableDriftG &&
          other.id == this.id &&
          other.linkingDate == this.linkingDate &&
          other.userId == this.userId &&
          other.userLinkedId == this.userLinkedId);
}

class UserUserTableDriftCompanion extends UpdateCompanion<UserUserTableDriftG> {
  final Value<int> id;
  final Value<DateTime> linkingDate;
  final Value<int> userId;
  final Value<int> userLinkedId;
  const UserUserTableDriftCompanion({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    this.userId = const Value.absent(),
    this.userLinkedId = const Value.absent(),
  });
  UserUserTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.linkingDate = const Value.absent(),
    required int userId,
    required int userLinkedId,
  })  : userId = Value(userId),
        userLinkedId = Value(userLinkedId);
  static Insertable<UserUserTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? linkingDate,
    Expression<int>? userId,
    Expression<int>? userLinkedId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkingDate != null) 'linking_date': linkingDate,
      if (userId != null) 'user_id': userId,
      if (userLinkedId != null) 'user_linked_id': userLinkedId,
    });
  }

  UserUserTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? linkingDate,
      Value<int>? userId,
      Value<int>? userLinkedId}) {
    return UserUserTableDriftCompanion(
      id: id ?? this.id,
      linkingDate: linkingDate ?? this.linkingDate,
      userId: userId ?? this.userId,
      userLinkedId: userLinkedId ?? this.userLinkedId,
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
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (userLinkedId.present) {
      map['user_linked_id'] = Variable<int>(userLinkedId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserUserTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('linkingDate: $linkingDate, ')
          ..write('userId: $userId, ')
          ..write('userLinkedId: $userLinkedId')
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
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastAccessedDateMeta =
      const VerificationMeta('lastAccessedDate');
  @override
  late final GeneratedColumn<DateTime> lastAccessedDate =
      GeneratedColumn<DateTime>('last_accessed_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteAccessesMeta =
      const VerificationMeta('remoteAccesses');
  @override
  late final GeneratedColumn<int> remoteAccesses = GeneratedColumn<int>(
      'remote_accesses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accessesMeta =
      const VerificationMeta('accesses');
  @override
  late final GeneratedColumn<int> accesses = GeneratedColumn<int>(
      'accesses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _checksumMeta =
      const VerificationMeta('checksum');
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
      'checksum', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remindAtMeta =
      const VerificationMeta('remindAt');
  @override
  late final GeneratedColumn<DateTime> remindAt = GeneratedColumn<DateTime>(
      'remind_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdDate,
        creatorId,
        remoteId,
        lastUpdate,
        lastAccessedDate,
        remoteAccesses,
        accesses,
        checksum,
        subject,
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
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    } else if (isInserting) {
      context.missing(_creatorIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_accessed_date')) {
      context.handle(
          _lastAccessedDateMeta,
          lastAccessedDate.isAcceptableOrUnknown(
              data['last_accessed_date']!, _lastAccessedDateMeta));
    }
    if (data.containsKey('remote_accesses')) {
      context.handle(
          _remoteAccessesMeta,
          remoteAccesses.isAcceptableOrUnknown(
              data['remote_accesses']!, _remoteAccessesMeta));
    }
    if (data.containsKey('accesses')) {
      context.handle(_accessesMeta,
          accesses.isAcceptableOrUnknown(data['accesses']!, _accessesMeta));
    }
    if (data.containsKey('checksum')) {
      context.handle(_checksumMeta,
          checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
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
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastAccessedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_accessed_date']),
      remoteAccesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_accesses']),
      accesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}accesses']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
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
  final DateTime createdDate;
  final int creatorId;
  final int? remoteId;
  final DateTime? lastUpdate;
  final DateTime? lastAccessedDate;
  final int? remoteAccesses;
  final int? accesses;
  final String? checksum;
  final String subject;
  final DateTime remindAt;
  const ReminderTableDriftG(
      {required this.id,
      required this.createdDate,
      required this.creatorId,
      this.remoteId,
      this.lastUpdate,
      this.lastAccessedDate,
      this.remoteAccesses,
      this.accesses,
      this.checksum,
      required this.subject,
      required this.remindAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['creator_id'] = Variable<int>(creatorId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastAccessedDate != null) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate);
    }
    if (!nullToAbsent || remoteAccesses != null) {
      map['remote_accesses'] = Variable<int>(remoteAccesses);
    }
    if (!nullToAbsent || accesses != null) {
      map['accesses'] = Variable<int>(accesses);
    }
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    map['subject'] = Variable<String>(subject);
    map['remind_at'] = Variable<DateTime>(remindAt);
    return map;
  }

  ReminderTableDriftCompanion toCompanion(bool nullToAbsent) {
    return ReminderTableDriftCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      creatorId: Value(creatorId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastAccessedDate: lastAccessedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAccessedDate),
      remoteAccesses: remoteAccesses == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteAccesses),
      accesses: accesses == null && nullToAbsent
          ? const Value.absent()
          : Value(accesses),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      subject: Value(subject),
      remindAt: Value(remindAt),
    );
  }

  factory ReminderTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      creatorId: serializer.fromJson<int>(json['creatorId']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastAccessedDate:
          serializer.fromJson<DateTime?>(json['lastAccessedDate']),
      remoteAccesses: serializer.fromJson<int?>(json['remoteAccesses']),
      accesses: serializer.fromJson<int?>(json['accesses']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      subject: serializer.fromJson<String>(json['subject']),
      remindAt: serializer.fromJson<DateTime>(json['remindAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'creatorId': serializer.toJson<int>(creatorId),
      'remoteId': serializer.toJson<int?>(remoteId),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastAccessedDate': serializer.toJson<DateTime?>(lastAccessedDate),
      'remoteAccesses': serializer.toJson<int?>(remoteAccesses),
      'accesses': serializer.toJson<int?>(accesses),
      'checksum': serializer.toJson<String?>(checksum),
      'subject': serializer.toJson<String>(subject),
      'remindAt': serializer.toJson<DateTime>(remindAt),
    };
  }

  ReminderTableDriftG copyWith(
          {int? id,
          DateTime? createdDate,
          int? creatorId,
          Value<int?> remoteId = const Value.absent(),
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastAccessedDate = const Value.absent(),
          Value<int?> remoteAccesses = const Value.absent(),
          Value<int?> accesses = const Value.absent(),
          Value<String?> checksum = const Value.absent(),
          String? subject,
          DateTime? remindAt}) =>
      ReminderTableDriftG(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        creatorId: creatorId ?? this.creatorId,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastAccessedDate: lastAccessedDate.present
            ? lastAccessedDate.value
            : this.lastAccessedDate,
        remoteAccesses:
            remoteAccesses.present ? remoteAccesses.value : this.remoteAccesses,
        accesses: accesses.present ? accesses.value : this.accesses,
        checksum: checksum.present ? checksum.value : this.checksum,
        subject: subject ?? this.subject,
        remindAt: remindAt ?? this.remindAt,
      );
  ReminderTableDriftG copyWithCompanion(ReminderTableDriftCompanion data) {
    return ReminderTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastAccessedDate: data.lastAccessedDate.present
          ? data.lastAccessedDate.value
          : this.lastAccessedDate,
      remoteAccesses: data.remoteAccesses.present
          ? data.remoteAccesses.value
          : this.remoteAccesses,
      accesses: data.accesses.present ? data.accesses.value : this.accesses,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      subject: data.subject.present ? data.subject.value : this.subject,
      remindAt: data.remindAt.present ? data.remindAt.value : this.remindAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTableDriftG(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum, ')
          ..write('subject: $subject, ')
          ..write('remindAt: $remindAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdDate,
      creatorId,
      remoteId,
      lastUpdate,
      lastAccessedDate,
      remoteAccesses,
      accesses,
      checksum,
      subject,
      remindAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderTableDriftG &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.creatorId == this.creatorId &&
          other.remoteId == this.remoteId &&
          other.lastUpdate == this.lastUpdate &&
          other.lastAccessedDate == this.lastAccessedDate &&
          other.remoteAccesses == this.remoteAccesses &&
          other.accesses == this.accesses &&
          other.checksum == this.checksum &&
          other.subject == this.subject &&
          other.remindAt == this.remindAt);
}

class ReminderTableDriftCompanion extends UpdateCompanion<ReminderTableDriftG> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<int> creatorId;
  final Value<int?> remoteId;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastAccessedDate;
  final Value<int?> remoteAccesses;
  final Value<int?> accesses;
  final Value<String?> checksum;
  final Value<String> subject;
  final Value<DateTime> remindAt;
  const ReminderTableDriftCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
    this.subject = const Value.absent(),
    this.remindAt = const Value.absent(),
  });
  ReminderTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    required int creatorId,
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
    required String subject,
    required DateTime remindAt,
  })  : creatorId = Value(creatorId),
        subject = Value(subject),
        remindAt = Value(remindAt);
  static Insertable<ReminderTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<int>? creatorId,
    Expression<int>? remoteId,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastAccessedDate,
    Expression<int>? remoteAccesses,
    Expression<int>? accesses,
    Expression<String>? checksum,
    Expression<String>? subject,
    Expression<DateTime>? remindAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (creatorId != null) 'creator_id': creatorId,
      if (remoteId != null) 'remote_id': remoteId,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastAccessedDate != null) 'last_accessed_date': lastAccessedDate,
      if (remoteAccesses != null) 'remote_accesses': remoteAccesses,
      if (accesses != null) 'accesses': accesses,
      if (checksum != null) 'checksum': checksum,
      if (subject != null) 'subject': subject,
      if (remindAt != null) 'remind_at': remindAt,
    });
  }

  ReminderTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<int>? creatorId,
      Value<int?>? remoteId,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastAccessedDate,
      Value<int?>? remoteAccesses,
      Value<int?>? accesses,
      Value<String?>? checksum,
      Value<String>? subject,
      Value<DateTime>? remindAt}) {
    return ReminderTableDriftCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastAccessedDate: lastAccessedDate ?? this.lastAccessedDate,
      remoteAccesses: remoteAccesses ?? this.remoteAccesses,
      accesses: accesses ?? this.accesses,
      checksum: checksum ?? this.checksum,
      subject: subject ?? this.subject,
      remindAt: remindAt ?? this.remindAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastAccessedDate.present) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate.value);
    }
    if (remoteAccesses.present) {
      map['remote_accesses'] = Variable<int>(remoteAccesses.value);
    }
    if (accesses.present) {
      map['accesses'] = Variable<int>(accesses.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
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
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum, ')
          ..write('subject: $subject, ')
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
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _creatorIdMeta =
      const VerificationMeta('creatorId');
  @override
  late final GeneratedColumn<int> creatorId = GeneratedColumn<int>(
      'creator_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdateMeta =
      const VerificationMeta('lastUpdate');
  @override
  late final GeneratedColumn<DateTime> lastUpdate = GeneratedColumn<DateTime>(
      'last_update', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastAccessedDateMeta =
      const VerificationMeta('lastAccessedDate');
  @override
  late final GeneratedColumn<DateTime> lastAccessedDate =
      GeneratedColumn<DateTime>('last_accessed_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _remoteAccessesMeta =
      const VerificationMeta('remoteAccesses');
  @override
  late final GeneratedColumn<int> remoteAccesses = GeneratedColumn<int>(
      'remote_accesses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accessesMeta =
      const VerificationMeta('accesses');
  @override
  late final GeneratedColumn<int> accesses = GeneratedColumn<int>(
      'accesses', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _checksumMeta =
      const VerificationMeta('checksum');
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
      'checksum', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdDate,
        creatorId,
        remoteId,
        lastUpdate,
        lastAccessedDate,
        remoteAccesses,
        accesses,
        checksum,
        subject
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
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
    } else if (isInserting) {
      context.missing(_creatorIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('last_update')) {
      context.handle(
          _lastUpdateMeta,
          lastUpdate.isAcceptableOrUnknown(
              data['last_update']!, _lastUpdateMeta));
    }
    if (data.containsKey('last_accessed_date')) {
      context.handle(
          _lastAccessedDateMeta,
          lastAccessedDate.isAcceptableOrUnknown(
              data['last_accessed_date']!, _lastAccessedDateMeta));
    }
    if (data.containsKey('remote_accesses')) {
      context.handle(
          _remoteAccessesMeta,
          remoteAccesses.isAcceptableOrUnknown(
              data['remote_accesses']!, _remoteAccessesMeta));
    }
    if (data.containsKey('accesses')) {
      context.handle(_accessesMeta,
          accesses.isAcceptableOrUnknown(data['accesses']!, _accessesMeta));
    }
    if (data.containsKey('checksum')) {
      context.handle(_checksumMeta,
          checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
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
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      creatorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
      lastUpdate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_update']),
      lastAccessedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_accessed_date']),
      remoteAccesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_accesses']),
      accesses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}accesses']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum']),
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
    );
  }

  @override
  $TagTableDriftTable createAlias(String alias) {
    return $TagTableDriftTable(attachedDatabase, alias);
  }
}

class TagTableDriftG extends DataClass implements Insertable<TagTableDriftG> {
  final int id;
  final DateTime createdDate;
  final int creatorId;
  final int? remoteId;
  final DateTime? lastUpdate;
  final DateTime? lastAccessedDate;
  final int? remoteAccesses;
  final int? accesses;
  final String? checksum;
  final String subject;
  const TagTableDriftG(
      {required this.id,
      required this.createdDate,
      required this.creatorId,
      this.remoteId,
      this.lastUpdate,
      this.lastAccessedDate,
      this.remoteAccesses,
      this.accesses,
      this.checksum,
      required this.subject});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['creator_id'] = Variable<int>(creatorId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
    if (!nullToAbsent || lastUpdate != null) {
      map['last_update'] = Variable<DateTime>(lastUpdate);
    }
    if (!nullToAbsent || lastAccessedDate != null) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate);
    }
    if (!nullToAbsent || remoteAccesses != null) {
      map['remote_accesses'] = Variable<int>(remoteAccesses);
    }
    if (!nullToAbsent || accesses != null) {
      map['accesses'] = Variable<int>(accesses);
    }
    if (!nullToAbsent || checksum != null) {
      map['checksum'] = Variable<String>(checksum);
    }
    map['subject'] = Variable<String>(subject);
    return map;
  }

  TagTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TagTableDriftCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      creatorId: Value(creatorId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      lastUpdate: lastUpdate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdate),
      lastAccessedDate: lastAccessedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAccessedDate),
      remoteAccesses: remoteAccesses == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteAccesses),
      accesses: accesses == null && nullToAbsent
          ? const Value.absent()
          : Value(accesses),
      checksum: checksum == null && nullToAbsent
          ? const Value.absent()
          : Value(checksum),
      subject: Value(subject),
    );
  }

  factory TagTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      creatorId: serializer.fromJson<int>(json['creatorId']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastAccessedDate:
          serializer.fromJson<DateTime?>(json['lastAccessedDate']),
      remoteAccesses: serializer.fromJson<int?>(json['remoteAccesses']),
      accesses: serializer.fromJson<int?>(json['accesses']),
      checksum: serializer.fromJson<String?>(json['checksum']),
      subject: serializer.fromJson<String>(json['subject']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'creatorId': serializer.toJson<int>(creatorId),
      'remoteId': serializer.toJson<int?>(remoteId),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastAccessedDate': serializer.toJson<DateTime?>(lastAccessedDate),
      'remoteAccesses': serializer.toJson<int?>(remoteAccesses),
      'accesses': serializer.toJson<int?>(accesses),
      'checksum': serializer.toJson<String?>(checksum),
      'subject': serializer.toJson<String>(subject),
    };
  }

  TagTableDriftG copyWith(
          {int? id,
          DateTime? createdDate,
          int? creatorId,
          Value<int?> remoteId = const Value.absent(),
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastAccessedDate = const Value.absent(),
          Value<int?> remoteAccesses = const Value.absent(),
          Value<int?> accesses = const Value.absent(),
          Value<String?> checksum = const Value.absent(),
          String? subject}) =>
      TagTableDriftG(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        creatorId: creatorId ?? this.creatorId,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastAccessedDate: lastAccessedDate.present
            ? lastAccessedDate.value
            : this.lastAccessedDate,
        remoteAccesses:
            remoteAccesses.present ? remoteAccesses.value : this.remoteAccesses,
        accesses: accesses.present ? accesses.value : this.accesses,
        checksum: checksum.present ? checksum.value : this.checksum,
        subject: subject ?? this.subject,
      );
  TagTableDriftG copyWithCompanion(TagTableDriftCompanion data) {
    return TagTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      creatorId: data.creatorId.present ? data.creatorId.value : this.creatorId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      lastUpdate:
          data.lastUpdate.present ? data.lastUpdate.value : this.lastUpdate,
      lastAccessedDate: data.lastAccessedDate.present
          ? data.lastAccessedDate.value
          : this.lastAccessedDate,
      remoteAccesses: data.remoteAccesses.present
          ? data.remoteAccesses.value
          : this.remoteAccesses,
      accesses: data.accesses.present ? data.accesses.value : this.accesses,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      subject: data.subject.present ? data.subject.value : this.subject,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TagTableDriftG(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum, ')
          ..write('subject: $subject')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdDate,
      creatorId,
      remoteId,
      lastUpdate,
      lastAccessedDate,
      remoteAccesses,
      accesses,
      checksum,
      subject);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagTableDriftG &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.creatorId == this.creatorId &&
          other.remoteId == this.remoteId &&
          other.lastUpdate == this.lastUpdate &&
          other.lastAccessedDate == this.lastAccessedDate &&
          other.remoteAccesses == this.remoteAccesses &&
          other.accesses == this.accesses &&
          other.checksum == this.checksum &&
          other.subject == this.subject);
}

class TagTableDriftCompanion extends UpdateCompanion<TagTableDriftG> {
  final Value<int> id;
  final Value<DateTime> createdDate;
  final Value<int> creatorId;
  final Value<int?> remoteId;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastAccessedDate;
  final Value<int?> remoteAccesses;
  final Value<int?> accesses;
  final Value<String?> checksum;
  final Value<String> subject;
  const TagTableDriftCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
    this.subject = const Value.absent(),
  });
  TagTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    required int creatorId,
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastAccessedDate = const Value.absent(),
    this.remoteAccesses = const Value.absent(),
    this.accesses = const Value.absent(),
    this.checksum = const Value.absent(),
    required String subject,
  })  : creatorId = Value(creatorId),
        subject = Value(subject);
  static Insertable<TagTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? createdDate,
    Expression<int>? creatorId,
    Expression<int>? remoteId,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastAccessedDate,
    Expression<int>? remoteAccesses,
    Expression<int>? accesses,
    Expression<String>? checksum,
    Expression<String>? subject,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (creatorId != null) 'creator_id': creatorId,
      if (remoteId != null) 'remote_id': remoteId,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastAccessedDate != null) 'last_accessed_date': lastAccessedDate,
      if (remoteAccesses != null) 'remote_accesses': remoteAccesses,
      if (accesses != null) 'accesses': accesses,
      if (checksum != null) 'checksum': checksum,
      if (subject != null) 'subject': subject,
    });
  }

  TagTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdDate,
      Value<int>? creatorId,
      Value<int?>? remoteId,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastAccessedDate,
      Value<int?>? remoteAccesses,
      Value<int?>? accesses,
      Value<String?>? checksum,
      Value<String>? subject}) {
    return TagTableDriftCompanion(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastAccessedDate: lastAccessedDate ?? this.lastAccessedDate,
      remoteAccesses: remoteAccesses ?? this.remoteAccesses,
      accesses: accesses ?? this.accesses,
      checksum: checksum ?? this.checksum,
      subject: subject ?? this.subject,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<int>(creatorId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (lastUpdate.present) {
      map['last_update'] = Variable<DateTime>(lastUpdate.value);
    }
    if (lastAccessedDate.present) {
      map['last_accessed_date'] = Variable<DateTime>(lastAccessedDate.value);
    }
    if (remoteAccesses.present) {
      map['remote_accesses'] = Variable<int>(remoteAccesses.value);
    }
    if (accesses.present) {
      map['accesses'] = Variable<int>(accesses.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('creatorId: $creatorId, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastAccessedDate: $lastAccessedDate, ')
          ..write('remoteAccesses: $remoteAccesses, ')
          ..write('accesses: $accesses, ')
          ..write('checksum: $checksum, ')
          ..write('subject: $subject')
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
  late final $TaskTagTableDriftTable taskTagTableDrift =
      $TaskTagTableDriftTable(this);
  late final $TaskReminderTableDriftTable taskReminderTableDrift =
      $TaskReminderTableDriftTable(this);
  late final $TaskUserTableDriftTable taskUserTableDrift =
      $TaskUserTableDriftTable(this);
  late final $UserTableDriftTable userTableDrift = $UserTableDriftTable(this);
  late final $UserUserTableDriftTable userUserTableDrift =
      $UserUserTableDriftTable(this);
  late final $ReminderTableDriftTable reminderTableDrift =
      $ReminderTableDriftTable(this);
  late final $TagTableDriftTable tagTableDrift = $TagTableDriftTable(this);
  late final OrganizerItemDaoDrift organizerItemDaoDrift =
      OrganizerItemDaoDrift(this as OrganizerDriftDB);
  late final TaskDaoDrift taskDaoDrift = TaskDaoDrift(this as OrganizerDriftDB);
  late final TaskTagDaoDrift taskTagDaoDrift =
      TaskTagDaoDrift(this as OrganizerDriftDB);
  late final TaskReminderDaoDrift taskReminderDaoDrift =
      TaskReminderDaoDrift(this as OrganizerDriftDB);
  late final TaskUserDaoDrift taskUserDaoDrift =
      TaskUserDaoDrift(this as OrganizerDriftDB);
  late final UserDaoDrift userDaoDrift = UserDaoDrift(this as OrganizerDriftDB);
  late final UserUserDaoDrift userUserDaoDrift =
      UserUserDaoDrift(this as OrganizerDriftDB);
  late final ReminderDaoDrift reminderDaoDrift =
      ReminderDaoDrift(this as OrganizerDriftDB);
  late final TagDaoDrift tagDaoDrift = TagDaoDrift(this as OrganizerDriftDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        organizerItemTableDrift,
        taskTableDrift,
        taskTagTableDrift,
        taskReminderTableDrift,
        taskUserTableDrift,
        userTableDrift,
        userUserTableDrift,
        reminderTableDrift,
        tagTableDrift
      ];
}

typedef $$OrganizerItemTableDriftTableCreateCompanionBuilder
    = OrganizerItemTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> createdDate,
  required int creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
});
typedef $$OrganizerItemTableDriftTableUpdateCompanionBuilder
    = OrganizerItemTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<int> creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
});

class $$OrganizerItemTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $OrganizerItemTableDriftTable,
    OrganizerItemTableDriftG,
    $$OrganizerItemTableDriftTableFilterComposer,
    $$OrganizerItemTableDriftTableOrderingComposer,
    $$OrganizerItemTableDriftTableCreateCompanionBuilder,
    $$OrganizerItemTableDriftTableUpdateCompanionBuilder> {
  $$OrganizerItemTableDriftTableTableManager(
      _$OrganizerDriftDB db, $OrganizerItemTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$OrganizerItemTableDriftTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$OrganizerItemTableDriftTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<int> creatorId = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
          }) =>
              OrganizerItemTableDriftCompanion(
            id: id,
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            required int creatorId,
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
          }) =>
              OrganizerItemTableDriftCompanion.insert(
            id: id,
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
          ),
        ));
}

class $$OrganizerItemTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $OrganizerItemTableDriftTable> {
  $$OrganizerItemTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnFilters<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$OrganizerItemTableDriftTableOrderingComposer extends OrderingComposer<
    _$OrganizerDriftDB, $OrganizerItemTableDriftTable> {
  $$OrganizerItemTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnOrderings<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TaskTableDriftTableCreateCompanionBuilder = TaskTableDriftCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  required int creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
  required String subject,
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
  Value<DateTime> createdDate,
  Value<int> creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
  Value<String> subject,
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
    $$TaskTableDriftTableCreateCompanionBuilder,
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
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<int> creatorId = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<String> subject = const Value.absent(),
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
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
            subject: subject,
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
            Value<DateTime> createdDate = const Value.absent(),
            required int creatorId,
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            required String subject,
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
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
            subject: subject,
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

class $$TaskTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $TaskTableDriftTable> {
  $$TaskTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnFilters<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
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

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnOrderings<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
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

typedef $$TaskTagTableDriftTableCreateCompanionBuilder
    = TaskTagTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  required int taskId,
  required int tagId,
});
typedef $$TaskTagTableDriftTableUpdateCompanionBuilder
    = TaskTagTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  Value<int> taskId,
  Value<int> tagId,
});

class $$TaskTagTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskTagTableDriftTable,
    TaskTagTableDriftG,
    $$TaskTagTableDriftTableFilterComposer,
    $$TaskTagTableDriftTableOrderingComposer,
    $$TaskTagTableDriftTableCreateCompanionBuilder,
    $$TaskTagTableDriftTableUpdateCompanionBuilder> {
  $$TaskTagTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TaskTagTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaskTagTableDriftTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$TaskTagTableDriftTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            Value<int> taskId = const Value.absent(),
            Value<int> tagId = const Value.absent(),
          }) =>
              TaskTagTableDriftCompanion(
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
              TaskTagTableDriftCompanion.insert(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            tagId: tagId,
          ),
        ));
}

class $$TaskTagTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $TaskTagTableDriftTable> {
  $$TaskTagTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get linkingDate => $state.composableBuilder(
      column: $state.table.linkingDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get taskId => $state.composableBuilder(
      column: $state.table.taskId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get tagId => $state.composableBuilder(
      column: $state.table.tagId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskTagTableDriftTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $TaskTagTableDriftTable> {
  $$TaskTagTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get linkingDate => $state.composableBuilder(
      column: $state.table.linkingDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get taskId => $state.composableBuilder(
      column: $state.table.taskId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get tagId => $state.composableBuilder(
      column: $state.table.tagId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TaskReminderTableDriftTableCreateCompanionBuilder
    = TaskReminderTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  required int taskId,
  required int reminderId,
});
typedef $$TaskReminderTableDriftTableUpdateCompanionBuilder
    = TaskReminderTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  Value<int> taskId,
  Value<int> reminderId,
});

class $$TaskReminderTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskReminderTableDriftTable,
    TaskReminderTableDriftG,
    $$TaskReminderTableDriftTableFilterComposer,
    $$TaskReminderTableDriftTableOrderingComposer,
    $$TaskReminderTableDriftTableCreateCompanionBuilder,
    $$TaskReminderTableDriftTableUpdateCompanionBuilder> {
  $$TaskReminderTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TaskReminderTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$TaskReminderTableDriftTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$TaskReminderTableDriftTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            Value<int> taskId = const Value.absent(),
            Value<int> reminderId = const Value.absent(),
          }) =>
              TaskReminderTableDriftCompanion(
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
              TaskReminderTableDriftCompanion.insert(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            reminderId: reminderId,
          ),
        ));
}

class $$TaskReminderTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $TaskReminderTableDriftTable> {
  $$TaskReminderTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get linkingDate => $state.composableBuilder(
      column: $state.table.linkingDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get taskId => $state.composableBuilder(
      column: $state.table.taskId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get reminderId => $state.composableBuilder(
      column: $state.table.reminderId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskReminderTableDriftTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $TaskReminderTableDriftTable> {
  $$TaskReminderTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get linkingDate => $state.composableBuilder(
      column: $state.table.linkingDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get taskId => $state.composableBuilder(
      column: $state.table.taskId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get reminderId => $state.composableBuilder(
      column: $state.table.reminderId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TaskUserTableDriftTableCreateCompanionBuilder
    = TaskUserTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  required int taskId,
  required int userId,
});
typedef $$TaskUserTableDriftTableUpdateCompanionBuilder
    = TaskUserTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  Value<int> taskId,
  Value<int> userId,
});

class $$TaskUserTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TaskUserTableDriftTable,
    TaskUserTableDriftG,
    $$TaskUserTableDriftTableFilterComposer,
    $$TaskUserTableDriftTableOrderingComposer,
    $$TaskUserTableDriftTableCreateCompanionBuilder,
    $$TaskUserTableDriftTableUpdateCompanionBuilder> {
  $$TaskUserTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TaskUserTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TaskUserTableDriftTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$TaskUserTableDriftTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            Value<int> taskId = const Value.absent(),
            Value<int> userId = const Value.absent(),
          }) =>
              TaskUserTableDriftCompanion(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            userId: userId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            required int taskId,
            required int userId,
          }) =>
              TaskUserTableDriftCompanion.insert(
            id: id,
            linkingDate: linkingDate,
            taskId: taskId,
            userId: userId,
          ),
        ));
}

class $$TaskUserTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $TaskUserTableDriftTable> {
  $$TaskUserTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get linkingDate => $state.composableBuilder(
      column: $state.table.linkingDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get taskId => $state.composableBuilder(
      column: $state.table.taskId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskUserTableDriftTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $TaskUserTableDriftTable> {
  $$TaskUserTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get linkingDate => $state.composableBuilder(
      column: $state.table.linkingDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get taskId => $state.composableBuilder(
      column: $state.table.taskId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UserTableDriftTableCreateCompanionBuilder = UserTableDriftCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  required int creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
  required String name,
  required String hashedPassword,
  Value<String?> email,
});
typedef $$UserTableDriftTableUpdateCompanionBuilder = UserTableDriftCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<int> creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
  Value<String> name,
  Value<String> hashedPassword,
  Value<String?> email,
});

class $$UserTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $UserTableDriftTable,
    UserTableDriftG,
    $$UserTableDriftTableFilterComposer,
    $$UserTableDriftTableOrderingComposer,
    $$UserTableDriftTableCreateCompanionBuilder,
    $$UserTableDriftTableUpdateCompanionBuilder> {
  $$UserTableDriftTableTableManager(
      _$OrganizerDriftDB db, $UserTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserTableDriftTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserTableDriftTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<int> creatorId = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> hashedPassword = const Value.absent(),
            Value<String?> email = const Value.absent(),
          }) =>
              UserTableDriftCompanion(
            id: id,
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
            name: name,
            hashedPassword: hashedPassword,
            email: email,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            required int creatorId,
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            required String name,
            required String hashedPassword,
            Value<String?> email = const Value.absent(),
          }) =>
              UserTableDriftCompanion.insert(
            id: id,
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
            name: name,
            hashedPassword: hashedPassword,
            email: email,
          ),
        ));
}

class $$UserTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $UserTableDriftTable> {
  $$UserTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnFilters<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hashedPassword => $state.composableBuilder(
      column: $state.table.hashedPassword,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserTableDriftTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $UserTableDriftTable> {
  $$UserTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnOrderings<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hashedPassword => $state.composableBuilder(
      column: $state.table.hashedPassword,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UserUserTableDriftTableCreateCompanionBuilder
    = UserUserTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  required int userId,
  required int userLinkedId,
});
typedef $$UserUserTableDriftTableUpdateCompanionBuilder
    = UserUserTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> linkingDate,
  Value<int> userId,
  Value<int> userLinkedId,
});

class $$UserUserTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $UserUserTableDriftTable,
    UserUserTableDriftG,
    $$UserUserTableDriftTableFilterComposer,
    $$UserUserTableDriftTableOrderingComposer,
    $$UserUserTableDriftTableCreateCompanionBuilder,
    $$UserUserTableDriftTableUpdateCompanionBuilder> {
  $$UserUserTableDriftTableTableManager(
      _$OrganizerDriftDB db, $UserUserTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserUserTableDriftTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$UserUserTableDriftTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<int> userLinkedId = const Value.absent(),
          }) =>
              UserUserTableDriftCompanion(
            id: id,
            linkingDate: linkingDate,
            userId: userId,
            userLinkedId: userLinkedId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> linkingDate = const Value.absent(),
            required int userId,
            required int userLinkedId,
          }) =>
              UserUserTableDriftCompanion.insert(
            id: id,
            linkingDate: linkingDate,
            userId: userId,
            userLinkedId: userLinkedId,
          ),
        ));
}

class $$UserUserTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $UserUserTableDriftTable> {
  $$UserUserTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get linkingDate => $state.composableBuilder(
      column: $state.table.linkingDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userLinkedId => $state.composableBuilder(
      column: $state.table.userLinkedId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserUserTableDriftTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $UserUserTableDriftTable> {
  $$UserUserTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get linkingDate => $state.composableBuilder(
      column: $state.table.linkingDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userLinkedId => $state.composableBuilder(
      column: $state.table.userLinkedId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ReminderTableDriftTableCreateCompanionBuilder
    = ReminderTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> createdDate,
  required int creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
  required String subject,
  required DateTime remindAt,
});
typedef $$ReminderTableDriftTableUpdateCompanionBuilder
    = ReminderTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<int> creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
  Value<String> subject,
  Value<DateTime> remindAt,
});

class $$ReminderTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $ReminderTableDriftTable,
    ReminderTableDriftG,
    $$ReminderTableDriftTableFilterComposer,
    $$ReminderTableDriftTableOrderingComposer,
    $$ReminderTableDriftTableCreateCompanionBuilder,
    $$ReminderTableDriftTableUpdateCompanionBuilder> {
  $$ReminderTableDriftTableTableManager(
      _$OrganizerDriftDB db, $ReminderTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ReminderTableDriftTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$ReminderTableDriftTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<int> creatorId = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<DateTime> remindAt = const Value.absent(),
          }) =>
              ReminderTableDriftCompanion(
            id: id,
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
            subject: subject,
            remindAt: remindAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            required int creatorId,
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            required String subject,
            required DateTime remindAt,
          }) =>
              ReminderTableDriftCompanion.insert(
            id: id,
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
            subject: subject,
            remindAt: remindAt,
          ),
        ));
}

class $$ReminderTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $ReminderTableDriftTable> {
  $$ReminderTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnFilters<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get remindAt => $state.composableBuilder(
      column: $state.table.remindAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ReminderTableDriftTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $ReminderTableDriftTable> {
  $$ReminderTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnOrderings<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get remindAt => $state.composableBuilder(
      column: $state.table.remindAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TagTableDriftTableCreateCompanionBuilder = TagTableDriftCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  required int creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
  required String subject,
});
typedef $$TagTableDriftTableUpdateCompanionBuilder = TagTableDriftCompanion
    Function({
  Value<int> id,
  Value<DateTime> createdDate,
  Value<int> creatorId,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastAccessedDate,
  Value<int?> remoteAccesses,
  Value<int?> accesses,
  Value<String?> checksum,
  Value<String> subject,
});

class $$TagTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TagTableDriftTable,
    TagTableDriftG,
    $$TagTableDriftTableFilterComposer,
    $$TagTableDriftTableOrderingComposer,
    $$TagTableDriftTableCreateCompanionBuilder,
    $$TagTableDriftTableUpdateCompanionBuilder> {
  $$TagTableDriftTableTableManager(
      _$OrganizerDriftDB db, $TagTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TagTableDriftTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TagTableDriftTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<int> creatorId = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            Value<String> subject = const Value.absent(),
          }) =>
              TagTableDriftCompanion(
            id: id,
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
            subject: subject,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            required int creatorId,
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastAccessedDate = const Value.absent(),
            Value<int?> remoteAccesses = const Value.absent(),
            Value<int?> accesses = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
            required String subject,
          }) =>
              TagTableDriftCompanion.insert(
            id: id,
            createdDate: createdDate,
            creatorId: creatorId,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastAccessedDate: lastAccessedDate,
            remoteAccesses: remoteAccesses,
            accesses: accesses,
            checksum: checksum,
            subject: subject,
          ),
        ));
}

class $$TagTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $TagTableDriftTable> {
  $$TagTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnFilters<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TagTableDriftTableOrderingComposer
    extends OrderingComposer<_$OrganizerDriftDB, $TagTableDriftTable> {
  $$TagTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get creatorId => $state.composableBuilder(
      column: $state.table.creatorId,
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

  ColumnOrderings<DateTime> get lastAccessedDate => $state.composableBuilder(
      column: $state.table.lastAccessedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get remoteAccesses => $state.composableBuilder(
      column: $state.table.remoteAccesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get accesses => $state.composableBuilder(
      column: $state.table.accesses,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get checksum => $state.composableBuilder(
      column: $state.table.checksum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subject => $state.composableBuilder(
      column: $state.table.subject,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $OrganizerDriftDBManager {
  final _$OrganizerDriftDB _db;
  $OrganizerDriftDBManager(this._db);
  $$OrganizerItemTableDriftTableTableManager get organizerItemTableDrift =>
      $$OrganizerItemTableDriftTableTableManager(
          _db, _db.organizerItemTableDrift);
  $$TaskTableDriftTableTableManager get taskTableDrift =>
      $$TaskTableDriftTableTableManager(_db, _db.taskTableDrift);
  $$TaskTagTableDriftTableTableManager get taskTagTableDrift =>
      $$TaskTagTableDriftTableTableManager(_db, _db.taskTagTableDrift);
  $$TaskReminderTableDriftTableTableManager get taskReminderTableDrift =>
      $$TaskReminderTableDriftTableTableManager(
          _db, _db.taskReminderTableDrift);
  $$TaskUserTableDriftTableTableManager get taskUserTableDrift =>
      $$TaskUserTableDriftTableTableManager(_db, _db.taskUserTableDrift);
  $$UserTableDriftTableTableManager get userTableDrift =>
      $$UserTableDriftTableTableManager(_db, _db.userTableDrift);
  $$UserUserTableDriftTableTableManager get userUserTableDrift =>
      $$UserUserTableDriftTableTableManager(_db, _db.userUserTableDrift);
  $$ReminderTableDriftTableTableManager get reminderTableDrift =>
      $$ReminderTableDriftTableTableManager(_db, _db.reminderTableDrift);
  $$TagTableDriftTableTableManager get tagTableDrift =>
      $$TagTableDriftTableTableManager(_db, _db.tagTableDrift);
}
