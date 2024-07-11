// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fo_fe/core/const/failures_message.dart';
// import 'package:fo_fe/core/error/failures.dart';
// import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
// import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_items_by_id_set.dart';
// import 'package:fo_fe/features/organizer/items/task/task_lib.dart';
// import 'package:mockito/mockito.dart';
//
// import '../../../../../../helpers/fixtures/elements/organizer_items_getters.dart';
// import '../../../../../../helpers/test_helper.mocks.dart';
//
// void main() {
//   late LoadTaskItemsByIdSet usecase;
//   late MockTaskRepository mockTaskRepository;
//   setUp(() {
//     mockTaskRepository = MockTaskRepository();
//     usecase = LoadTaskItemsByIdSet(mockTaskRepository);
//   });
//
//   final tIdSet = IdSet.of([1, 2, 3]);
//
//   OrganizerItems<TaskEntity> tTaskEntityList = getOrganizerItems3TaskEntity();
//
//   // test('should get a list of tasks from the repository', () async {
//   //   // Arrange
//   //   when(mockTaskRepository.getTaskItemsByIdSet(tIdSet))
//   //       .thenAnswer((_) async => Right(tTaskEntityList));
//   //
//   //   // Act
//   //   final result = await usecase(Params.withIdSet(tIdSet));
//   //
//   //   // Assert
//   //   expect(result, Right(tTaskEntityList));
//   //   verify(mockTaskRepository.getTaskItemsByIdSet(tIdSet));
//   //   verifyNoMoreInteractions(mockTaskRepository);
//   // });
//
//   test('should return a Failure when the repository call fails', () async {
//     // Arrange
//     const failure = ServerFailure(serverFailureMessage);
//     when(mockTaskRepository.getTaskItemsByIdSet(tIdSet))
//         .thenAnswer((_) async => Left(failure));
//
//     // Act
//     final result = await usecase(Params.withIdSet(tIdSet));
//
//     // Assert
//     expect(result, Left(failure));
//     verify(mockTaskRepository.getTaskItemsByIdSet(tIdSet));
//     verifyNoMoreInteractions(mockTaskRepository);
//   });
// }
