import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fo_fe/core/db/database.dart';
import 'package:fo_fe/features/tasks/entity/tag_entity.dart';
import 'package:fo_fe/features/tasks/entity/task_entity.dart';
import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:fo_fe/features/tasks/model/tag.dart';
import 'package:fo_fe/features/tasks/model/task.dart';
import 'package:fo_fe/features/tasks/model/tasks.dart';
import 'package:fo_fe/objectbox.g.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox implements Database {
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

  TasksEntity? getTasks(int eventId) {
    return tasksBox.get(eventId);
  }

  void addTask(String taskText, List<TagEntity> tags, TasksEntity tasks) {
    TaskEntity newTask = TaskEntity(taskText);

    newTask.tagList.addAll(tags);

    TasksEntity? updatedTasks = getTasks(tasks.id);
    updatedTasks?.taskList.add(newTask);

    int eventId = tasksBox.put(updatedTasks!);

    debugPrint(
        "Added Task: ${newTask.subject} assigned to ${newTask.tagList.map((tag) => tag.tag).join(", ")} in event: ${tasksBox.get(eventId)?.name}");
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

  Stream<List<TaskEntity>> getTasksOfEvent(int eventId) {
    final builder = taskBox.query()
      ..order(TaskEntity_.id, flags: Order.descending);
    builder.link(TaskEntity_.tasksList, TasksEntity_.id.equals(eventId));
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
  // @override
  // static Future<ObjectBox> create() async {
  //   // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
  //   final store = await openStore();
  //   return ObjectBox._create(store);
  // }

//---------------------------------------------

  List<Tasks> tasksEntityListToTasksList(List<TasksEntity> tasksEntityList) {
    return tasksEntityList
        .map((tasksEntity) => Tasks(tasksEntity.name,
            id: tasksEntity.id,
            date: tasksEntity.date,
            location: tasksEntity.location))
        .toList();
  }

  List<Task> taskEntityListToTaskList(List<TaskEntity> taskEntityList) {
    return taskEntityList
        .map((taskEntity) => Task(
              taskEntity.subject,
              id: taskEntity.id,
              status: taskEntity.status,
            ))
        .toList();
  }

  TasksEntity tasksToTasksEntity(Tasks tasks) {
    TasksEntity tasksEntity = TasksEntity(name: tasks.name, id: tasks.id);
    return tasksEntity.copyWithTasks(tasks: tasks);
  }

  TaskEntity taskToTaskEntity(Task task) {
    TaskEntity taskEntity = TaskEntity(task.subject);
    taskEntity.id = task.id;
    taskEntity.status = task.status;
    return taskEntity;
    // return TaskEntity(task.subject, id: task.id, status: task.status);
  }

  Set<Tag> tagEntityListToTagList(Set<TagEntity> tagEntitySet) {
    return tagEntitySet
        .map((tagEntity) => Tag(tagEntity.tag, id: tagEntity.id))
        .toSet();
  }

  Set<TagEntity> tagSetToTagEntitySet(Set<Tag> tagSet) {
    return tagSet.map((tag) => TagEntity(tag.tag, id: tag.id)).toSet();
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
  Future<Task> getTaskById(int taskId) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<ObjectBox> saveTask(Task task) {
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
      final builder = tasksBox.query()..order(TasksEntity_.date);
      Stream<List<TasksEntity>> result =
          builder.watch(triggerImmediately: true).map((query) => query.find());
      return tasksEntityListToTasksList(await result.first);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Task>> getAllTask() async {
    try {
      final builder = taskBox.query()..order(TaskEntity_.subject);
      Stream<List<TaskEntity>> result =
          builder.watch(triggerImmediately: true).map((query) => query.find());
      return taskEntityListToTaskList(await result.first);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Task>> getTaskListByTasksId(int id) async {
    try {
      // final builder = taskBox.query()..order(TaskEntity_.subject);
      // Stream<List<TaskEntity>> result =
      //     builder.watch(triggerImmediately: true).map((query) => query.find());

      // List<Task> result1 = taskEntityListToTaskList(await result.first);

      final tasks = store.box<TasksEntity>().get(id);

      List<TaskEntity> result1 = tasks!.taskList.toList();

      List<Task> result = taskEntityListToTaskList(result1);
      return result; //taskEntityListToTaskList(await result.first);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  int addTasks(Tasks tasks) {
    try {
      TasksEntity newEvent = tasksToTasksEntity(tasks);

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
      return tagEntityListToTagList(tagBox.getAllAsync() as Set<TagEntity>);
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
  int updateTask(Task task) {
    return taskBox.put(taskToTaskEntity(task));
  }

  @override
  void updateTaskFields(int id, String taskText, Set<Tag> tagSet, Tasks tasks) {
    TasksEntity tasksEntity = tasksToTasksEntity(tasks);
    Set<TagEntity> tagEntitySet = tagSetToTagEntitySet(tagSet);
    TaskEntity updatedTask = TaskEntity(taskText);

    updatedTask.id = id;

    updatedTask.tagList.addAll(tagEntitySet);

    TasksEntity updatedTasks = tasksEntity;
    updatedTasks.taskList.add(updatedTask);

    // int tasksId =
    tasksBox.put(updatedTasks);

    // debugPrint(
    // "Added Task: ${updatedTask.subject} assigned to ${updatedTask.tasksList.map((owner) => owner.name).join(", ")} in event: ${tasksBox.get(eventId)?.name}");
  }

  @override
  void addTaskWithTagSetToTasks(String taskText, Set<Tag> tagSet, Tasks tasks) {
    TaskEntity newTask = TaskEntity(taskText);
    TasksEntity tasksEntity = tasksToTasksEntity(tasks);
    Set<TagEntity> tagEntitySet = tagSetToTagEntitySet(tagSet);

    newTask.tagList.addAll(tagEntitySet);

    TasksEntity? updatedTasks = getTasks(tasksEntity.id);
    updatedTasks?.taskList.add(newTask);

    int eventId = tasksBox.put(updatedTasks!);

    // debugPrint(
    //     "Added Task: ${newTask.subject} assigned to ${newTask.tagList.map((tag) => tag.tag).join(", ")} in event: ${tasksBox.get(eventId)?.name}");
  }

  //Tag

  @override
  Set<Tag> getTagSetFromTask(Task task) {
    Set<TagEntity> tagEntitySet = <TagEntity>{};
    tagEntitySet = taskToTaskEntity(task).tagList.toSet();
    return tagEntityListToTagList(tagEntitySet);
  }

  @override
  Set<Tag> getTagSetFromTaskId(int id) {
    Set<TagEntity> tagEntitySet = <TagEntity>{};
    tagEntitySet = taskBox.get(id)!.tagList.toSet();
    return tagEntityListToTagList(tagEntitySet);
  }

  @override
  int addTag(Tag tag) {
    return tagBox.put(TagEntity.tagEntityFromTag(tag));
  }
}
