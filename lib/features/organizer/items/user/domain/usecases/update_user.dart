import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class UpdateUser extends UseCase<bool, UpdateUserParams> {
  final UserRepository repository;

  UpdateUser(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdateUserParams params) {
    return repository.updateUser(params.user);
  }
}

class UpdateUserParams extends Equatable {
  final UserEntity user;

  const UpdateUserParams({required this.user});

  @override
  List<Object> get props => [user];
}
