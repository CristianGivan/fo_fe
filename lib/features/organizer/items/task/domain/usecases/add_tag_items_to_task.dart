// file: usecases/add_tag_items_to_task.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

import '../repositories/task_repository.dart';

class AddTagItemsToTask
    extends UseCase<OrganizerItems<TagEntity>, AddTagItemsToTaskParams> {
  final TaskRepository repository;

  AddTagItemsToTask(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(
      AddTagItemsToTaskParams params) {
    return repository.addTagItemsToTask(params.taskId, params.tags);
  }
}

class AddTagItemsToTaskParams extends Equatable {
  final int taskId;
  final List<int> tags; // Assuming tag IDs are used to represent tags

  const AddTagItemsToTaskParams({
    required this.taskId,
    required this.tags,
  });

  @override
  List<Object> get props => [taskId, tags];
}
