import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fo_fe/core/const/error_message.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/input_converter.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';
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

  void setUpFailureForValidInput() {
    when(mockInputConverter.stringToUnasingInteger("abc"))
        .thenReturn(Left(InvalidInputFailure()));
  }

  group("TaskBLoc", () {
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

    // blocTest(
    //   'Should throw an exception when input id negative number',
    //   build: () => bloc,
    //   act: (bloc) {
    //     setUpFailureForInvalidInput();
    //     bloc.add(const GetTaskByIdEvent(numberString: "1"));
    //   },
    //   expect: () => <TaskBlocState>[
    //     TaskLoadingState(),
    //     const TaskLoadedState(invalidInputFailureMessage),
    //   ],
    // );
  });
}
