import 'package:flutter/material.dart';
import 'package:fo_fe/features/tasks/entity/tag_entity.dart';
import 'package:fo_fe/features/tasks/entity/task_entity.dart';
import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:fo_fe/objectbox.g.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  late final Store store;

  late final Box<TaskEntity> taskBox;
  // late final Box<Owner> ownerBox;
  late final Box<TasksEntity> tasksBox;
  late final Box<TagEntity> tagBox;

  late final Stream<Query<TasksEntity>> eventsStream;

  ObjectBox._create(this.store) {
    taskBox = Box<TaskEntity>(store);
    // ownerBox = Box<Owner>(store);
    tasksBox = Box<TasksEntity>(store);
    tagBox = Box<TagEntity>(store);

    // Prepare a Query for all tasks and events.
    // https://docs.objectbox.io/queries
    final qBuilderEvents = tasksBox.query()..order(TasksEntity_.date);
    eventsStream = qBuilderEvents.watch(triggerImmediately: true);

    if (tasksBox.isEmpty()) {
      _putDemoData();
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }

  void _putDemoData() {
    // TasksEntity event = TasksEntity("One Direction Concert",
    //     date: DateTime.now(), location: "Miami, Florida");
    //
    // Owner owner1 = Owner('Roger');
    // Owner owner2 = Owner('Eren');
    // Owner owner3 = Owner('John');
    //
    // Task task1 = Task('This is a shared task.');
    // task1.owner.addAll([owner1, owner2, owner3]); //set the relation
    //
    // Task task2 = Task('This is Eren\'s task.');
    // task2.owner.add(owner2);
    //
    // event.tasks.addAll([task1, task2]);
    //
    // // Task and Owner objects will also be put along with Event.
    // // ToOne and ToMany will put new Objects when the source object is put.
    // // If the target objects already existed, then only the relation is mapped.
    // eventBox.put(event);
  }

  TasksEntity? getEvent(int eventId) {
    return tasksBox.get(eventId);
  }

  void addTask(String taskText, List<TagEntity> tags, TasksEntity tasks) {
    TaskEntity newTask = TaskEntity(taskText);

    newTask.tagList.addAll(tags);

    TasksEntity updatedTasks = tasks;
    updatedTasks.taskList.add(newTask);

    int eventId = tasksBox.put(updatedTasks);

    debugPrint(
        "Added Task: ${newTask.subject} assigned to ${newTask.tagList.map((tag) => tag.tag).join(", ")} in event: ${tasksBox.get(eventId)?.name}");
  }
  void updateTask(int id, String taskText, List<TagEntity> tagList, TasksEntity tesks) {
    TaskEntity updatedTask = TaskEntity(taskText);

    updatedTask.id=id;

    updatedTask.tagList.addAll(tagList);

    TasksEntity updatedEvent = tesks;
    updatedEvent.taskList.add(updatedTask);

    int eventId = tasksBox.put(updatedEvent);

    // debugPrint(
        // "Added Task: ${updatedTask.subject} assigned to ${updatedTask.tasksList.map((owner) => owner.name).join(", ")} in event: ${tasksBox.get(eventId)?.name}");
  }

  void addEvent(String name, DateTime date, String location) {
    TasksEntity newEvent = TasksEntity(name, date: date, location: location);

    tasksBox.put(newEvent);
    debugPrint("Added Event: ${newEvent.name}");
  }

  // int addOwner(String newOwner) {
  //   Owner ownerToAdd = Owner(newOwner);
  //   int newObjectId = ownerBox.put(ownerToAdd);
  //
  //   return newObjectId;
  // }

  Stream<List<TasksEntity>> getTasksList() {
    // Query for all events ordered by date.
    // https://docs.objectbox.io/queries
    final builder = tasksBox.query()..order(TasksEntity_.date);

    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<TaskEntity>> getTasksOfEvent(int eventId) {
    final builder = taskBox.query()..order(TaskEntity_.id, flags: Order.descending);
    builder.link(TaskEntity_.tasksList, TasksEntity_.id.equals(eventId));
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
