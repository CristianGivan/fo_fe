import 'package:fo_fe/features/tasks/entity/task_entity.dart';

class Task {
  int? id;
  String subject;
  bool status;

  Task(this.subject, {this.id, this.status = false});

  bool setFinished() {
    status = !status;
    return status;
  }

  factory Task.fromObjectBoxDB(TaskEntity taskEntity) {
    return Task(
      id: taskEntity.id,
      taskEntity.subject,
      status: taskEntity.status,
    );
  }

  Set<Object?> toObjectBoxDB() => {
        id,
        subject,
        status,
      };
}
