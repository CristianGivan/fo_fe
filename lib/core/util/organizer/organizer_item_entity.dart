part of '../../../features/organizer/items/organizer_item/organizer_item.dart';

class OrganizerItemEntity extends Equatable {
  final int? _id;
  final String _subject;
  final DateTime _createdDate;
  final User _creator;
  final List<User> _userList;
  final List<Tag> _tagList;
  final List<Reminder> _reminderList;
  final int _remoteId;
  final DateTime? _lastUpdate;
  final DateTime? _lastViewDate;
  final int? _remoteViews;
  final int? _views;
  final String? _checksum;

//todo why constructor cannot be const with INITIAL_EPOCH_DATE
  OrganizerItemEntity({
    int? id,
    String? subject,
    DateTime? createdDate,
    User? creator,
    List<User>? userList,
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
  })  : _id = id ?? 0,
        _subject = subject ?? "",
        _createdDate = createdDate ?? INITIAL_EPOCH_DATE,
        _creator = creator ?? const User(id: 0),
        _userList = userList ?? const [],
        _tagList = tagList ?? const [],
        _reminderList = reminderList ?? const [],
        _remoteId = remoteId ?? 0,
        _lastUpdate = lastUpdate,
        _lastViewDate = lastViewDate,
        _remoteViews = remoteViews,
        _views = views,
        _checksum = checksum;

  @override
  List<Object?> get props => [
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
      ];

  int? get id => _id;

  String get subject => _subject;

  DateTime get createdDate => _createdDate;

  User get creator => _creator;

  List<User> get userList => List.unmodifiable(_userList);

  List<Tag> get tagList => List.unmodifiable(_tagList);

  List<Reminder> get reminderList => List.unmodifiable(_reminderList);

  int get remoteId => _remoteId;

  DateTime? get lastUpdate => _lastUpdate;

  DateTime? get lastViewDate => _lastViewDate;

  int? get remoteViews => _remoteViews;

  int? get views => _views;

  String? get checksum => _checksum;

  OrganizerItemEntity copyWith({
    int? id,
    String? subject,
    DateTime? createdDate,
    User? creator,
    List<User>? userList,
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
  }) {
    return OrganizerItemEntity(
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
    );
  }

// todo tests
  Map<String, dynamic> jsonToCheckForUpdates() {
    return {
      "remoteId": remoteId,
      "checksum": checksum,
      "lastUpdate": lastUpdate?.toIso8601String(),
    };
  }

  //todo how to add to the child class the rest of the Json
  Map<String, dynamic> toJson() {
    return {
      "taskId": id,
      "task": subject,
      "createdDate": createdDate.toIso8601String(),
      //todo creator
      //todo userlist
      //todo tag
      //todo reminder
      "remoteId": remoteId,
      "lastUpdate": lastUpdate?.toIso8601String(),
      "lastViewDate": lastViewDate?.toIso8601String(),
      "remoteViews": remoteViews,
      "views": views,
      "checksum": checksum,
    };
  }
}
