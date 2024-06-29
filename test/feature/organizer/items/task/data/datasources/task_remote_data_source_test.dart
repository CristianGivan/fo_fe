import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/fixtures/elements/fixture_reader_element.dart';
import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late TaskRemoteDataSourceImpl taskRemoteDataSource;
  late MockClient mockHttpClient;
  final headers = {
    'accept': '*/*',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJVc2VyMSIsImV4cCI6MTcxNzk3MTQ1MH0.pcRDh4-wVfvbN6TWIkU0M8c7BvSW6Lqxws8rOn1g-FuLpUl6E0yCx9jvuGSHODYrv6lbqY105FmJp4bA422DFw',
  };
  const serverUrl = 'https://fo.givanc.eu/';

  setUp(() {
    mockHttpClient = MockClient();
    taskRemoteDataSource = TaskRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('task_online.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response("Something went wrong", 404));
  }

  group('GetTaskById', () {
    int tId = 1;
    TaskModel tTaskModel =
        TaskModel.fromJson(json.decode(fixture('task_online.json')));

    final url = Uri.parse('${serverUrl}task/getTaskById?taskId=$tId');

    test('should perform a GET request on URL with headers', () async {
      // Arrange
      setUpMockHttpClientSuccess200();

      // Act
      taskRemoteDataSource.getTaskById(tId);

      // Assert
      verify(mockHttpClient.get(url, headers: headers));
    });

    test(
        'should return the correct test model when response code is 200(success)',
        () async {
      // Arrange
      setUpMockHttpClientSuccess200();
      final expected = tTaskModel;

      // Act
      final result = await taskRemoteDataSource.getTaskById(tId);

      // Assert
      expect(result, equals(expected));
    });
    test("Should throw server exception when the response code is 404 or other",
        () async {
      setUpMockHttpClientFailure404();

      expect(taskRemoteDataSource.getTaskById(tId), throwsException);
    });
  });
}
