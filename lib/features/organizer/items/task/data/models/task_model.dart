import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:fo_fe/features/organizer/util/organizer_enums.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required int id,
    required String subject,
    required DateTime createdDate,
    required int creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
  }) : super(
          id: id,
          subject: subject,
          createdDate: createdDate,
          creatorId: creatorId,
          remoteId: remoteId,
          lastUpdate: lastUpdate,
          lastViewDate: lastViewDate,
          remoteViews: remoteViews,
          views: views,
          checksum: checksum,
          startDate: startDate,
          endDate: endDate,
          workingTime: workingTime,
          estimatedTime: estimatedTime,
          estimatedLeftTime: estimatedLeftTime,
          workingProgress: workingProgress,
          taskStatus: taskStatus,
        );

  // Example method to calculate a property or add custom logic
  String get displayTitle => "$subject (Due: ${endDate?.toLocal()})";
}
