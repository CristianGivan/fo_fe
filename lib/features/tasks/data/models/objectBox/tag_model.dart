import 'package:fo_fe/features/tasks/data/models/objectBox/tasks_entity.dart';
import 'package:fo_fe/features/tasks/domain/entities/tag.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TagModelObjectBox {
  @Id()
  int id;
  String tag;

  TagModelObjectBox(this.tag, {this.id = 0});

  static TagModelObjectBox tagEntityFromTag(Tag tag) {
    return TagModelObjectBox(tag.tag, id: tag.id);
  }

  final tagList = ToMany<TasksEntityObjectBox>();
}
