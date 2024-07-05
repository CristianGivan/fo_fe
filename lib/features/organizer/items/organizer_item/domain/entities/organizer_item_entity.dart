part of '../../organizer_item.dart';

class OrganizerItemEntity extends Equatable {
  final int _id;
  final String _subject;
  final DateTime _createdDate;
  final int _creatorId;
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
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
  })  : _id = id ?? 0,
        _subject = subject ?? "",
        _createdDate = createdDate ?? INITIAL_EPOCH_DATE,
        _creatorId = creatorId ?? 0,
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
        creatorId,
        remoteId,
        lastUpdate,
        lastViewDate,
        remoteViews,
        views,
        checksum,
      ];

  int get id => _id;

  String get subject => _subject;

  DateTime get createdDate => _createdDate;

  int get creatorId => _creatorId;

  int get remoteId => _remoteId;

  DateTime? get lastUpdate => _lastUpdate;

  DateTime? get lastViewDate => _lastViewDate;

  int? get remoteViews => _remoteViews;

  int? get views => _views;

  String? get checksum => _checksum;

//   OrganizerItemEntity copyWith({
//     int? id,
//     String? subject,
//     DateTime? createdDate,
//     int? creatorId,
//     List<User>? userList,
//     List<Tag>? tagList,
//     List<Reminder>? reminderList,
//     int? remoteId,
//     DateTime? lastUpdate,
//     DateTime? lastViewDate,
//     int? remoteViews,
//     int? views,
//     String? checksum,
//   }) {
//     return OrganizerItemEntity(
//       id: id ?? this.id,
//       subject: subject ?? this.subject,
//       createdDate: createdDate ?? this.createdDate,
//       creatorId: creatorId ?? this.creatorId,
//       remoteId: remoteId ?? this.remoteId,
//       lastUpdate: lastUpdate ?? this.lastUpdate,
//       lastViewDate: lastViewDate ?? this.lastViewDate,
//       remoteViews: remoteViews ?? this.remoteViews,
//       views: views ?? this.views,
//       checksum: checksum ?? this.checksum,
//     );
//   }
//
// // todo tests
  Map<String, dynamic> jsonToCheckForUpdates() {
    return {
      "remoteId": remoteId,
      "checksum": checksum,
      "lastUpdate": lastUpdate?.toIso8601String(),
    };
  }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "task": subject,
//       "createdDate": createdDate.toIso8601String(),
//       "creatorId": creatorId,
//       "remoteId": remoteId,
//       "lastUpdate": lastUpdate?.toIso8601String(),
//       "lastViewDate": lastViewDate?.toIso8601String(),
//       "remoteViews": remoteViews,
//       "views": views,
//       "checksum": checksum,
//     };
//   }
}
