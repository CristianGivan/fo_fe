import 'package:fo_fe/features/tasks/entity/objectBox/tasks_entity.dart';
import 'package:fo_fe/features/tasks/model/tag.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TagEntityObjectBox {
  @Id()
  int id;
  String tag;

  TagEntityObjectBox(this.tag, {this.id = 0});

  static TagEntityObjectBox tagEntityFromTag(Tag tag) {
    return TagEntityObjectBox(tag.tag, id: tag.id);
  }

  final tagList = ToMany<TasksEntityObjectBox>();
}
