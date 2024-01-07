import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:fo_fe/features/tasks/model/tag.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TagEntity {
  @Id()
  int id;
  String tag;

  TagEntity(this.tag, {this.id = 0});

  static TagEntity tagEntityFromTag(Tag tag) {
    return TagEntity(tag.tag, id: tag.id);
  }

  final tagList = ToMany<TasksEntity>();
}
