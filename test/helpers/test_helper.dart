import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<NetworkInfo>(),
  MockSpec<TaskRemoteDataSourceImpl>(),
  MockSpec<TaskLocalDataSourceDrift>(),
  MockSpec<TaskRepository>(),
  MockSpec<OrganizerItemEntity>(),
  MockSpec<DataConnectionChecker>(),
  MockSpec<http.Client>(),
  MockSpec<InputConverter>(),
])
Future<void> main() async {}
