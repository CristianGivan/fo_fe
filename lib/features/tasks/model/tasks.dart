import 'package:fo_fe/core/db/objectbox/model.dart';
import 'package:fo_fe/features/tasks/model/task.dart';

class Tasks {
  int id;
  String name;
  DateTime? date;
  String location;
  List<Task> taskList;

  Tasks(this.name, {this.id = 0, this.date , this.location="",List<Task>? taskList})
        :taskList = taskList ?? [];



}