class Tasks {
  int id;
  String name;
  DateTime? date;
  String? location;

  Tasks(this.name, {this.id = 0, this.date, this.location = ""});
  static Tasks empty = Tasks("", id: 0, date: DateTime.now(), location: "");

  // TasksEntity tasksToObjectBoxTasksEntity() {
  //   return TasksEntity(name,id: id, date: date, location: location);
  // }

  // static Tasks objectBoxTasksEntityToTasks(TasksEntity tasksEntity) {
  //   return Tasks(tasksEntity.name,
  //       id: tasksEntity.id,
  //       date: tasksEntity.date,
  //       location: tasksEntity.location);
  // }
}
