// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:fo_fe/core/error/exceptions.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_mapper.dart';
import 'package:http/http.dart' as http;

import '../models/task_model.dart';
import 'task_remote_data_source.dart';

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  http.Client httpClient;
  final headers = {
    'accept': '*/*',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJVc2VyMSIsImV4cCI6MTcxNzk3MTQ1MH0.pcRDh4-wVfvbN6TWIkU0M8c7BvSW6Lqxws8rOn1g-FuLpUl6E0yCx9jvuGSHODYrv6lbqY105FmJp4bA422DFw',
  };
  final serverUrl = 'https://fo.givanc.eu/';

  TaskRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<void> deleteTask(int id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getTaskById(int id) async {
    final url = Uri.parse('${serverUrl}task/getTaskById?taskId=$id');

    final response = await httpClient.get(url, headers: headers);
    if (response.statusCode == 200) {
      return TaskMapper.jsonFoApiToModel(json.decode(response.body));
    } else {
      throw ServerException("Server exception");
    }
  }

  @override
  Future<Map<String, dynamic>> getUpdatedTaskIfDifferent(
      Map<String, dynamic> json) {
    // TODO: implement ge
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> postTask(TaskModel task) {
    // TODO: implement postTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> putTask(TaskModel task) {
    // TODO: implement putTask
    throw UnimplementedError();
  }

  //todo tests
  @override
  Future<OrganizerItems<TaskModel>> getUpdatedItems(
      OrganizerItems<TaskModel> organizerItems) async {
    Iterable<Map<String, dynamic>> jsonSend =
        organizerItems.createJsonToCheckForUpdates();
    final url =
        Uri.parse('${serverUrl}task/getTaskByIdSet'); //todo correct link
    try {
      final response = await httpClient.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        _areAllItemsProcessed(organizerItems, jsonResponse);
        return _getUpdatedItemsFromResponse(jsonResponse);
      } else {
        throw ServerException("Server exception");
      }
    } on SocketException catch (e) {
      throw ServerException("Network error: $e");
    }
    //todo check FormatException
    // on decode.FormatException catch (e) {
    //   throw ServerException("Invalid JSON format: $e");
    // }
  }

// todo now there is a minimal check it shall be created a more more detailed check
  bool _areAllItemsProcessed(
    OrganizerItems<TaskModel> organizerItems,
    Map<String, dynamic> jsonResponse,
  ) {
    final updatedCount = (jsonResponse['Updated'] as List).length;
    final notUpdatedCount = (jsonResponse['NotUpdated'] as List).length;

    return organizerItems.size() != updatedCount + notUpdatedCount;
  }

  Future<OrganizerItems<TaskModel>> _getUpdatedItemsFromResponse(
    Map<String, dynamic> jsonResponse,
  ) async {
    final updatedTasks = (jsonResponse['Updated'] as List)
        .map((dynamic item) => TaskMapper.jsonFoApiToModel(item))
        .toList();
    return OrganizerItems.of(updatedTasks as Iterable<TaskModel>);
  }

  @override
  Future<void> addReminderToTask(int taskId, ReminderEntity reminder) {
    // TODO: implement addReminderToTask
    throw UnimplementedError();
  }

  @override
  Future<void> addTagToTask(int taskId, int tagId) {
    // TODO: implement addTagToTask
    throw UnimplementedError();
  }

  @override
  Future<void> addUserToTask(int taskId, int userId) {
    // TODO: implement addUserToTask
    throw UnimplementedError();
  }

  @override
  Future<void> addTask(TaskEntity task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }
}
