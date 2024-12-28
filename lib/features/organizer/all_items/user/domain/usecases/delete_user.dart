import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';

class DeleteUser extends UseCase<int, DeleteUserParams> {
  final UserRepository repository;

  DeleteUser(this.repository);

  @override
  Future<Either<Failure, int>> call(DeleteUserParams params) {
    return repository.deleteUser(params.userId);
  }
}

class DeleteUserParams extends Equatable {
  final int userId;

  const DeleteUserParams({required this.userId});

  @override
  List<Object> get props => [userId];
}
