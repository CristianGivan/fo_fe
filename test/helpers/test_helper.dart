import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_by_id.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<NetworkInfo>(),
  // MockSpec<TaskLocalDataSource>(),
  MockSpec<TaskRemoteDataSourceImpl>(),
  // MockSpec<TaskSyncDataSource>(),
  // MockSpec<TaskModelDel>(),
  MockSpec<TaskRepository>(),
  MockSpec<OrganizerItemRepository>(),
  MockSpec<OrganizerItemEntity>(),
  MockSpec<OrganizerItemSyncDataSource>(),
  MockSpec<OrganizerItemRemoteDataSource>(),
  MockSpec<OrganizerItemLocalDataSource>(),
  MockSpec<DataConnectionChecker>(),
  MockSpec<http.Client>(),
  MockSpec<InputConverter>(),
  MockSpec<GetTaskById>()
])
Future<void> main() async {}
