import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/utils/date_time/date_time_constants.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';

class ReminderModel extends ReminderEntity with EquatableMixin {
  ReminderModel({
    super.id,
    super.createdDate,
    super.creatorId,
    super.remoteId,
    super.lastUpdate,
    DateTime? lastAccessedDate,
    int? remoteAccesses,
    int? accesses,
    super.checksum,
    required super.subject,
    required super.remindAt,
  }) : super(
          lastViewDate: lastAccessedDate,
          remoteViews: remoteAccesses,
          views: accesses,
        );

  factory ReminderModel.empty() => ReminderModel(
      id: 0, subject: "", remindAt: INITIAL_EPOCH_DATE, createdDate: null);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
