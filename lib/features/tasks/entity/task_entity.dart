import 'package:fo_fe/features/tasks/entity/tag_entity.dart';
import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TaskEntity {
  @Id()
  int id;
  String subject;
  bool status;

  TaskEntity(this.subject, {this.id = 0, this.status = false});

  // Here, the To-One relation on the base application is replaced by To-Many.
  // https://docs.objectbox.io/relations#to-many-relations
  final tagList = ToMany<TagEntity>();

  final tasksList = ToOne<TasksEntity>();

  bool setFinished() {
    status = !status;
    return status;
  }
}
