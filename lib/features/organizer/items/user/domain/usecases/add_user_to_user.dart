import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class AddUserToUser extends UseCase<int, AddUserToUserParams> {
  final UserRepository repository;

  AddUserToUser(this.repository);

  @override
  Future<Either<Failure, int>> call(AddUserToUserParams params) {
    return repository.addUserToUser(params.userLinkedId, params.userId);
  }
}

class AddUserToUserParams extends Equatable {
  final int userLinkedId;
  final int userId;

  const AddUserToUserParams({required this.userLinkedId, required this.userId});

  @override
  List<Object> get props => [userLinkedId, userId];
}
