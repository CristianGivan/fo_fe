import 'package:fo_fe/core/const/constants.dart';

class ReminderEntity {
  final int _id;
  final DateTime _remindAt;
  final int _taskId;

  ReminderEntity({
    int? id,
    required DateTime remindAt,
    int? taskId,
  })  : _id = id ?? 0,
        _remindAt = remindAt,
        _taskId = taskId ?? 0;

  factory ReminderEntity.empty() =>
      ReminderEntity(remindAt: INITIAL_EPOCH_DATE);

  int get taskId => _taskId;

  DateTime get remindAt => _remindAt;

  int get id => _id;
}
