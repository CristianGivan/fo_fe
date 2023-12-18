import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TagEntity {
  @Id()
  int id;
  String tag;

  TagEntity(this.tag,{this.id=0});

  final tagList = ToMany<TasksEntity>();

}