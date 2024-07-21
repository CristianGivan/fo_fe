// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_drift_db.dart';

// ignore_for_file: type=lint
class $AuthenticationTableDriftTable extends AuthenticationTableDrift
    with TableInfo<$AuthenticationTableDriftTable, AuthenticationTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuthenticationTableDriftTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceInfoMeta =
      const VerificationMeta('deviceInfo');
  @override
  late final GeneratedColumn<String> deviceInfo = GeneratedColumn<String>(
      'device_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expiredDateMeta =
      const VerificationMeta('expiredDate');
  @override
  late final GeneratedColumn<DateTime> expiredDate = GeneratedColumn<DateTime>(
      'expired_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastUsedDateMeta =
      const VerificationMeta('lastUsedDate');
  @override
  late final GeneratedColumn<DateTime> lastUsedDate = GeneratedColumn<DateTime>(
      'last_used_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _refreshCountMeta =
      const VerificationMeta('refreshCount');
  @override
  late final GeneratedColumn<int> refreshCount = GeneratedColumn<int>(
      'refresh_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        token,
        deviceInfo,
        createdDate,
        expiredDate,
        lastUsedDate,
        refreshCount,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'authentication_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<AuthenticationTableDriftG> instance,
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
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('device_info')) {
      context.handle(
          _deviceInfoMeta,
          deviceInfo.isAcceptableOrUnknown(
              data['device_info']!, _deviceInfoMeta));
    } else if (isInserting) {
      context.missing(_deviceInfoMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('expired_date')) {
      context.handle(
          _expiredDateMeta,
          expiredDate.isAcceptableOrUnknown(
              data['expired_date']!, _expiredDateMeta));
    } else if (isInserting) {
      context.missing(_expiredDateMeta);
    }
    if (data.containsKey('last_used_date')) {
      context.handle(
          _lastUsedDateMeta,
          lastUsedDate.isAcceptableOrUnknown(
              data['last_used_date']!, _lastUsedDateMeta));
    } else if (isInserting) {
      context.missing(_lastUsedDateMeta);
    }
    if (data.containsKey('refresh_count')) {
      context.handle(
          _refreshCountMeta,
          refreshCount.isAcceptableOrUnknown(
              data['refresh_count']!, _refreshCountMeta));
    } else if (isInserting) {
      context.missing(_refreshCountMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuthenticationTableDriftG map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthenticationTableDriftG(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
      deviceInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_info'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      expiredDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expired_date'])!,
      lastUsedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_used_date'])!,
      refreshCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}refresh_count'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $AuthenticationTableDriftTable createAlias(String alias) {
    return $AuthenticationTableDriftTable(attachedDatabase, alias);
  }
}

class AuthenticationTableDriftG extends DataClass
    implements Insertable<AuthenticationTableDriftG> {
  final int id;
  final int userId;
  final String token;
  final String deviceInfo;
  final DateTime createdDate;
  final DateTime expiredDate;
  final DateTime lastUsedDate;
  final int refreshCount;
  final bool isActive;
  const AuthenticationTableDriftG(
      {required this.id,
      required this.userId,
      required this.token,
      required this.deviceInfo,
      required this.createdDate,
      required this.expiredDate,
      required this.lastUsedDate,
      required this.refreshCount,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['token'] = Variable<String>(token);
    map['device_info'] = Variable<String>(deviceInfo);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['expired_date'] = Variable<DateTime>(expiredDate);
    map['last_used_date'] = Variable<DateTime>(lastUsedDate);
    map['refresh_count'] = Variable<int>(refreshCount);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  AuthenticationTableDriftCompanion toCompanion(bool nullToAbsent) {
    return AuthenticationTableDriftCompanion(
      id: Value(id),
      userId: Value(userId),
      token: Value(token),
      deviceInfo: Value(deviceInfo),
      createdDate: Value(createdDate),
      expiredDate: Value(expiredDate),
      lastUsedDate: Value(lastUsedDate),
      refreshCount: Value(refreshCount),
      isActive: Value(isActive),
    );
  }

  factory AuthenticationTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthenticationTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      token: serializer.fromJson<String>(json['token']),
      deviceInfo: serializer.fromJson<String>(json['deviceInfo']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      expiredDate: serializer.fromJson<DateTime>(json['expiredDate']),
      lastUsedDate: serializer.fromJson<DateTime>(json['lastUsedDate']),
      refreshCount: serializer.fromJson<int>(json['refreshCount']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'token': serializer.toJson<String>(token),
      'deviceInfo': serializer.toJson<String>(deviceInfo),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'expiredDate': serializer.toJson<DateTime>(expiredDate),
      'lastUsedDate': serializer.toJson<DateTime>(lastUsedDate),
      'refreshCount': serializer.toJson<int>(refreshCount),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  AuthenticationTableDriftG copyWith(
          {int? id,
          int? userId,
          String? token,
          String? deviceInfo,
          DateTime? createdDate,
          DateTime? expiredDate,
          DateTime? lastUsedDate,
          int? refreshCount,
          bool? isActive}) =>
      AuthenticationTableDriftG(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        token: token ?? this.token,
        deviceInfo: deviceInfo ?? this.deviceInfo,
        createdDate: createdDate ?? this.createdDate,
        expiredDate: expiredDate ?? this.expiredDate,
        lastUsedDate: lastUsedDate ?? this.lastUsedDate,
        refreshCount: refreshCount ?? this.refreshCount,
        isActive: isActive ?? this.isActive,
      );
  AuthenticationTableDriftG copyWithCompanion(
      AuthenticationTableDriftCompanion data) {
    return AuthenticationTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      token: data.token.present ? data.token.value : this.token,
      deviceInfo:
          data.deviceInfo.present ? data.deviceInfo.value : this.deviceInfo,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      expiredDate:
          data.expiredDate.present ? data.expiredDate.value : this.expiredDate,
      lastUsedDate: data.lastUsedDate.present
          ? data.lastUsedDate.value
          : this.lastUsedDate,
      refreshCount: data.refreshCount.present
          ? data.refreshCount.value
          : this.refreshCount,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthenticationTableDriftG(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('token: $token, ')
          ..write('deviceInfo: $deviceInfo, ')
          ..write('createdDate: $createdDate, ')
          ..write('expiredDate: $expiredDate, ')
          ..write('lastUsedDate: $lastUsedDate, ')
          ..write('refreshCount: $refreshCount, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, token, deviceInfo, createdDate,
      expiredDate, lastUsedDate, refreshCount, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthenticationTableDriftG &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.token == this.token &&
          other.deviceInfo == this.deviceInfo &&
          other.createdDate == this.createdDate &&
          other.expiredDate == this.expiredDate &&
          other.lastUsedDate == this.lastUsedDate &&
          other.refreshCount == this.refreshCount &&
          other.isActive == this.isActive);
}

class AuthenticationTableDriftCompanion
    extends UpdateCompanion<AuthenticationTableDriftG> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> token;
  final Value<String> deviceInfo;
  final Value<DateTime> createdDate;
  final Value<DateTime> expiredDate;
  final Value<DateTime> lastUsedDate;
  final Value<int> refreshCount;
  final Value<bool> isActive;
  const AuthenticationTableDriftCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.token = const Value.absent(),
    this.deviceInfo = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.expiredDate = const Value.absent(),
    this.lastUsedDate = const Value.absent(),
    this.refreshCount = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  AuthenticationTableDriftCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String token,
    required String deviceInfo,
    required DateTime createdDate,
    required DateTime expiredDate,
    required DateTime lastUsedDate,
    required int refreshCount,
    required bool isActive,
  })  : userId = Value(userId),
        token = Value(token),
        deviceInfo = Value(deviceInfo),
        createdDate = Value(createdDate),
        expiredDate = Value(expiredDate),
        lastUsedDate = Value(lastUsedDate),
        refreshCount = Value(refreshCount),
        isActive = Value(isActive);
  static Insertable<AuthenticationTableDriftG> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? token,
    Expression<String>? deviceInfo,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? expiredDate,
    Expression<DateTime>? lastUsedDate,
    Expression<int>? refreshCount,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (token != null) 'token': token,
      if (deviceInfo != null) 'device_info': deviceInfo,
      if (createdDate != null) 'created_date': createdDate,
      if (expiredDate != null) 'expired_date': expiredDate,
      if (lastUsedDate != null) 'last_used_date': lastUsedDate,
      if (refreshCount != null) 'refresh_count': refreshCount,
      if (isActive != null) 'is_active': isActive,
    });
  }

  AuthenticationTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? token,
      Value<String>? deviceInfo,
      Value<DateTime>? createdDate,
      Value<DateTime>? expiredDate,
      Value<DateTime>? lastUsedDate,
      Value<int>? refreshCount,
      Value<bool>? isActive}) {
    return AuthenticationTableDriftCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      token: token ?? this.token,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      createdDate: createdDate ?? this.createdDate,
      expiredDate: expiredDate ?? this.expiredDate,
      lastUsedDate: lastUsedDate ?? this.lastUsedDate,
      refreshCount: refreshCount ?? this.refreshCount,
      isActive: isActive ?? this.isActive,
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
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (deviceInfo.present) {
      map['device_info'] = Variable<String>(deviceInfo.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (expiredDate.present) {
      map['expired_date'] = Variable<DateTime>(expiredDate.value);
    }
    if (lastUsedDate.present) {
      map['last_used_date'] = Variable<DateTime>(lastUsedDate.value);
    }
    if (refreshCount.present) {
      map['refresh_count'] = Variable<int>(refreshCount.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthenticationTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('token: $token, ')
          ..write('deviceInfo: $deviceInfo, ')
          ..write('createdDate: $createdDate, ')
          ..write('expiredDate: $expiredDate, ')
          ..write('lastUsedDate: $lastUsedDate, ')
          ..write('refreshCount: $refreshCount, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

abstract class _$AuthenticationDriftDB extends GeneratedDatabase {
  _$AuthenticationDriftDB(QueryExecutor e) : super(e);
  $AuthenticationDriftDBManager get managers =>
      $AuthenticationDriftDBManager(this);
  late final $AuthenticationTableDriftTable authenticationTableDrift =
      $AuthenticationTableDriftTable(this);
  late final AuthenticationDaoDrift authenticationDaoDrift =
      AuthenticationDaoDrift(this as AuthenticationDriftDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [authenticationTableDrift];
}

typedef $$AuthenticationTableDriftTableCreateCompanionBuilder
    = AuthenticationTableDriftCompanion Function({
  Value<int> id,
  required int userId,
  required String token,
  required String deviceInfo,
  required DateTime createdDate,
  required DateTime expiredDate,
  required DateTime lastUsedDate,
  required int refreshCount,
  required bool isActive,
});
typedef $$AuthenticationTableDriftTableUpdateCompanionBuilder
    = AuthenticationTableDriftCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<String> token,
  Value<String> deviceInfo,
  Value<DateTime> createdDate,
  Value<DateTime> expiredDate,
  Value<DateTime> lastUsedDate,
  Value<int> refreshCount,
  Value<bool> isActive,
});

class $$AuthenticationTableDriftTableTableManager extends RootTableManager<
    _$AuthenticationDriftDB,
    $AuthenticationTableDriftTable,
    AuthenticationTableDriftG,
    $$AuthenticationTableDriftTableFilterComposer,
    $$AuthenticationTableDriftTableOrderingComposer,
    $$AuthenticationTableDriftTableCreateCompanionBuilder,
    $$AuthenticationTableDriftTableUpdateCompanionBuilder> {
  $$AuthenticationTableDriftTableTableManager(
      _$AuthenticationDriftDB db, $AuthenticationTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$AuthenticationTableDriftTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$AuthenticationTableDriftTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> token = const Value.absent(),
            Value<String> deviceInfo = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> expiredDate = const Value.absent(),
            Value<DateTime> lastUsedDate = const Value.absent(),
            Value<int> refreshCount = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
          }) =>
              AuthenticationTableDriftCompanion(
            id: id,
            userId: userId,
            token: token,
            deviceInfo: deviceInfo,
            createdDate: createdDate,
            expiredDate: expiredDate,
            lastUsedDate: lastUsedDate,
            refreshCount: refreshCount,
            isActive: isActive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String token,
            required String deviceInfo,
            required DateTime createdDate,
            required DateTime expiredDate,
            required DateTime lastUsedDate,
            required int refreshCount,
            required bool isActive,
          }) =>
              AuthenticationTableDriftCompanion.insert(
            id: id,
            userId: userId,
            token: token,
            deviceInfo: deviceInfo,
            createdDate: createdDate,
            expiredDate: expiredDate,
            lastUsedDate: lastUsedDate,
            refreshCount: refreshCount,
            isActive: isActive,
          ),
        ));
}

class $$AuthenticationTableDriftTableFilterComposer extends FilterComposer<
    _$AuthenticationDriftDB, $AuthenticationTableDriftTable> {
  $$AuthenticationTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get deviceInfo => $state.composableBuilder(
      column: $state.table.deviceInfo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get expiredDate => $state.composableBuilder(
      column: $state.table.expiredDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastUsedDate => $state.composableBuilder(
      column: $state.table.lastUsedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get refreshCount => $state.composableBuilder(
      column: $state.table.refreshCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AuthenticationTableDriftTableOrderingComposer extends OrderingComposer<
    _$AuthenticationDriftDB, $AuthenticationTableDriftTable> {
  $$AuthenticationTableDriftTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get deviceInfo => $state.composableBuilder(
      column: $state.table.deviceInfo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get expiredDate => $state.composableBuilder(
      column: $state.table.expiredDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastUsedDate => $state.composableBuilder(
      column: $state.table.lastUsedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get refreshCount => $state.composableBuilder(
      column: $state.table.refreshCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AuthenticationDriftDBManager {
  final _$AuthenticationDriftDB _db;
  $AuthenticationDriftDBManager(this._db);
  $$AuthenticationTableDriftTableTableManager get authenticationTableDrift =>
      $$AuthenticationTableDriftTableTableManager(
          _db, _db.authenticationTableDrift);
}
