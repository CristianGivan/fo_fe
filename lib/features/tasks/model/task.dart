import 'package:fo_fe/features/tasks/entity/tag_entity.dart';
import 'package:fo_fe/features/tasks/entity/task_entity.dart';
import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:fo_fe/features/tasks/model/tag.dart';
import 'package:fo_fe/features/tasks/model/tasks.dart';

class Task {
  int? id;
  String subject;
  bool status;
  List<Tag> tagList;
  List<Tasks> tasksList;

  Task(this.subject,
      {this.id ,
      this.status = false,
      List<Tag>? tagList,
      List<Tasks>? tasksList})
      : tagList = tagList ?? [],
        tasksList = tasksList ?? [];

  bool setFinished() {
    status = !status;
    return status;
  }

  factory Task.fromObjectBoxDB(TaskEntity data) {
    return Task(
        data.subject, id: data.id, status: data.status);
  }
  Set<Object?> toObjectBoxDB() => {
    subject,
    id,
    status,
  };
  // Convert TaskEntity to Task
  factory Task.fromEntity(TaskEntity entity) {
    return Task(
      entity.subject,
      id: entity.id,
      status: entity.status,
      // Convert tagList and tasksList from their ObjectBox types to regular Dart lists
      // tagList: entity.tagList.toList(), // Assuming Tag is a class with a constructor that takes TaskEntity
      // tasksList: [entity.tasksList.target ?? Tasks()], // Assuming Tasks is a class with a default constructor
    );
  }

  // Convert Task to TaskEntity
  TaskEntity toEntity() {
    final entity = TaskEntity(subject);

    entity.status=status;

    // Convert tagList and tasksList to their ObjectBox types
    // entity.tagList.addAll(this.tagList.map((tag) => TagEntity(tag))); // Assuming TagEntity is the ObjectBox entity for Tag
    // if (this.tasksList.isNotEmpty) {
    //   entity.tasksList.target = TasksEntity(); // Assuming TasksEntity is the ObjectBox entity for Tasks
    // }

    return entity;
  }
}

