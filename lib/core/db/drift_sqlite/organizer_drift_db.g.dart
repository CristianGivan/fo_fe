// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_drift_db.dart';

// ignore_for_file: type=lint
class $TaskTableDriftTable extends TaskTableDrift
    with TableInfo<$TaskTableDriftTable, TaskEntity> {
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
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _taskStatusMeta =
      const VerificationMeta('taskStatus');
  @override
  late final GeneratedColumn<String> taskStatus = GeneratedColumn<String>(
      'task_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, subject, createdDate, taskStatus];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_table_drift';
  @override
  VerificationContext validateIntegrity(Insertable<TaskEntity> instance,
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
  TaskEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      taskStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task_status']),
    );
  }

  @override
  $TaskTableDriftTable createAlias(String alias) {
    return $TaskTableDriftTable(attachedDatabase, alias);
  }
}

class TaskEntity extends DataClass implements Insertable<TaskEntity> {
  final int id;
  final String subject;
  final DateTime createdDate;
  final String? taskStatus;
  const TaskEntity(
      {required this.id,
      required this.subject,
      required this.createdDate,
      this.taskStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject'] = Variable<String>(subject);
    map['created_date'] = Variable<DateTime>(createdDate);
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
      taskStatus: taskStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(taskStatus),
    );
  }

  factory TaskEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskEntity(
      id: serializer.fromJson<int>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
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
      'taskStatus': serializer.toJson<String?>(taskStatus),
    };
  }

  TaskEntity copyWith(
          {int? id,
          String? subject,
          DateTime? createdDate,
          Value<String?> taskStatus = const Value.absent()}) =>
      TaskEntity(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        createdDate: createdDate ?? this.createdDate,
        taskStatus: taskStatus.present ? taskStatus.value : this.taskStatus,
      );
  @override
  String toString() {
    return (StringBuffer('TaskEntity(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('taskStatus: $taskStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subject, createdDate, taskStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskEntity &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate &&
          other.taskStatus == this.taskStatus);
}

class TaskTableDriftCompanion extends UpdateCompanion<TaskEntity> {
  final Value<int> id;
  final Value<String> subject;
  final Value<DateTime> createdDate;
  final Value<String?> taskStatus;
  const TaskTableDriftCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.taskStatus = const Value.absent(),
  });
  TaskTableDriftCompanion.insert({
    this.id = const Value.absent(),
    required String subject,
    required DateTime createdDate,
    this.taskStatus = const Value.absent(),
  })  : subject = Value(subject),
        createdDate = Value(createdDate);
  static Insertable<TaskEntity> custom({
    Expression<int>? id,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<String>? taskStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
      if (taskStatus != null) 'task_status': taskStatus,
    });
  }

  TaskTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<String>? subject,
      Value<DateTime>? createdDate,
      Value<String?>? taskStatus}) {
    return TaskTableDriftCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
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
          ..write('taskStatus: $taskStatus')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftDBOrganizer extends GeneratedDatabase {
  _$DriftDBOrganizer(QueryExecutor e) : super(e);
  _$DriftDBOrganizerManager get managers => _$DriftDBOrganizerManager(this);
  late final $TaskTableDriftTable taskTableDrift = $TaskTableDriftTable(this);
  late final TaskDaoDrift taskDaoDrift = TaskDaoDrift(this as DriftDBOrganizer);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskTableDrift];
}

typedef $$TaskTableDriftTableInsertCompanionBuilder = TaskTableDriftCompanion
    Function({
  Value<int> id,
  required String subject,
  required DateTime createdDate,
  Value<String?> taskStatus,
});
typedef $$TaskTableDriftTableUpdateCompanionBuilder = TaskTableDriftCompanion
    Function({
  Value<int> id,
  Value<String> subject,
  Value<DateTime> createdDate,
  Value<String?> taskStatus,
});

class $$TaskTableDriftTableTableManager extends RootTableManager<
    _$DriftDBOrganizer,
    $TaskTableDriftTable,
    TaskEntity,
    $$TaskTableDriftTableFilterComposer,
    $$TaskTableDriftTableOrderingComposer,
    $$TaskTableDriftTableProcessedTableManager,
    $$TaskTableDriftTableInsertCompanionBuilder,
    $$TaskTableDriftTableUpdateCompanionBuilder> {
  $$TaskTableDriftTableTableManager(
      _$DriftDBOrganizer db, $TaskTableDriftTable table)
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
            Value<String?> taskStatus = const Value.absent(),
          }) =>
              TaskTableDriftCompanion(
            id: id,
            subject: subject,
            createdDate: createdDate,
            taskStatus: taskStatus,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String subject,
            required DateTime createdDate,
            Value<String?> taskStatus = const Value.absent(),
          }) =>
              TaskTableDriftCompanion.insert(
            id: id,
            subject: subject,
            createdDate: createdDate,
            taskStatus: taskStatus,
          ),
        ));
}

class $$TaskTableDriftTableProcessedTableManager extends ProcessedTableManager<
    _$DriftDBOrganizer,
    $TaskTableDriftTable,
    TaskEntity,
    $$TaskTableDriftTableFilterComposer,
    $$TaskTableDriftTableOrderingComposer,
    $$TaskTableDriftTableProcessedTableManager,
    $$TaskTableDriftTableInsertCompanionBuilder,
    $$TaskTableDriftTableUpdateCompanionBuilder> {
  $$TaskTableDriftTableProcessedTableManager(super.$state);
}

class $$TaskTableDriftTableFilterComposer
    extends FilterComposer<_$DriftDBOrganizer, $TaskTableDriftTable> {
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

  ColumnFilters<String> get taskStatus => $state.composableBuilder(
      column: $state.table.taskStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TaskTableDriftTableOrderingComposer
    extends OrderingComposer<_$DriftDBOrganizer, $TaskTableDriftTable> {
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

  ColumnOrderings<String> get taskStatus => $state.composableBuilder(
      column: $state.table.taskStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$DriftDBOrganizerManager {
  final _$DriftDBOrganizer _db;
  _$DriftDBOrganizerManager(this._db);
  $$TaskTableDriftTableTableManager get taskTableDrift =>
      $$TaskTableDriftTableTableManager(_db, _db.taskTableDrift);
}
