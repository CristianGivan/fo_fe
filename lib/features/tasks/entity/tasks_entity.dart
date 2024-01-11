import 'package:flutter/widgets.dart';
import 'package:fo_fe/features/tasks/model/tasks.dart';
import 'package:objectbox/objectbox.dart';

import 'package:fo_fe/features/tasks/entity/task_entity.dart';

@Entity()
class TasksEntity {
  @Id()
  int id;

  String name;

  @Property(type: PropertyType.date)
  DateTime? date;

  String? location;
  TasksEntity({
    required this.id,
    required this.name,
    this.date,
    this.location,
  });

  @Backlink()
  final taskList = ToMany<TaskEntity>();

  TasksEntity copyWith({
    int? id,
    ValueGetter<String?>? name,
    ValueGetter<DateTime?>? date,
    ValueGetter<String?>? location,
  }) {
    return TasksEntity(
      id: id ?? this.id,
      name: name?.call() ?? this.name,
      date: date?.call() ?? this.date,
      location: location?.call() ?? this.location,
    );
  }

  TasksEntity copyWithTasks({Tasks? tasks}) {
    return TasksEntity(
      id: tasks?.id ?? this.id,
      name: tasks?.name ?? this.name,
      date: tasks?.date ?? this.date,
      location: tasks?.location ?? this.location,
    );
  }
}
