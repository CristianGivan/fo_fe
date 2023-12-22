import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:fo_fe/main.dart';

class Tasks {
  int id;
  String name;
  DateTime? date;
  String? location;

  Tasks(this.name, {this.id = 0, this.date, this.location = ""});

  TasksEntity tasksToObjectBoxTasksEntity() {
    return TasksEntity(name, date: date, location: location);
  }

  static Tasks objectBoxTasksEntityToTasks(TasksEntity tasksEntity) {
    return Tasks(tasksEntity.name,
        id: tasksEntity.id,
        date: tasksEntity.date,
        location: tasksEntity.location);
  }

  static List<Tasks> objectBoxTasksEntityListToTasksList(
      List<TasksEntity> tasksEntityList) {
    List<Tasks> tasksList = tasksEntityList
        .map((tasksEntity) => Tasks(tasksEntity.name,
            id: tasksEntity.id,
            date: tasksEntity.date,
            location: tasksEntity.location))
        .toList();
    return tasksList;
  }

  // static Future<List<Tasks>> streamObjectBoxTasksEntityListToTasksList(
  //     Stream<List<TasksEntity>> tasksEntityList) async {
  //   List<TasksEntity> tasksEntity = await
  //   return await objectBoxTasksEntityListToTasksList(tasksEntityList.first);
  // }

  static Future<List<Tasks>> getAllTasks() async {
    Future<List<Tasks>> futureTasksLeast;
    List<Tasks> tasksLists = [];
    Stream<List<TasksEntity>> streamTasksEntity = objectbox.getTasksList();
    tasksLists =
        objectBoxTasksEntityListToTasksList(await streamTasksEntity.first);
    return tasksLists;
  }
}
