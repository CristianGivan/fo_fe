import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/usecases/get_task_by_id.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
import 'package:mockito/annotations.dart';

import 'task_bloc.mocks.dart';

@GenerateNiceMocks([MockSpec<InputConverter>()])
@GenerateNiceMocks([MockSpec<GetTaskById>()])
void main() {
  late TaskBloc bloc;
  late MockInputConverter mockInputConverter;
  late MockGetTaskById mockGetTaskById;

  setUp(() {
    mockInputConverter = MockInputConverter();
    mockGetTaskById = MockGetTaskById();
    bloc = TaskBloc(
        getTaskById: mockGetTaskById, inputConverter: mockInputConverter);
  });

  // test("Initial state should be TaskInitialState", () {
  //   expect(bloc.initialState, equals(TaskInitialState()));
  // });
}
