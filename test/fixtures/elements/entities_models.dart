import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
import 'package:fo_fe/features/organizer/util/organizer_enums.dart';

TaskModel getTaskModelTestOnline() {
  return TaskModel.empty().copyWith(
    id: 2,
    subject: "Test Task online",
    createdDate: DateTime.parse("2020-02-02 02:02:01.000"),
    startDate: DateTime.parse("2020-02-02 02:02:02.000"),
    endDate: DateTime.parse("2020-02-02 02:02:03.000"),
    remoteTaskId: 2,
    lastUpdate: DateTime.parse("2020-02-02 02:02:04.000"),
    lastViewDate: DateTime.parse("2020-02-02 02:02:05.000"),
    remoteViews: 2,
    views: 2,
    checksum: 'checksum online 2',
  );
}

TaskModel getTaskModelTestOffline() {
  return TaskModel.empty().copyWith(
    id: 3,
    subject: "Test Task offline",
    createdDate: DateTime.parse("2020-03-02 02:02:01.000"),
    startDate: DateTime.parse("2020-03-02 02:02:02.000"),
    endDate: DateTime.parse("2020-03-02 02:02:03.000"),
    taskStatus: TaskStatus.pending,
    remoteTaskId: 3,
    lastUpdate: DateTime.parse("2020-03-02 02:02:04.000"),
    lastViewDate: DateTime.parse("2020-03-02 02:02:05.000"),
    remoteViews: 3,
    views: 3,
    checksum: 'checksum',
  );
}
