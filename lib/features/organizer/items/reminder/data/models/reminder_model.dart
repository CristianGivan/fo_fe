import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/const/constants.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

class ReminderModel extends ReminderEntity with EquatableMixin {
  ReminderModel({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastAccessedDate,
    int? remoteAccesses,
    int? accesses,
    String? checksum,
    required String subject,
    required DateTime remindAt,
  }) : super(
          id: id,
          createdDate: createdDate,
          creatorId: creatorId,
          remoteId: remoteId,
          lastUpdate: lastUpdate,
          lastViewDate: lastAccessedDate,
          remoteViews: remoteAccesses,
          views: accesses,
          checksum: checksum,
          subject: subject,
          remindAt: remindAt,
        );

  factory ReminderModel.empty() => ReminderModel(
      id: 0, subject: "", remindAt: INITIAL_EPOCH_DATE, createdDate: null);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
