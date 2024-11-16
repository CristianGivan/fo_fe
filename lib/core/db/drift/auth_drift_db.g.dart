// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_drift_db.dart';

// ignore_for_file: type=lint
class $AuthTableDriftTable extends AuthTableDrift
    with TableInfo<$AuthTableDriftTable, AuthTableDriftG> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $AuthTableDriftTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>('user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>('token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceInfoMeta = const VerificationMeta('deviceInfo');
  @override
  late final GeneratedColumn<String> deviceInfo = GeneratedColumn<String>(
      'device_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta = const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _expiredDateMeta = const VerificationMeta('expiredDate');
  @override
  late final GeneratedColumn<DateTime> expiredDate = GeneratedColumn<DateTime>(
      'expired_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastUsedDateMeta = const VerificationMeta('lastUsedDate');
  @override
  late final GeneratedColumn<DateTime> lastUsedDate = GeneratedColumn<DateTime>(
      'last_used_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _usedCountMeta = const VerificationMeta('usedCount');
  @override
  late final GeneratedColumn<int> usedCount = GeneratedColumn<int>('used_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _usedCountMaxMeta = const VerificationMeta('usedCountMax');
  @override
  late final GeneratedColumn<int> usedCountMax = GeneratedColumn<int>(
      'used_count_max', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>('is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  static const VerificationMeta _isAutoSignInMeta = const VerificationMeta('isAutoSignIn');
  @override
  late final GeneratedColumn<bool> isAutoSignIn = GeneratedColumn<bool>(
      'is_auto_sign_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_auto_sign_in" IN (0, 1))'));

  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        token,
        deviceInfo,
        createdDate,
        expiredDate,
        lastUsedDate,
        usedCount,
        usedCountMax,
        isActive,
        isAutoSignIn
      ];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'auth_table_drift';

  @override
  VerificationContext validateIntegrity(Insertable<AuthTableDriftG> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta, userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('token')) {
      context.handle(_tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('device_info')) {
      context.handle(
          _deviceInfoMeta, deviceInfo.isAcceptableOrUnknown(data['device_info']!, _deviceInfoMeta));
    } else if (isInserting) {
      context.missing(_deviceInfoMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(_createdDateMeta,
          createdDate.isAcceptableOrUnknown(data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('expired_date')) {
      context.handle(_expiredDateMeta,
          expiredDate.isAcceptableOrUnknown(data['expired_date']!, _expiredDateMeta));
    } else if (isInserting) {
      context.missing(_expiredDateMeta);
    }
    if (data.containsKey('last_used_date')) {
      context.handle(_lastUsedDateMeta,
          lastUsedDate.isAcceptableOrUnknown(data['last_used_date']!, _lastUsedDateMeta));
    } else if (isInserting) {
      context.missing(_lastUsedDateMeta);
    }
    if (data.containsKey('used_count')) {
      context.handle(
          _usedCountMeta, usedCount.isAcceptableOrUnknown(data['used_count']!, _usedCountMeta));
    } else if (isInserting) {
      context.missing(_usedCountMeta);
    }
    if (data.containsKey('used_count_max')) {
      context.handle(_usedCountMaxMeta,
          usedCountMax.isAcceptableOrUnknown(data['used_count_max']!, _usedCountMaxMeta));
    } else if (isInserting) {
      context.missing(_usedCountMaxMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
          _isActiveMeta, isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('is_auto_sign_in')) {
      context.handle(_isAutoSignInMeta,
          isAutoSignIn.isAcceptableOrUnknown(data['is_auto_sign_in']!, _isAutoSignInMeta));
    } else if (isInserting) {
      context.missing(_isAutoSignInMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  AuthTableDriftG map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuthTableDriftG(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId:
          attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      token:
          attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}token'])!,
      deviceInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_info'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      expiredDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expired_date'])!,
      lastUsedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_used_date'])!,
      usedCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}used_count'])!,
      usedCountMax: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}used_count_max'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isAutoSignIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_auto_sign_in'])!,
    );
  }

  @override
  $AuthTableDriftTable createAlias(String alias) {
    return $AuthTableDriftTable(attachedDatabase, alias);
  }
}

class AuthTableDriftG extends DataClass implements Insertable<AuthTableDriftG> {
  final int id;
  final int userId;
  final String token;
  final String deviceInfo;
  final DateTime createdDate;
  final DateTime expiredDate;
  final DateTime lastUsedDate;
  final int usedCount;
  final int usedCountMax;
  final bool isActive;
  final bool isAutoSignIn;

  const AuthTableDriftG(
      {required this.id,
      required this.userId,
      required this.token,
      required this.deviceInfo,
      required this.createdDate,
      required this.expiredDate,
      required this.lastUsedDate,
      required this.usedCount,
      required this.usedCountMax,
      required this.isActive,
      required this.isAutoSignIn});

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
    map['used_count'] = Variable<int>(usedCount);
    map['used_count_max'] = Variable<int>(usedCountMax);
    map['is_active'] = Variable<bool>(isActive);
    map['is_auto_sign_in'] = Variable<bool>(isAutoSignIn);
    return map;
  }

  AuthTableDriftCompanion toCompanion(bool nullToAbsent) {
    return AuthTableDriftCompanion(
      id: Value(id),
      userId: Value(userId),
      token: Value(token),
      deviceInfo: Value(deviceInfo),
      createdDate: Value(createdDate),
      expiredDate: Value(expiredDate),
      lastUsedDate: Value(lastUsedDate),
      usedCount: Value(usedCount),
      usedCountMax: Value(usedCountMax),
      isActive: Value(isActive),
      isAutoSignIn: Value(isAutoSignIn),
    );
  }

  factory AuthTableDriftG.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuthTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      token: serializer.fromJson<String>(json['token']),
      deviceInfo: serializer.fromJson<String>(json['deviceInfo']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      expiredDate: serializer.fromJson<DateTime>(json['expiredDate']),
      lastUsedDate: serializer.fromJson<DateTime>(json['lastUsedDate']),
      usedCount: serializer.fromJson<int>(json['usedCount']),
      usedCountMax: serializer.fromJson<int>(json['usedCountMax']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isAutoSignIn: serializer.fromJson<bool>(json['isAutoSignIn']),
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
      'usedCount': serializer.toJson<int>(usedCount),
      'usedCountMax': serializer.toJson<int>(usedCountMax),
      'isActive': serializer.toJson<bool>(isActive),
      'isAutoSignIn': serializer.toJson<bool>(isAutoSignIn),
    };
  }

  AuthTableDriftG copyWith(
          {int? id,
          int? userId,
          String? token,
          String? deviceInfo,
          DateTime? createdDate,
          DateTime? expiredDate,
          DateTime? lastUsedDate,
          int? usedCount,
          int? usedCountMax,
          bool? isActive,
          bool? isAutoSignIn}) =>
      AuthTableDriftG(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        token: token ?? this.token,
        deviceInfo: deviceInfo ?? this.deviceInfo,
        createdDate: createdDate ?? this.createdDate,
        expiredDate: expiredDate ?? this.expiredDate,
        lastUsedDate: lastUsedDate ?? this.lastUsedDate,
        usedCount: usedCount ?? this.usedCount,
        usedCountMax: usedCountMax ?? this.usedCountMax,
        isActive: isActive ?? this.isActive,
        isAutoSignIn: isAutoSignIn ?? this.isAutoSignIn,
      );

  AuthTableDriftG copyWithCompanion(AuthTableDriftCompanion data) {
    return AuthTableDriftG(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      token: data.token.present ? data.token.value : this.token,
      deviceInfo: data.deviceInfo.present ? data.deviceInfo.value : this.deviceInfo,
      createdDate: data.createdDate.present ? data.createdDate.value : this.createdDate,
      expiredDate: data.expiredDate.present ? data.expiredDate.value : this.expiredDate,
      lastUsedDate: data.lastUsedDate.present ? data.lastUsedDate.value : this.lastUsedDate,
      usedCount: data.usedCount.present ? data.usedCount.value : this.usedCount,
      usedCountMax: data.usedCountMax.present ? data.usedCountMax.value : this.usedCountMax,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isAutoSignIn: data.isAutoSignIn.present ? data.isAutoSignIn.value : this.isAutoSignIn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuthTableDriftG(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('token: $token, ')
          ..write('deviceInfo: $deviceInfo, ')
          ..write('createdDate: $createdDate, ')
          ..write('expiredDate: $expiredDate, ')
          ..write('lastUsedDate: $lastUsedDate, ')
          ..write('usedCount: $usedCount, ')
          ..write('usedCountMax: $usedCountMax, ')
          ..write('isActive: $isActive, ')
          ..write('isAutoSignIn: $isAutoSignIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, token, deviceInfo, createdDate, expiredDate,
      lastUsedDate, usedCount, usedCountMax, isActive, isAutoSignIn);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthTableDriftG &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.token == this.token &&
          other.deviceInfo == this.deviceInfo &&
          other.createdDate == this.createdDate &&
          other.expiredDate == this.expiredDate &&
          other.lastUsedDate == this.lastUsedDate &&
          other.usedCount == this.usedCount &&
          other.usedCountMax == this.usedCountMax &&
          other.isActive == this.isActive &&
          other.isAutoSignIn == this.isAutoSignIn);
}

class AuthTableDriftCompanion extends UpdateCompanion<AuthTableDriftG> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> token;
  final Value<String> deviceInfo;
  final Value<DateTime> createdDate;
  final Value<DateTime> expiredDate;
  final Value<DateTime> lastUsedDate;
  final Value<int> usedCount;
  final Value<int> usedCountMax;
  final Value<bool> isActive;
  final Value<bool> isAutoSignIn;

  const AuthTableDriftCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.token = const Value.absent(),
    this.deviceInfo = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.expiredDate = const Value.absent(),
    this.lastUsedDate = const Value.absent(),
    this.usedCount = const Value.absent(),
    this.usedCountMax = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isAutoSignIn = const Value.absent(),
  });

  AuthTableDriftCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String token,
    required String deviceInfo,
    required DateTime createdDate,
    required DateTime expiredDate,
    required DateTime lastUsedDate,
    required int usedCount,
    required int usedCountMax,
    required bool isActive,
    required bool isAutoSignIn,
  })  : userId = Value(userId),
        token = Value(token),
        deviceInfo = Value(deviceInfo),
        createdDate = Value(createdDate),
        expiredDate = Value(expiredDate),
        lastUsedDate = Value(lastUsedDate),
        usedCount = Value(usedCount),
        usedCountMax = Value(usedCountMax),
        isActive = Value(isActive),
        isAutoSignIn = Value(isAutoSignIn);

  static Insertable<AuthTableDriftG> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? token,
    Expression<String>? deviceInfo,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? expiredDate,
    Expression<DateTime>? lastUsedDate,
    Expression<int>? usedCount,
    Expression<int>? usedCountMax,
    Expression<bool>? isActive,
    Expression<bool>? isAutoSignIn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (token != null) 'token': token,
      if (deviceInfo != null) 'device_info': deviceInfo,
      if (createdDate != null) 'created_date': createdDate,
      if (expiredDate != null) 'expired_date': expiredDate,
      if (lastUsedDate != null) 'last_used_date': lastUsedDate,
      if (usedCount != null) 'used_count': usedCount,
      if (usedCountMax != null) 'used_count_max': usedCountMax,
      if (isActive != null) 'is_active': isActive,
      if (isAutoSignIn != null) 'is_auto_sign_in': isAutoSignIn,
    });
  }

  AuthTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? token,
      Value<String>? deviceInfo,
      Value<DateTime>? createdDate,
      Value<DateTime>? expiredDate,
      Value<DateTime>? lastUsedDate,
      Value<int>? usedCount,
      Value<int>? usedCountMax,
      Value<bool>? isActive,
      Value<bool>? isAutoSignIn}) {
    return AuthTableDriftCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      token: token ?? this.token,
      deviceInfo: deviceInfo ?? this.deviceInfo,
      createdDate: createdDate ?? this.createdDate,
      expiredDate: expiredDate ?? this.expiredDate,
      lastUsedDate: lastUsedDate ?? this.lastUsedDate,
      usedCount: usedCount ?? this.usedCount,
      usedCountMax: usedCountMax ?? this.usedCountMax,
      isActive: isActive ?? this.isActive,
      isAutoSignIn: isAutoSignIn ?? this.isAutoSignIn,
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
    if (usedCount.present) {
      map['used_count'] = Variable<int>(usedCount.value);
    }
    if (usedCountMax.present) {
      map['used_count_max'] = Variable<int>(usedCountMax.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isAutoSignIn.present) {
      map['is_auto_sign_in'] = Variable<bool>(isAutoSignIn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuthTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('token: $token, ')
          ..write('deviceInfo: $deviceInfo, ')
          ..write('createdDate: $createdDate, ')
          ..write('expiredDate: $expiredDate, ')
          ..write('lastUsedDate: $lastUsedDate, ')
          ..write('usedCount: $usedCount, ')
          ..write('usedCountMax: $usedCountMax, ')
          ..write('isActive: $isActive, ')
          ..write('isAutoSignIn: $isAutoSignIn')
          ..write(')'))
        .toString();
  }
}

abstract class _$AuthDriftDB extends GeneratedDatabase {
  _$AuthDriftDB(QueryExecutor e) : super(e);

  $AuthDriftDBManager get managers => $AuthDriftDBManager(this);
  late final $AuthTableDriftTable authTableDrift = $AuthTableDriftTable(this);
  late final AuthDaoDrift authDaoDrift = AuthDaoDrift(this as AuthDriftDB);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [authTableDrift];
}

typedef $$AuthTableDriftTableCreateCompanionBuilder = AuthTableDriftCompanion Function({
  Value<int> id,
  required int userId,
  required String token,
  required String deviceInfo,
  required DateTime createdDate,
  required DateTime expiredDate,
  required DateTime lastUsedDate,
  required int usedCount,
  required int usedCountMax,
  required bool isActive,
  required bool isAutoSignIn,
});
typedef $$AuthTableDriftTableUpdateCompanionBuilder = AuthTableDriftCompanion Function({
  Value<int> id,
  Value<int> userId,
  Value<String> token,
  Value<String> deviceInfo,
  Value<DateTime> createdDate,
  Value<DateTime> expiredDate,
  Value<DateTime> lastUsedDate,
  Value<int> usedCount,
  Value<int> usedCountMax,
  Value<bool> isActive,
  Value<bool> isAutoSignIn,
});

class $$AuthTableDriftTableTableManager extends RootTableManager<
    _$AuthDriftDB,
    $AuthTableDriftTable,
    AuthTableDriftG,
    $$AuthTableDriftTableFilterComposer,
    $$AuthTableDriftTableOrderingComposer,
    $$AuthTableDriftTableCreateCompanionBuilder,
    $$AuthTableDriftTableUpdateCompanionBuilder> {
  $$AuthTableDriftTableTableManager(_$AuthDriftDB db, $AuthTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$AuthTableDriftTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$AuthTableDriftTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> token = const Value.absent(),
            Value<String> deviceInfo = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> expiredDate = const Value.absent(),
            Value<DateTime> lastUsedDate = const Value.absent(),
            Value<int> usedCount = const Value.absent(),
            Value<int> usedCountMax = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isAutoSignIn = const Value.absent(),
          }) =>
              AuthTableDriftCompanion(
            id: id,
            userId: userId,
            token: token,
            deviceInfo: deviceInfo,
            createdDate: createdDate,
            expiredDate: expiredDate,
            lastUsedDate: lastUsedDate,
            usedCount: usedCount,
            usedCountMax: usedCountMax,
            isActive: isActive,
            isAutoSignIn: isAutoSignIn,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String token,
            required String deviceInfo,
            required DateTime createdDate,
            required DateTime expiredDate,
            required DateTime lastUsedDate,
            required int usedCount,
            required int usedCountMax,
            required bool isActive,
            required bool isAutoSignIn,
          }) =>
              AuthTableDriftCompanion.insert(
            id: id,
            userId: userId,
            token: token,
            deviceInfo: deviceInfo,
            createdDate: createdDate,
            expiredDate: expiredDate,
            lastUsedDate: lastUsedDate,
            usedCount: usedCount,
            usedCountMax: usedCountMax,
            isActive: isActive,
            isAutoSignIn: isAutoSignIn,
          ),
        ));
}

