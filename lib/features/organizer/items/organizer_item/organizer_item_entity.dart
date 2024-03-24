part of 'organizer_item.dart';

class OrganizerItemEntity extends Equatable {
  final int? id;
  final String? subject;
  final DateTime? createdDate;
  final User? creator;
  final List<User>? userList;
  final List<Tag>? tagList;
  final List<Reminder>? reminderList;
  final int? remoteTaskId;
  final DateTime? lastUpdate;
  final DateTime? lastViewDate;
  final int? remoteViews;
  final int? views;
  final String? checksum;

  const OrganizerItemEntity({
    this.id,
    this.subject,
    this.createdDate,
    this.creator,
    this.userList,
    this.tagList,
    this.reminderList,
    this.remoteTaskId,
    this.lastUpdate,
    this.lastViewDate,
    this.remoteViews,
    this.views,
    this.checksum,
  });

  @override
  List<Object?> get props => [
        id,
        subject,
        createdDate,
        creator,
        userList,
        tagList,
        reminderList,
        remoteTaskId,
        lastUpdate,
        lastViewDate,
        remoteViews,
        views,
        checksum,
      ];
}
