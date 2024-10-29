import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../../../helpers/fixtures/elements/fixture_reader_element.dart';
import '../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('task_online.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response("Something went wrong", 404));
  }
}