class $$AuthTableDriftTableFilterComposer
    extends FilterComposer<_$AuthDriftDB, $AuthTableDriftTable> {
  $$AuthTableDriftTableFilterComposer(super.$state);

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get deviceInfo => $state.composableBuilder(
      column: $state.table.deviceInfo,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get expiredDate => $state.composableBuilder(
      column: $state.table.expiredDate,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastUsedDate => $state.composableBuilder(
      column: $state.table.lastUsedDate,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get usedCount => $state.composableBuilder(
      column: $state.table.usedCount,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get usedCountMax => $state.composableBuilder(
      column: $state.table.usedCountMax,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isAutoSignIn => $state.composableBuilder(
      column: $state.table.isAutoSignIn,
      builder: (column, joinBuilders) => ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AuthTableDriftTableOrderingComposer
    extends OrderingComposer<_$AuthDriftDB, $AuthTableDriftTable> {
  $$AuthTableDriftTableOrderingComposer(super.$state);

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get deviceInfo => $state.composableBuilder(
      column: $state.table.deviceInfo,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get expiredDate => $state.composableBuilder(
      column: $state.table.expiredDate,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastUsedDate => $state.composableBuilder(
      column: $state.table.lastUsedDate,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get usedCount => $state.composableBuilder(
      column: $state.table.usedCount,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get usedCountMax => $state.composableBuilder(
      column: $state.table.usedCountMax,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isAutoSignIn => $state.composableBuilder(
      column: $state.table.isAutoSignIn,
      builder: (column, joinBuilders) => ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AuthDriftDBManager {
  final _$AuthDriftDB _db;

  $AuthDriftDBManager(this._db);

  $$AuthTableDriftTableTableManager get authTableDrift =>
      $$AuthTableDriftTableTableManager(_db, _db.authTableDrift);
}
