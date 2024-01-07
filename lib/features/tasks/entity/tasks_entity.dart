import 'package:fo_fe/features/tasks/entity/task_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TasksEntity {
  @Id()
  int id;

  String name;

  @Property(type: PropertyType.date)
  DateTime? date;

  String? location;

  TasksEntity(this.name, DateTime? date, String? location, {this.id = 0});

  @Backlink()
  final taskList = ToMany<TaskEntity>();
}
