import 'package:fo_fe/core/const/constants.dart';

class ReminderEntity {
  final int _id;
  final String _subject;
  final DateTime _remindAt;

  ReminderEntity({
    int? id,
    String? subject,
    required DateTime remindAt,
    int? taskId,
  })  : _id = id ?? 0,
        _subject = subject ?? "",
        _remindAt = remindAt;

  factory ReminderEntity.empty() =>
      ReminderEntity(remindAt: INITIAL_EPOCH_DATE);

  String get subject => _subject;

  DateTime get remindAt => _remindAt;

  int get id => _id;
}
