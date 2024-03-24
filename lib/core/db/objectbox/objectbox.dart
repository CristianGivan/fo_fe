import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../features/organizer/items/tag/tag_lib.dart';
import '../../../features/organizer/items/task/domain/entities/user.dart';
import '../../../features/organizer/items/task/task_lib.dart';
import '../../../features/organizer/items/tasks/tasks_lib.dart';
import '../../../features/organizer/util/organizer_enums.dart';
import '../../../objectbox.g.dart';
import '../database.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox implements Database {
  late final Store store;

  late final Box<TaskEntityObjectBox> taskBox;

  // late final Box<Owner> ownerBox;
  late final Box<TasksEntityObjectBox> tasksBox;
  late final Box<TagModelObjectBox> tagBox;

  late final Stream<Query<TasksEntityObjectBox>> eventsStream;

  ObjectBox._create(this.store) {
    taskBox = Box<TaskEntityObjectBox>(store);
    // ownerBox = Box<Owner>(store);
    tasksBox = Box<TasksEntityObjectBox>(store);
    tagBox = Box<TagModelObjectBox>(store);

    // Prepare a Query for all tasks and events.
    // https://docs.objectbox.io/queries
    final qBuilderEvents = tasksBox.query()..order(TasksEntityObjectBox_.date);
    eventsStream = qBuilderEvents.watch(triggerImmediately: true);

    if (tasksBox.isEmpty()) {
      // _putDemoData();
    }
  }

  // void _putDemoData() {
  //   // TasksEntity event = TasksEntity("One Direction Concert",
  //   //     date: DateTime.now(), location: "Miami, Florida");
  //   //
  //   // Owner owner1 = Owner('Roger');
  //   // Owner owner3 = Owner('John');
  //   //
  //   // Task task1 = Task('This is a shared task.');
  //   // task1.owner.addAll([owner1, owner2, owner3]); //set the relation
  //   //
  //   // task2.owner.add(owner2);
  //   //
  //   // event.tasks.addAll([task1, task2]);
  //   //
  //   // // Task and Owner objects will also be put along with Event.
  //   // // ToOne and ToMany will put new Objects when the source object is put.
  //   // // If the target objects already existed, then only the relation is mapped.
  //   // eventBox.put(event);
  // }

  TasksEntityObjectBox? getTasks(int eventId) {
    return tasksBox.get(eventId);
  }

  void addTask(String taskText, List<TagModelObjectBox> tags,
      TasksEntityObjectBox tasks) {
    TaskEntityObjectBox newTask = TaskEntityObjectBox(taskText);

    newTask.tagList.addAll(tags);

    TasksEntityObjectBox? updatedTasks = getTasks(tasks.id);
    updatedTasks?.taskList.add(newTask);

    int eventId = tasksBox.put(updatedTasks!);

    // debugPrint(
    //     "Added Task: ${newTask.subject} assigned to ${newTask.tagList.map((tag) => tag.tag).join(", ")} in event: ${tasksBox.get(eventId)?.name}");
  }

  // int addTasks(String name, DateTime date, String location) {
  //   TasksEntity newEvent = TasksEntity(name, date: date, location: location);

  //   debugPrint("Added Event: ${newEvent.name}");
  //   return tasksBox.put(newEvent);
  // }

  // int addOwner(String newOwner) {
  //   Owner ownerToAdd = Owner(newOwner);
  //   int newObjectId = ownerBox.put(ownerToAdd);
  //
  //   return newObjectId;
  // }

  // Stream<List<TasksEntity>> getTasksList() {
  //   final builder = tasksBox.query()..order(TasksEntity_.date);
  //   return builder.watch(triggerImmediately: true).map((query) => query.find());
  // }

  Stream<List<TaskEntityObjectBox>> getTasksOfEvent(int eventId) {
    final builder = taskBox.query()
      ..order(TaskEntityObjectBox_.id, flags: Order.descending);
    builder.link(TaskEntityObjectBox_.tasksList,
        TasksEntityObjectBox_.id.equals(eventId));
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  // @override
  // static Future<ObjectBox> create() async {
  //   // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
  //   final store = await openStore();
  //   return ObjectBox._create(store);
  // }

//---------------------------------------------

  List<Tasks> tasksEntityListToTasksList(
      List<TasksEntityObjectBox> tasksEntityList) {
    return tasksEntityList
        .map((tasksEntity) => Tasks(tasksEntity.name,
            id: tasksEntity.id,
            date: tasksEntity.date,
            location: tasksEntity.location))
        .toList();
  }

  List<TaskEntity> taskEntityListToTaskList(
      List<TaskEntityObjectBox> taskEntityList) {
    return taskEntityList
        .map((taskEntity) => TaskEntity(
              0,
              "",
              false,
              DateTime.now(),
              DateTime.now(),
              DateTime.now(),
              0,
              0,
              0,
              0,
              TaskStatus.undefined,
              User(0),
              [],
              [],
              [],
              [],
              [],
              0,
              DateTime.now(),
              DateTime.now(),
              0,
              0,
              "",
            ))
        .toList();
  }

  TasksEntityObjectBox tasksToTasksEntity(Tasks tasks) {
    TasksEntityObjectBox tasksEntity =
        TasksEntityObjectBox(name: tasks.name, id: tasks.id);
    return tasksEntity.copyWithTasks(tasks: tasks);
  }

  TaskEntityObjectBox taskToTaskEntity(TaskEntity task) {
    TaskEntityObjectBox taskEntity = TaskEntityObjectBox(task.subject);
    taskEntity.id = task.id;
    taskEntity.status = task.status;
    return taskEntity;
    // return TaskEntity(task.subject, id: task.id, status: task.status);
  }

  Set<Tag> tagEntityListToTagList(Set<TagModelObjectBox> tagEntitySet) {
    return tagEntitySet
        .map((tagEntity) => Tag(tagEntity.tag, id: tagEntity.id))
        .toSet();
  }

  Set<TagModelObjectBox> tagSetToTagEntitySet(Set<Tag> tagSet) {
    return tagSet.map((tag) => TagModelObjectBox(tag.tag, id: tag.id)).toSet();
  }

  @override
  Future<void> connect() {
    // TODO: implement connect
    throw UnimplementedError();
  }

  @override
  Future<void> disconnect() {
    // TODO: implement disconnect
    throw UnimplementedError();
  }

  @override
  Future<TaskEntity> getTaskById(int taskId) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<ObjectBox> saveTask(TaskEntity task) {
    // TODO: implement saveTask
    throw UnimplementedError();
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }

  @override
  Future<List<Tasks>> getAllTasks() async {
    try {
      final builder = tasksBox.query()..order(TasksEntityObjectBox_.date);
      Stream<List<TasksEntityObjectBox>> result =
          builder.watch(triggerImmediately: true).map((query) => query.find());
      return tasksEntityListToTasksList(await result.first);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<TaskEntity>> getAllTask() async {
    try {
      final builder = taskBox.query()..order(TaskEntityObjectBox_.subject);
      Stream<List<TaskEntityObjectBox>> result =
          builder.watch(triggerImmediately: true).map((query) => query.find());
      return taskEntityListToTaskList(await result.first);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<TaskEntity>> getTaskListByTasksId(int id) async {
    try {
      final tasks = store.box<TasksEntityObjectBox>().get(id);
      List<TaskEntityObjectBox> result1 = tasks!.taskList.toList();

      List<TaskEntity> result = taskEntityListToTaskList(result1);
      return result; //taskEntityListToTaskList(await result.first);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Set<Tag>> getTagSetFromTaskId(int id) async {
    try {
      final task = store.box<TaskEntityObjectBox>().get(id);
      Set<TagModelObjectBox> result1 = task!.tagList.toSet();
      Set<Tag> result = tagEntityListToTagList(result1);
      return result;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  int addTasks(Tasks tasks) {
    try {
      TasksEntityObjectBox newEvent = tasksToTasksEntity(tasks);

      debugPrint("Added Event: ${newEvent.name}");
      return tasksBox.put(newEvent);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  bool deleteTasks(int id) {
    try {
      return tasksBox.remove(id);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  bool deleteTask(int id) {
    try {
      return taskBox.remove(id);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<Set<Tag>> getAllTags() async {
    try {
      final builder = tagBox.query()..order(TagModelObjectBox_.tag);
      Stream<Set<TagModelObjectBox>> result = builder
          .watch(triggerImmediately: true)
          .map((query) => query.find().toSet());
      return tagEntityListToTagList(await result.first);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // @override
  // Future<void> changeTaskStatus(Task task) async {
  //   task.status = !task.status;
  //   updateTask(task);
  // }

  @override
  int updateTask(TaskEntity task) {
    return taskBox.put(taskToTaskEntity(task));
  }

  @override
  void updateTaskFields(int id, String taskText, Set<Tag> tagSet, Tasks tasks) {
    TasksEntityObjectBox tasksEntity = tasksToTasksEntity(tasks);
    Set<TagModelObjectBox> tagEntitySet = tagSetToTagEntitySet(tagSet);
    TaskEntityObjectBox updatedTask = TaskEntityObjectBox(taskText);

    updatedTask.id = id;

    updatedTask.tagList.addAll(tagEntitySet);

    TasksEntityObjectBox updatedTasks = tasksEntity;
    updatedTasks.taskList.add(updatedTask);

    // int tasksId =
    tasksBox.put(updatedTasks);

    // debugPrint(
    // "Added Task: ${updatedTask.subject} assigned to ${updatedTask.tasksList.map((owner) => owner.name).join(", ")} in event: ${tasksBox.get(eventId)?.name}");
  }

  @override
  void addTaskWithTagSetToTasks(String taskText, Set<Tag> tagSet, Tasks tasks) {
    TaskEntityObjectBox newTask = TaskEntityObjectBox(taskText);
    TasksEntityObjectBox tasksEntity = tasksToTasksEntity(tasks);
    Set<TagModelObjectBox> tagEntitySet = tagSetToTagEntitySet(tagSet);

    newTask.tagList.addAll(tagEntitySet);

    TasksEntityObjectBox? updatedTasks = getTasks(tasksEntity.id);
    updatedTasks?.taskList.add(newTask);

    // int eventId = tasksBox.put(updatedTasks!);

    // debugPrint(
    //     "Added Task: ${newTask.subject} assigned to ${newTask.tagList.map((tag) => tag.tag).join(", ")} in event: ${tasksBox.get(eventId)?.name}");
  }

  //Tag

  @override
  Set<Tag> getTagSetFromTask(TaskEntity task) {
    Set<TagModelObjectBox> tagEntitySet = <TagModelObjectBox>{};
    tagEntitySet = taskToTaskEntity(task).tagList.toSet();
    return tagEntityListToTagList(tagEntitySet);
  }

  @override
  int addTag(Tag tag) {
    return tagBox.put(TagModelObjectBox.tagEntityFromTag(tag));
  }
}
