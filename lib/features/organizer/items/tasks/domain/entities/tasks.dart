part of '../../tasks_lib.dart';

class Tasks {
  int id;
  String name;
  DateTime? date;
  String? location;

  Tasks(this.name, {this.id = 0, this.date, this.location = ""});

// static Tasks empty = Tasks.empty();
}
