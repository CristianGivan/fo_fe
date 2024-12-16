import 'package:fo_fe/core/utils/exports/external_exports.dart';

class TaskUserLinkEntity extends Equatable {
  final int id;
  final DateTime linkingDate;
  final int taskId;
  final int userId;
  final bool selectedByUser;
  final int orderedByUser;

  const TaskUserLinkEntity({
    required this.id,
    required this.linkingDate,
    required this.taskId,
    required this.userId,
    required this.selectedByUser,
    required this.orderedByUser,
  });

  @override
  List<Object?> get props => [
        id,
        linkingDate,
        taskId,
        userId,
        selectedByUser,
        orderedByUser,
      ];
}