import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';

class InsertTag extends UseCase<int, InsertTagParams> {
  final TagRepository repository;

  InsertTag(this.repository);

  @override
  Future<Either<Failure, int>> call(InsertTagParams params) async {
    return await repository.insertTag(params.tag);
  }
}

class InsertTagParams extends Equatable {
  final TagEntity tag;

  InsertTagParams({required this.tag});

  @override
  List<Object?> get props => [tag];
}
