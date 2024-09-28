import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class AddUser extends UseCase<int, AddUserParams> {
  final UserRepository repository;

  AddUser(this.repository);

  @override
  Future<Either<Failure, int>> call(AddUserParams params) {
    return repository.addUser(params.user);
  }
}

class AddUserParams extends Equatable {
  final UserEntity user;

  const AddUserParams({required this.user});

  @override
  List<Object> get props => [user];
}
