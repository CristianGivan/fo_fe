import 'package:flutter/widgets.dart';
import 'package:fo_fe/features/tasks/entity/objectBox/task_entity.dart';
import 'package:fo_fe/features/tasks/model/tasks.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class TasksEntityObjectBox {
  @Id()
  int id;

  String name;

  @Property(type: PropertyType.date)
  DateTime? date;

  String? location;

  TasksEntityObjectBox({
    required this.id,
    required this.name,
    this.date,
    this.location,
  });

  @Backlink()
  final taskList = ToMany<TaskEntityObjectBox>();

  TasksEntityObjectBox copyWith({
    int? id,
    ValueGetter<String?>? name,
    ValueGetter<DateTime?>? date,
    ValueGetter<String?>? location,
  }) {
    return TasksEntityObjectBox(
      id: id ?? this.id,
      name: name?.call() ?? this.name,
      date: date?.call() ?? this.date,
      location: location?.call() ?? this.location,
    );
  }

  TasksEntityObjectBox copyWithTasks({Tasks? tasks}) {
    return TasksEntityObjectBox(
      id: tasks?.id ?? id,
      name: tasks?.name ?? name,
      date: tasks?.date ?? date,
      location: tasks?.location ?? location,
    );
  }
}
