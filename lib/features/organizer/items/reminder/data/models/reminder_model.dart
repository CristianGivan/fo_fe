import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/const/constants.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

class ReminderModel extends ReminderEntity with EquatableMixin {
  ReminderModel({
    required int id,
    required DateTime remindAt,
  }) : super(id: id, remindAt: remindAt);

  factory ReminderModel.empty() =>
      ReminderModel(id: 0, remindAt: INITIAL_EPOCH_DATE);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
