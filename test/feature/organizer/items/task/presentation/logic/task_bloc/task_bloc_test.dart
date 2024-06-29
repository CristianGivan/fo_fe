import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late TaskBloc blocWithMock;
  late TaskBloc bloc;
  late MockInputConverter mockInputConverter;
  late MockGetTaskById mockGetTaskById;

  // setUp(() {
  //   mockInputConverter = MockInputConverter();
  //   mockGetTaskById = MockGetTaskById();
  //   blocWithMock = TaskBloc(
  //       getTaskById: mockGetTaskById, inputConverter: mockInputConverter);
  //   bloc = TaskBloc(
  //       getTaskById: mockGetTaskById, inputConverter: InputConverter());
  // });
  //
  // group("TaskBLoc", () {
  //   final tTask = TaskEntity.empty();
  //
  //   Future<void> setUpMockGetTaskByIdForValidInput() async {
  //     when(mockGetTaskById(Params.withSingleId(1)))
  //         .thenAnswer((_) => Future.value(Right(tTask)));
  //   }
  //
  //   Future<void> setUpMockGetTaskByIdForServerFailure() async {
  //     when(mockGetTaskById(Params.withSingleId(1))).thenAnswer(
  //         (_) => Future.value(const Left(ServerFailure(serverFailureMessage))));
  //   }
  //
  //   Future<void> setUpMockGetTaskByIdForLocalFailure() async {
  //     when(mockGetTaskById(Params.withSingleId(1))).thenAnswer(
  //         (_) => Future.value(const Left(LocalFailure(localFailureMessage))));
  //   }
  //
  //   test("Initial state should be TaskInitialState", () {
  //     expect(blocWithMock.state, equals(TaskInitialState()));
  //   });
  //
  //   blocTest(
  //     'Should throw an exception when input id is a string',
  //     build: () => bloc,
  //     act: (bloc) {
  //       bloc.add(const GetTaskByIdEvent(numberString: "abc"));
  //     },
  //     expect: () => <TaskBlocState>[
  //       TaskLoadingState(),
  //       const TaskErrorState(invalidInputFailureMessage),
  //     ],
  //   );
  //
  //   blocTest(
  //     'Should throw an exception when input id negative number',
  //     build: () => bloc,
  //     act: (bloc) {
  //       bloc.add(const GetTaskByIdEvent(numberString: "-1"));
  //     },
  //     expect: () => <TaskBlocState>[
  //       TaskLoadingState(),
  //       const TaskErrorState(invalidInputFailureMessage),
  //     ],
  //   );
  //
  //   blocTest(
  //     'Should emit the [TaskLoadingState,TaskErrorState] when a server failure occurs',
  //     build: () => bloc,
  //     act: (bloc) {
  //       setUpMockGetTaskByIdForServerFailure();
  //       bloc.add(const GetTaskByIdEvent(numberString: "1"));
  //     },
  //     expect: () => <TaskBlocState>[
  //       TaskLoadingState(),
  //       const TaskErrorState(serverFailureMessage),
  //     ],
  //   );
  //
  //   blocTest(
  //     'Should emit the [TaskLoadingState,TaskErrorState] when a local failure occurs',
  //     build: () => bloc,
  //     act: (bloc) {
  //       setUpMockGetTaskByIdForLocalFailure();
  //       bloc.add(const GetTaskByIdEvent(numberString: "1"));
  //     },
  //     expect: () => <TaskBlocState>[
  //       TaskLoadingState(),
  //       const TaskErrorState(localFailureMessage),
  //     ],
  //   );
  // });
}
