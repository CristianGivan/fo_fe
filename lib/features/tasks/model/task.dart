import 'package:fo_fe/features/tasks/model/tag.dart';

class Task {
  int id;
  String subject;
  bool status;
  Set<int> tagIdSet;

  Task(this.subject, {this.id = 0, this.status = false, Set<int>? tagIdSet})
      : tagIdSet = tagIdSet ?? {};

  bool changeState() {
    status = !status;
    return status;
  }

  void setTagList(List<Tag> tagList) {
    tagIdSet.addAll(tagList.map((tag) => tag.id));
  }

  // factory Task.fromObjectBoxDB(TaskEntity taskEntity) {
  //   return Task(
  //     id: taskEntity.id,
  //     taskEntity.subject,
  //     status: taskEntity.status,
  //   );
  // }

  // Set<Object?> toObjectBoxDB() => {
  //       id,
  //       subject,
  //       status,
  //     };
  // bool deleteTask(int id){
  //   return database.deleteTask(id);
  // }
}
