import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/const/constants.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';

class ReminderEntity extends OrganizerItemEntity with EquatableMixin {
  final String _subject;
  final DateTime _remindAt;

  ReminderEntity({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
    required String subject,
    required DateTime remindAt,
    int? taskId,
  })  : _subject = subject,
        _remindAt = remindAt,
        super(
          id: id ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
          creatorId: creatorId ?? 0,
          remoteId: remoteId ?? 0,
          lastUpdate: lastUpdate ?? INITIAL_EPOCH_DATE,
          lastAccessedDate: lastViewDate ?? INITIAL_EPOCH_DATE,
          remoteAccesses: remoteViews ?? 0,
          accesses: views ?? 0,
          checksum: checksum ?? '',
        );

  factory ReminderEntity.empty() =>
      ReminderEntity(remindAt: INITIAL_EPOCH_DATE, subject: '');

  String get subject => _subject;

  DateTime get remindAt => _remindAt;

  ReminderEntity copyWith({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
    String? subject,
    DateTime? remindAt,
    int? taskId,
  }) {
    return ReminderEntity(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewDate: lastViewDate ?? this.lastAccessedDate,
      remoteViews: remoteViews ?? this.remoteAccesses,
      views: views ?? this.accesses,
      checksum: checksum ?? this.checksum,
      subject: subject ?? this._subject,
      remindAt: remindAt ?? this._remindAt,
      taskId: taskId,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        ...super.props,
        _subject,
        _remindAt,
      ];
}
