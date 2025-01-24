import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetTagItemsFromLogInUserUseCase extends UseCase<OrganizerItems<TagDto>, ItemParams> {
  final TagRepository repository;

  GetTagItemsFromLogInUserUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagDto>>> call(params) async {
    return Future.value(Left(UnexpectedFailure("Invalid params")));
  }
}
