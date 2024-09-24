import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';

class AddTag extends UseCase<int, AddTagParams> {
  final TagRepository repository;

  AddTag(this.repository);

  @override
  Future<Either<Failure, int>> call(AddTagParams params) async {
    return await repository.addTag(params.tag);
  }
}

class AddTagParams extends Equatable {
  final TagEntity tag;

  const AddTagParams({required this.tag});

  @override
  List<Object?> get props => [tag];
}
