import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class InsertUser extends UseCase<int, InsertUserParams> {
  final UserRepository repository;

  InsertUser(this.repository);

  @override
  Future<Either<Failure, int>> call(InsertUserParams params) {
    return repository.insertUser(params.user);
  }
}

class InsertUserParams extends Equatable {
  final UserEntity user;

  InsertUserParams({required this.user});

  @override
  List<Object> get props => [user];
}
