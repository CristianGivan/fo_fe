import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ReminderEntity extends OrganizerItemEntity {
  final DateTime _remindAt;

  ReminderEntity({
    required DateTime remindAt,
    super.subject,
    int? id,
    int? creatorId,
    int? remoteId,
    DateTime? createdDate,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
  })  : _remindAt = remindAt,
        super(
          id: id ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
          creatorId: creatorId ?? 0,
          remoteId: remoteId ?? 0,
          lastUpdate: lastUpdate ?? INITIAL_EPOCH_DATE,
          lastViewedDate: lastViewedDate ?? INITIAL_EPOCH_DATE,
          remoteViews: remoteViews ?? 0,
          views: views ?? 0,
          checksum: checksum ?? '',
        );

  static final ReminderEntity _emptyInstance = ReminderEntity(
    subject: "",
    id: 0,
    creatorId: 0,
    createdDate: INITIAL_EPOCH_DATE,
    lastUpdate: INITIAL_EPOCH_DATE,
    lastViewedDate: INITIAL_EPOCH_DATE,
    remoteViews: 0,
    views: 0,
    checksum: "",
    remindAt: INITIAL_EPOCH_DATE,
  );

  factory ReminderEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  DateTime get remindAt => _remindAt;

  ReminderEntity copyWith({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
    String? subject,
    DateTime? remindAt,
  }) {
    return ReminderEntity(
      subject: subject ?? this.subject,
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      createdDate: createdDate ?? this.createdDate,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
      remindAt: remindAt ?? _remindAt,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        ...super.props,
        _remindAt,
      ];
}
