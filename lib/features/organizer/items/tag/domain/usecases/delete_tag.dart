import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/repositories/tag_repository.dart';

class DeleteTag extends UseCase<int, DeleteTagParams> {
  final TagRepository repository;

  DeleteTag(this.repository);

  @override
  Future<Either<Failure, int>> call(DeleteTagParams params) async {
    return await repository.deleteTag(params.tagId);
  }
}

class DeleteTagParams extends Equatable {
  final int tagId;

  const DeleteTagParams({required this.tagId});

  @override
  List<Object?> get props => [tagId];
}
