import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class DeleteUserFromUser extends UseCase<int, DeleteUserFromUserParams> {
  final UserRepository repository;

  DeleteUserFromUser(this.repository);

  @override
  Future<Either<Failure, int>> call(DeleteUserFromUserParams params) {
    return repository.deleteUserFromUser(params.userLinkedId, params.userId);
  }
}

class DeleteUserFromUserParams extends Equatable {
  final int userLinkedId;
  final int userId;

  const DeleteUserFromUserParams({required this.userLinkedId, required this.userId});

  @override
  List<Object> get props => [userLinkedId, userId];
}
