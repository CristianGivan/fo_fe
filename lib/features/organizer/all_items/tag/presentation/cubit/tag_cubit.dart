import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/get_tag_items_all_use_case.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagCubit extends Cubit<Either<Failure, OrganizerItems<TagEntity>>> {
  final GetTagItemsAllUseCase getTagItemsAllUseCase;

  TagCubit({required this.getTagItemsAllUseCase}) : super(Right(OrganizerItems.empty()));

  Future<void> fetchTags() async {
    final result = await getTagItemsAllUseCase(NoParams());
    emit(result);
  }
}