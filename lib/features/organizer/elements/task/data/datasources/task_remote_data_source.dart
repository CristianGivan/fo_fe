// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../task_lib.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> putTask(TaskModel task);

  Future<TaskModel> postTask(TaskModel task);

  Future<TaskModel> getTaskById(int id);

  Future<Map<String, dynamic>> getUpdatedTaskIfDifferent(
      Map<String, dynamic> json);

  Future<void> deleteTask(int id);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  http.Client httpClient;
  final headers = {
    'accept': '*/*',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJVc2VyMSIsImV4cCI6MTcxNzk3MTQ1MH0.pcRDh4-wVfvbN6TWIkU0M8c7BvSW6Lqxws8rOn1g-FuLpUl6E0yCx9jvuGSHODYrv6lbqY105FmJp4bA422DFw',
  };
  final serverUrl = 'https://fo.givanc.eu/';

  TaskRemoteDataSourceImpl(this.httpClient);

  @override
  Future<void> deleteTask(int id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getTaskById(int id) async {
    TaskModel taskModel;
    final url = Uri.parse('${serverUrl}task/getTaskById?taskId=$id');

    final response = await httpClient.get(url, headers: headers);
    taskModel = TaskModel.fromJson(json.decode(response.body));
    // print(taskModel);
    return taskModel;
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
}
