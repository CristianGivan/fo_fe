import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

class GetUserById extends UseCase<UserEntity, GetUserByIdParams> {
  final UserRepository repository;

  GetUserById(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(GetUserByIdParams params) {
    return repository.getUserById(params.id);
  }
}

class GetUserByIdParams extends Equatable {
  final int id;

  GetUserByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}
