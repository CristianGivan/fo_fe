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
  static const VerificationMeta _creatorIDMeta =
      const VerificationMeta('creatorID');
  @override
  late final GeneratedColumn<int> creatorID = GeneratedColumn<int>(
      'creator_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES User(id)');
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        subject,
        createdDate,
        creatorID,
        remoteId,
        lastUpdate,
        lastViewDate,
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
    if (data.containsKey('creator_i_d')) {
      context.handle(
          _creatorIDMeta,
          creatorID.isAcceptableOrUnknown(
              data['creator_i_d']!, _creatorIDMeta));
    } else if (isInserting) {
      context.missing(_creatorIDMeta);
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
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      creatorID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_i_d'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
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
  final String subject;
  final DateTime createdDate;
  final int creatorID;
  final int? remoteId;
  final DateTime? lastUpdate;
  final DateTime? lastViewDate;
  final int? remoteViews;
  final int? views;
  final String? checksum;
  const OrganizerItemTableDriftG(
      {required this.id,
      required this.subject,
      required this.createdDate,
      required this.creatorID,
      this.remoteId,
      this.lastUpdate,
      this.lastViewDate,
      this.remoteViews,
      this.views,
      this.checksum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject'] = Variable<String>(subject);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['creator_i_d'] = Variable<int>(creatorID);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
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
    return map;
  }

  OrganizerItemTableDriftCompanion toCompanion(bool nullToAbsent) {
    return OrganizerItemTableDriftCompanion(
      id: Value(id),
      subject: Value(subject),
      createdDate: Value(createdDate),
      creatorID: Value(creatorID),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
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
    );
  }

  factory OrganizerItemTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizerItemTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      creatorID: serializer.fromJson<int>(json['creatorID']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
      lastUpdate: serializer.fromJson<DateTime?>(json['lastUpdate']),
      lastViewDate: serializer.fromJson<DateTime?>(json['lastViewDate']),
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
      'subject': serializer.toJson<String>(subject),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'creatorID': serializer.toJson<int>(creatorID),
      'remoteId': serializer.toJson<int?>(remoteId),
      'lastUpdate': serializer.toJson<DateTime?>(lastUpdate),
      'lastViewDate': serializer.toJson<DateTime?>(lastViewDate),
      'remoteViews': serializer.toJson<int?>(remoteViews),
      'views': serializer.toJson<int?>(views),
      'checksum': serializer.toJson<String?>(checksum),
    };
  }

  OrganizerItemTableDriftG copyWith(
          {int? id,
          String? subject,
          DateTime? createdDate,
          int? creatorID,
          Value<int?> remoteId = const Value.absent(),
          Value<DateTime?> lastUpdate = const Value.absent(),
          Value<DateTime?> lastViewDate = const Value.absent(),
          Value<int?> remoteViews = const Value.absent(),
          Value<int?> views = const Value.absent(),
          Value<String?> checksum = const Value.absent()}) =>
      OrganizerItemTableDriftG(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        createdDate: createdDate ?? this.createdDate,
        creatorID: creatorID ?? this.creatorID,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        lastUpdate: lastUpdate.present ? lastUpdate.value : this.lastUpdate,
        lastViewDate:
            lastViewDate.present ? lastViewDate.value : this.lastViewDate,
        remoteViews: remoteViews.present ? remoteViews.value : this.remoteViews,
        views: views.present ? views.value : this.views,
        checksum: checksum.present ? checksum.value : this.checksum,
      );
  @override
  String toString() {
    return (StringBuffer('OrganizerItemTableDriftG(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('creatorID: $creatorID, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewDate: $lastViewDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subject, createdDate, creatorID, remoteId,
      lastUpdate, lastViewDate, remoteViews, views, checksum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizerItemTableDriftG &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.createdDate == this.createdDate &&
          other.creatorID == this.creatorID &&
          other.remoteId == this.remoteId &&
          other.lastUpdate == this.lastUpdate &&
          other.lastViewDate == this.lastViewDate &&
          other.remoteViews == this.remoteViews &&
          other.views == this.views &&
          other.checksum == this.checksum);
}

class OrganizerItemTableDriftCompanion
    extends UpdateCompanion<OrganizerItemTableDriftG> {
  final Value<int> id;
  final Value<String> subject;
  final Value<DateTime> createdDate;
  final Value<int> creatorID;
  final Value<int?> remoteId;
  final Value<DateTime?> lastUpdate;
  final Value<DateTime?> lastViewDate;
  final Value<int?> remoteViews;
  final Value<int?> views;
  final Value<String?> checksum;
  const OrganizerItemTableDriftCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.creatorID = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
  });
  OrganizerItemTableDriftCompanion.insert({
    this.id = const Value.absent(),
    required String subject,
    required DateTime createdDate,
    required int creatorID,
    this.remoteId = const Value.absent(),
    this.lastUpdate = const Value.absent(),
    this.lastViewDate = const Value.absent(),
    this.remoteViews = const Value.absent(),
    this.views = const Value.absent(),
    this.checksum = const Value.absent(),
  })  : subject = Value(subject),
        createdDate = Value(createdDate),
        creatorID = Value(creatorID);
  static Insertable<OrganizerItemTableDriftG> custom({
    Expression<int>? id,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<int>? creatorID,
    Expression<int>? remoteId,
    Expression<DateTime>? lastUpdate,
    Expression<DateTime>? lastViewDate,
    Expression<int>? remoteViews,
    Expression<int>? views,
    Expression<String>? checksum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (createdDate != null) 'created_date': createdDate,
      if (creatorID != null) 'creator_i_d': creatorID,
      if (remoteId != null) 'remote_id': remoteId,
      if (lastUpdate != null) 'last_update': lastUpdate,
      if (lastViewDate != null) 'last_view_date': lastViewDate,
      if (remoteViews != null) 'remote_views': remoteViews,
      if (views != null) 'views': views,
      if (checksum != null) 'checksum': checksum,
    });
  }

  OrganizerItemTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<String>? subject,
      Value<DateTime>? createdDate,
      Value<int>? creatorID,
      Value<int?>? remoteId,
      Value<DateTime?>? lastUpdate,
      Value<DateTime?>? lastViewDate,
      Value<int?>? remoteViews,
      Value<int?>? views,
      Value<String?>? checksum}) {
    return OrganizerItemTableDriftCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      creatorID: creatorID ?? this.creatorID,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewDate: lastViewDate ?? this.lastViewDate,
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
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (creatorID.present) {
      map['creator_i_d'] = Variable<int>(creatorID.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizerItemTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('createdDate: $createdDate, ')
          ..write('creatorID: $creatorID, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastUpdate: $lastUpdate, ')
          ..write('lastViewDate: $lastViewDate, ')
          ..write('remoteViews: $remoteViews, ')
          ..write('views: $views, ')
          ..write('checksum: $checksum')
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
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
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
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
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $UserTableDriftTable createAlias(String alias) {
    return $UserTableDriftTable(attachedDatabase, alias);
  }
}

class UserTableDriftG extends DataClass implements Insertable<UserTableDriftG> {
  final int id;
  final String name;
  const UserTableDriftG({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  UserTableDriftCompanion toCompanion(bool nullToAbsent) {
    return UserTableDriftCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory UserTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  UserTableDriftG copyWith({int? id, String? name}) => UserTableDriftG(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('UserTableDriftG(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableDriftG &&
          other.id == this.id &&
          other.name == this.name);
}

class UserTableDriftCompanion extends UpdateCompanion<UserTableDriftG> {
  final Value<int> id;
  final Value<String> name;
  const UserTableDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  UserTableDriftCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<UserTableDriftG> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  UserTableDriftCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return UserTableDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
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
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, tag];
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
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
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
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag'])!,
    );
  }

  @override
  $TagTableDriftTable createAlias(String alias) {
    return $TagTableDriftTable(attachedDatabase, alias);
  }
}

class TagTableDriftG extends DataClass implements Insertable<TagTableDriftG> {
  final int id;
  final String tag;
  const TagTableDriftG({required this.id, required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  TagTableDriftCompanion toCompanion(bool nullToAbsent) {
    return TagTableDriftCompanion(
      id: Value(id),
      tag: Value(tag),
    );
  }

  factory TagTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tag': serializer.toJson<String>(tag),
    };
  }

  TagTableDriftG copyWith({int? id, String? tag}) => TagTableDriftG(
        id: id ?? this.id,
        tag: tag ?? this.tag,
      );
  @override
  String toString() {
    return (StringBuffer('TagTableDriftG(')
          ..write('id: $id, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagTableDriftG && other.id == this.id && other.tag == this.tag);
}

class TagTableDriftCompanion extends UpdateCompanion<TagTableDriftG> {
  final Value<int> id;
  final Value<String> tag;
  const TagTableDriftCompanion({
    this.id = const Value.absent(),
    this.tag = const Value.absent(),
  });
  TagTableDriftCompanion.insert({
    this.id = const Value.absent(),
    required String tag,
  }) : tag = Value(tag);
  static Insertable<TagTableDriftG> custom({
    Expression<int>? id,
    Expression<String>? tag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tag != null) 'tag': tag,
    });
  }

  TagTableDriftCompanion copyWith({Value<int>? id, Value<String>? tag}) {
    return TagTableDriftCompanion(
      id: id ?? this.id,
      tag: tag ?? this.tag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('tag: $tag')
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
  static const VerificationMeta _reminderDateMeta =
      const VerificationMeta('reminderDate');
  @override
  late final GeneratedColumn<DateTime> reminderDate = GeneratedColumn<DateTime>(
      'reminder_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _organizerItemIdMeta =
      const VerificationMeta('organizerItemId');
  @override
  late final GeneratedColumn<int> organizerItemId = GeneratedColumn<int>(
      'organizer_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES OrganizerItemTableDriftG(id)');
  @override
  List<GeneratedColumn> get $columns => [id, reminderDate, organizerItemId];
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
    if (data.containsKey('reminder_date')) {
      context.handle(
          _reminderDateMeta,
          reminderDate.isAcceptableOrUnknown(
              data['reminder_date']!, _reminderDateMeta));
    }
    if (data.containsKey('organizer_item_id')) {
      context.handle(
          _organizerItemIdMeta,
          organizerItemId.isAcceptableOrUnknown(
              data['organizer_item_id']!, _organizerItemIdMeta));
    } else if (isInserting) {
      context.missing(_organizerItemIdMeta);
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
      reminderDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}reminder_date']),
      organizerItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}organizer_item_id'])!,
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
  final DateTime? reminderDate;
  final int organizerItemId;
  const ReminderTableDriftG(
      {required this.id, this.reminderDate, required this.organizerItemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || reminderDate != null) {
      map['reminder_date'] = Variable<DateTime>(reminderDate);
    }
    map['organizer_item_id'] = Variable<int>(organizerItemId);
    return map;
  }

  ReminderTableDriftCompanion toCompanion(bool nullToAbsent) {
    return ReminderTableDriftCompanion(
      id: Value(id),
      reminderDate: reminderDate == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderDate),
      organizerItemId: Value(organizerItemId),
    );
  }

  factory ReminderTableDriftG.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderTableDriftG(
      id: serializer.fromJson<int>(json['id']),
      reminderDate: serializer.fromJson<DateTime?>(json['reminderDate']),
      organizerItemId: serializer.fromJson<int>(json['organizerItemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reminderDate': serializer.toJson<DateTime?>(reminderDate),
      'organizerItemId': serializer.toJson<int>(organizerItemId),
    };
  }

  ReminderTableDriftG copyWith(
          {int? id,
          Value<DateTime?> reminderDate = const Value.absent(),
          int? organizerItemId}) =>
      ReminderTableDriftG(
        id: id ?? this.id,
        reminderDate:
            reminderDate.present ? reminderDate.value : this.reminderDate,
        organizerItemId: organizerItemId ?? this.organizerItemId,
      );
  @override
  String toString() {
    return (StringBuffer('ReminderTableDriftG(')
          ..write('id: $id, ')
          ..write('reminderDate: $reminderDate, ')
          ..write('organizerItemId: $organizerItemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reminderDate, organizerItemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderTableDriftG &&
          other.id == this.id &&
          other.reminderDate == this.reminderDate &&
          other.organizerItemId == this.organizerItemId);
}

class ReminderTableDriftCompanion extends UpdateCompanion<ReminderTableDriftG> {
  final Value<int> id;
  final Value<DateTime?> reminderDate;
  final Value<int> organizerItemId;
  const ReminderTableDriftCompanion({
    this.id = const Value.absent(),
    this.reminderDate = const Value.absent(),
    this.organizerItemId = const Value.absent(),
  });
  ReminderTableDriftCompanion.insert({
    this.id = const Value.absent(),
    this.reminderDate = const Value.absent(),
    required int organizerItemId,
  }) : organizerItemId = Value(organizerItemId);
  static Insertable<ReminderTableDriftG> custom({
    Expression<int>? id,
    Expression<DateTime>? reminderDate,
    Expression<int>? organizerItemId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reminderDate != null) 'reminder_date': reminderDate,
      if (organizerItemId != null) 'organizer_item_id': organizerItemId,
    });
  }

  ReminderTableDriftCompanion copyWith(
      {Value<int>? id,
      Value<DateTime?>? reminderDate,
      Value<int>? organizerItemId}) {
    return ReminderTableDriftCompanion(
      id: id ?? this.id,
      reminderDate: reminderDate ?? this.reminderDate,
      organizerItemId: organizerItemId ?? this.organizerItemId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reminderDate.present) {
      map['reminder_date'] = Variable<DateTime>(reminderDate.value);
    }
    if (organizerItemId.present) {
      map['organizer_item_id'] = Variable<int>(organizerItemId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('reminderDate: $reminderDate, ')
          ..write('organizerItemId: $organizerItemId')
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
  static const VerificationMeta _creatorIDMeta =
      const VerificationMeta('creatorID');
  @override
  late final GeneratedColumn<int> creatorID = GeneratedColumn<int>(
      'creator_i_d', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES User(id)');
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
        creatorID,
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
    if (data.containsKey('creator_i_d')) {
      context.handle(
          _creatorIDMeta,
          creatorID.isAcceptableOrUnknown(
              data['creator_i_d']!, _creatorIDMeta));
    } else if (isInserting) {
      context.missing(_creatorIDMeta);
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
      creatorID: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}creator_i_d'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id']),
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
  final int creatorID;
  final int? remoteId;
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
      required this.creatorID,
      this.remoteId,
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
    map['creator_i_d'] = Variable<int>(creatorID);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<int>(remoteId);
    }
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
      creatorID: Value(creatorID),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
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
      creatorID: serializer.fromJson<int>(json['creatorID']),
      remoteId: serializer.fromJson<int?>(json['remoteId']),
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
      'creatorID': serializer.toJson<int>(creatorID),
      'remoteId': serializer.toJson<int?>(remoteId),
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
          int? creatorID,
          Value<int?> remoteId = const Value.absent(),
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
        creatorID: creatorID ?? this.creatorID,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
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
          ..write('creatorID: $creatorID, ')
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
      creatorID,
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
          other.creatorID == this.creatorID &&
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
  final Value<int> creatorID;
  final Value<int?> remoteId;
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
    this.creatorID = const Value.absent(),
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
    required int creatorID,
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
  })  : subject = Value(subject),
        createdDate = Value(createdDate),
        creatorID = Value(creatorID);
  static Insertable<TaskTableDriftG> custom({
    Expression<int>? id,
    Expression<String>? subject,
    Expression<DateTime>? createdDate,
    Expression<int>? creatorID,
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
      if (creatorID != null) 'creator_i_d': creatorID,
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
      Value<int>? creatorID,
      Value<int?>? remoteId,
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
      creatorID: creatorID ?? this.creatorID,
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
    if (creatorID.present) {
      map['creator_i_d'] = Variable<int>(creatorID.value);
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
          ..write('creatorID: $creatorID, ')
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

abstract class _$OrganizerDriftDB extends GeneratedDatabase {
  _$OrganizerDriftDB(QueryExecutor e) : super(e);
  _$OrganizerDriftDBManager get managers => _$OrganizerDriftDBManager(this);
  late final $OrganizerItemTableDriftTable organizerItemTableDrift =
      $OrganizerItemTableDriftTable(this);
  late final $UserTableDriftTable userTableDrift = $UserTableDriftTable(this);
  late final $TagTableDriftTable tagTableDrift = $TagTableDriftTable(this);
  late final $ReminderTableDriftTable reminderTableDrift =
      $ReminderTableDriftTable(this);
  late final $TaskTableDriftTable taskTableDrift = $TaskTableDriftTable(this);
  late final TaskDaoDrift taskDaoDrift = TaskDaoDrift(this as OrganizerDriftDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        organizerItemTableDrift,
        userTableDrift,
        tagTableDrift,
        reminderTableDrift,
        taskTableDrift
      ];
}

typedef $$OrganizerItemTableDriftTableInsertCompanionBuilder
    = OrganizerItemTableDriftCompanion Function({
  Value<int> id,
  required String subject,
  required DateTime createdDate,
  required int creatorID,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
});
typedef $$OrganizerItemTableDriftTableUpdateCompanionBuilder
    = OrganizerItemTableDriftCompanion Function({
  Value<int> id,
  Value<String> subject,
  Value<DateTime> createdDate,
  Value<int> creatorID,
  Value<int?> remoteId,
  Value<DateTime?> lastUpdate,
  Value<DateTime?> lastViewDate,
  Value<int?> remoteViews,
  Value<int?> views,
  Value<String?> checksum,
});

class $$OrganizerItemTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $OrganizerItemTableDriftTable,
    OrganizerItemTableDriftG,
    $$OrganizerItemTableDriftTableFilterComposer,
    $$OrganizerItemTableDriftTableOrderingComposer,
    $$OrganizerItemTableDriftTableProcessedTableManager,
    $$OrganizerItemTableDriftTableInsertCompanionBuilder,
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
          getChildManagerBuilder: (p) =>
              $$OrganizerItemTableDriftTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<int> creatorID = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
          }) =>
              OrganizerItemTableDriftCompanion(
            id: id,
            subject: subject,
            createdDate: createdDate,
            creatorID: creatorID,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastViewDate: lastViewDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String subject,
            required DateTime createdDate,
            required int creatorID,
            Value<int?> remoteId = const Value.absent(),
            Value<DateTime?> lastUpdate = const Value.absent(),
            Value<DateTime?> lastViewDate = const Value.absent(),
            Value<int?> remoteViews = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> checksum = const Value.absent(),
          }) =>
              OrganizerItemTableDriftCompanion.insert(
            id: id,
            subject: subject,
            createdDate: createdDate,
            creatorID: creatorID,
            remoteId: remoteId,
            lastUpdate: lastUpdate,
            lastViewDate: lastViewDate,
            remoteViews: remoteViews,
            views: views,
            checksum: checksum,
          ),
        ));
}

class $$OrganizerItemTableDriftTableProcessedTableManager
    extends ProcessedTableManager<
        _$OrganizerDriftDB,
        $OrganizerItemTableDriftTable,
        OrganizerItemTableDriftG,
        $$OrganizerItemTableDriftTableFilterComposer,
        $$OrganizerItemTableDriftTableOrderingComposer,
        $$OrganizerItemTableDriftTableProcessedTableManager,
        $$OrganizerItemTableDriftTableInsertCompanionBuilder,
        $$OrganizerItemTableDriftTableUpdateCompanionBuilder> {
  $$OrganizerItemTableDriftTableProcessedTableManager(super.$state);
}

class $$OrganizerItemTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $OrganizerItemTableDriftTable> {
  $$OrganizerItemTableDriftTableFilterComposer(super.$state);
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

  ColumnFilters<int> get creatorID => $state.composableBuilder(
      column: $state.table.creatorID,
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
}

class $$OrganizerItemTableDriftTableOrderingComposer extends OrderingComposer<
    _$OrganizerDriftDB, $OrganizerItemTableDriftTable> {
  $$OrganizerItemTableDriftTableOrderingComposer(super.$state);
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

  ColumnOrderings<int> get creatorID => $state.composableBuilder(
      column: $state.table.creatorID,
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
}

typedef $$UserTableDriftTableInsertCompanionBuilder = UserTableDriftCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$UserTableDriftTableUpdateCompanionBuilder = UserTableDriftCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

class $$UserTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $UserTableDriftTable,
    UserTableDriftG,
    $$UserTableDriftTableFilterComposer,
    $$UserTableDriftTableOrderingComposer,
    $$UserTableDriftTableProcessedTableManager,
    $$UserTableDriftTableInsertCompanionBuilder,
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
          getChildManagerBuilder: (p) =>
              $$UserTableDriftTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              UserTableDriftCompanion(
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              UserTableDriftCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$UserTableDriftTableProcessedTableManager extends ProcessedTableManager<
    _$OrganizerDriftDB,
    $UserTableDriftTable,
    UserTableDriftG,
    $$UserTableDriftTableFilterComposer,
    $$UserTableDriftTableOrderingComposer,
    $$UserTableDriftTableProcessedTableManager,
    $$UserTableDriftTableInsertCompanionBuilder,
    $$UserTableDriftTableUpdateCompanionBuilder> {
  $$UserTableDriftTableProcessedTableManager(super.$state);
}

class $$UserTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $UserTableDriftTable> {
  $$UserTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
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

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TagTableDriftTableInsertCompanionBuilder = TagTableDriftCompanion
    Function({
  Value<int> id,
  required String tag,
});
typedef $$TagTableDriftTableUpdateCompanionBuilder = TagTableDriftCompanion
    Function({
  Value<int> id,
  Value<String> tag,
});

class $$TagTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $TagTableDriftTable,
    TagTableDriftG,
    $$TagTableDriftTableFilterComposer,
    $$TagTableDriftTableOrderingComposer,
    $$TagTableDriftTableProcessedTableManager,
    $$TagTableDriftTableInsertCompanionBuilder,
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
          getChildManagerBuilder: (p) =>
              $$TagTableDriftTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> tag = const Value.absent(),
          }) =>
              TagTableDriftCompanion(
            id: id,
            tag: tag,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String tag,
          }) =>
              TagTableDriftCompanion.insert(
            id: id,
            tag: tag,
          ),
        ));
}

class $$TagTableDriftTableProcessedTableManager extends ProcessedTableManager<
    _$OrganizerDriftDB,
    $TagTableDriftTable,
    TagTableDriftG,
    $$TagTableDriftTableFilterComposer,
    $$TagTableDriftTableOrderingComposer,
    $$TagTableDriftTableProcessedTableManager,
    $$TagTableDriftTableInsertCompanionBuilder,
    $$TagTableDriftTableUpdateCompanionBuilder> {
  $$TagTableDriftTableProcessedTableManager(super.$state);
}

class $$TagTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $TagTableDriftTable> {
  $$TagTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tag => $state.composableBuilder(
      column: $state.table.tag,
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

  ColumnOrderings<String> get tag => $state.composableBuilder(
      column: $state.table.tag,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ReminderTableDriftTableInsertCompanionBuilder
    = ReminderTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime?> reminderDate,
  required int organizerItemId,
});
typedef $$ReminderTableDriftTableUpdateCompanionBuilder
    = ReminderTableDriftCompanion Function({
  Value<int> id,
  Value<DateTime?> reminderDate,
  Value<int> organizerItemId,
});

class $$ReminderTableDriftTableTableManager extends RootTableManager<
    _$OrganizerDriftDB,
    $ReminderTableDriftTable,
    ReminderTableDriftG,
    $$ReminderTableDriftTableFilterComposer,
    $$ReminderTableDriftTableOrderingComposer,
    $$ReminderTableDriftTableProcessedTableManager,
    $$ReminderTableDriftTableInsertCompanionBuilder,
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
          getChildManagerBuilder: (p) =>
              $$ReminderTableDriftTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime?> reminderDate = const Value.absent(),
            Value<int> organizerItemId = const Value.absent(),
          }) =>
              ReminderTableDriftCompanion(
            id: id,
            reminderDate: reminderDate,
            organizerItemId: organizerItemId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime?> reminderDate = const Value.absent(),
            required int organizerItemId,
          }) =>
              ReminderTableDriftCompanion.insert(
            id: id,
            reminderDate: reminderDate,
            organizerItemId: organizerItemId,
          ),
        ));
}

