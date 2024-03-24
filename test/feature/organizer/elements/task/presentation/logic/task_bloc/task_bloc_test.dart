import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/const/error_message.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/core/util/organizer/params.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../../helpers/test_helper.mocks.dart';

void main() {
  late TaskBloc blocWithMock;
  late TaskBloc bloc;
  late MockInputConverter mockInputConverter;
  late MockGetTaskById mockGetTaskById;

  setUp(() {
    mockInputConverter = MockInputConverter();
    mockGetTaskById = MockGetTaskById();
    blocWithMock = TaskBloc(
        getTaskById: mockGetTaskById, inputConverter: mockInputConverter);
    bloc = TaskBloc(
        getTaskById: mockGetTaskById, inputConverter: InputConverter());
  });

  group("TaskBLoc", () {
    final tTask = TaskEntity.empty();

    Future<void> setUpMockGetTaskByIdForValidInput() async {
      when(mockGetTaskById(Params.withSingleId(1)))
          .thenAnswer((_) => Future.value(Right(tTask)));
    }

    Future<void> setUpMockGetTaskByIdForServerFailure() async {
      when(mockGetTaskById(Params.withSingleId(1)))
          .thenAnswer((_) => Future.value(Left(ServerFailure())));
    }

    Future<void> setUpMockGetTaskByIdForLocalFailure() async {
      when(mockGetTaskById(Params.withSingleId(1)))
          .thenAnswer((_) => Future.value(Left(LocalFailure())));
    }

    test("Initial state should be TaskInitialState", () {
      expect(blocWithMock.state, equals(TaskInitialState()));
    });

    blocTest(
      'Should throw an exception when input id is a string',
      build: () => bloc,
      act: (bloc) {
        bloc.add(const GetTaskByIdEvent(numberString: "abc"));
      },
      expect: () => <TaskBlocState>[
        TaskLoadingState(),
        const TaskErrorState(invalidInputFailureMessage),
      ],
    );

    blocTest(
      'Should throw an exception when input id negative number',
      build: () => bloc,
      act: (bloc) {
        bloc.add(const GetTaskByIdEvent(numberString: "-1"));
      },
      expect: () => <TaskBlocState>[
        TaskLoadingState(),
        const TaskErrorState(invalidInputFailureMessage),
      ],
    );

    blocTest(
      'Should emit the [TaskLoadingState,TaskErrorState] when a server failure occurs',
      build: () => bloc,
      act: (bloc) {
        setUpMockGetTaskByIdForServerFailure();
        bloc.add(const GetTaskByIdEvent(numberString: "1"));
      },
      expect: () => <TaskBlocState>[
        TaskLoadingState(),
        const TaskErrorState(serverFailureMessage),
      ],
    );

    blocTest(
      'Should emit the [TaskLoadingState,TaskErrorState] when a local failure occurs',
      build: () => bloc,
      act: (bloc) {
        setUpMockGetTaskByIdForLocalFailure();
        bloc.add(const GetTaskByIdEvent(numberString: "1"));
      },
      expect: () => <TaskBlocState>[
        TaskLoadingState(),
        const TaskErrorState(localFailureMessage),
      ],
    );
  });
}
