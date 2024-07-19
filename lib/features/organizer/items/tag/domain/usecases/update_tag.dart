import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';

class UpdateTag extends UseCase<bool, UpdateTagParams> {
  final TagRepository repository;

  UpdateTag(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdateTagParams params) async {
    return await repository.updateTag(params.tag);
  }
}

class UpdateTagParams extends Equatable {
  final TagEntity tag;

  UpdateTagParams({required this.tag});

  @override
  List<Object?> get props => [tag];
}