class $$ReminderTableDriftTableProcessedTableManager
    extends ProcessedTableManager<
        _$OrganizerDriftDB,
        $ReminderTableDriftTable,
        ReminderTableDriftG,
        $$ReminderTableDriftTableFilterComposer,
        $$ReminderTableDriftTableOrderingComposer,
        $$ReminderTableDriftTableProcessedTableManager,
        $$ReminderTableDriftTableInsertCompanionBuilder,
        $$ReminderTableDriftTableUpdateCompanionBuilder> {
  $$ReminderTableDriftTableProcessedTableManager(super.$state);
}

class $$ReminderTableDriftTableFilterComposer
    extends FilterComposer<_$OrganizerDriftDB, $ReminderTableDriftTable> {
  $$ReminderTableDriftTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get reminderDate => $state.composableBuilder(
      column: $state.table.reminderDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get organizerItemId => $state.composableBuilder(
      column: $state.table.organizerItemId,
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

  ColumnOrderings<DateTime> get reminderDate => $state.composableBuilder(
      column: $state.table.reminderDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get organizerItemId => $state.composableBuilder(
      column: $state.table.organizerItemId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TaskTableDriftTableInsertCompanionBuilder = TaskTableDriftCompanion
    Function({
  Value<int> id,
  required String subject,
  required DateTime createdDate,
  required int creatorID,
  Value<int?> remoteId,
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
  Value<int> creatorID,
  Value<int?> remoteId,
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
            Value<int> creatorID = const Value.absent(),
            Value<int?> remoteId = const Value.absent(),
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
            creatorID: creatorID,
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
            required int creatorID,
            Value<int?> remoteId = const Value.absent(),
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
            creatorID: creatorID,
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

  ColumnFilters<int> get creatorID => $state.composableBuilder(
      column: $state.table.creatorID,
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

  ColumnOrderings<int> get creatorID => $state.composableBuilder(
      column: $state.table.creatorID,
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

class _$OrganizerDriftDBManager {
  final _$OrganizerDriftDB _db;
  _$OrganizerDriftDBManager(this._db);
  $$OrganizerItemTableDriftTableTableManager get organizerItemTableDrift =>
      $$OrganizerItemTableDriftTableTableManager(
          _db, _db.organizerItemTableDrift);
  $$UserTableDriftTableTableManager get userTableDrift =>
      $$UserTableDriftTableTableManager(_db, _db.userTableDrift);
  $$TagTableDriftTableTableManager get tagTableDrift =>
      $$TagTableDriftTableTableManager(_db, _db.tagTableDrift);
  $$ReminderTableDriftTableTableManager get reminderTableDrift =>
      $$ReminderTableDriftTableTableManager(_db, _db.reminderTableDrift);
  $$TaskTableDriftTableTableManager get taskTableDrift =>
      $$TaskTableDriftTableTableManager(_db, _db.taskTableDrift);
}
