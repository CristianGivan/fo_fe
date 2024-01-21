import 'package:fo_fe/features/tasks/entity/objectBox/tag_entity.dart';
import 'package:fo_fe/features/tasks/entity/objectBox/tasks_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TaskEntityObjectBox {
  @Id()
  int id;
  String subject;
  bool status;

  TaskEntityObjectBox(this.subject, {this.id = 0, this.status = false});

  // Here, the To-One relation on the base application is replaced by To-Many.
  // https://docs.objectbox.io/relations#to-many-relations
  final tagList = ToMany<TagEntityObjectBox>();

  final tasksList = ToOne<TasksEntityObjectBox>();

  bool setFinished() {
    status = !status;
    return status;
  }
}
