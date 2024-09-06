import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';

class GetTagById extends UseCase<TagEntity?, GetTagByIdParams> {
  final TagRepository repository;

  GetTagById(this.repository);

  @override
  Future<Either<Failure, TagEntity?>> call(GetTagByIdParams params) async {
    return await repository.getTagById(params.id);
  }
}

class GetTagByIdParams extends Equatable {
  final int id;

  const GetTagByIdParams({required this.id});

  @override
  List<Object?> get props => [id];
}
