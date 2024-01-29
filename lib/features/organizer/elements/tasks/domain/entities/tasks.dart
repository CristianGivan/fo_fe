part of '../../tasks.dart';

class Tasks {
  int id;
  String name;
  DateTime? date;
  String? location;

  Tasks(this.name, {this.id = 0, this.date, this.location = ""});
  static Tasks empty = Tasks("", id: 0, date: DateTime.now(), location: "");
}
