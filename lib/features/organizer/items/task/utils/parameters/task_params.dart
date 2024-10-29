import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AddItemsToTaskParams extends Equatable {
  final int taskId;
  final IdSet itemsIds;

  const AddItemsToTaskParams({
    required this.taskId,
    required this.itemsIds,
  });

  @override
  List<Object> get props => [taskId, itemsIds];
}

class InsertTaskParams extends Equatable {
  final TaskEntity task;

  const InsertTaskParams({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateItemsToTaskParams<T extends OrganizerItemEntity> extends Equatable {
  final int taskId;
  final OrganizerItems<T> items;
  final OrganizerItems<T> updatedItems;

  const UpdateItemsToTaskParams({
    required this.taskId,
    required this.items,
    required this.updatedItems,
  });

  @override
  List<Object> get props => [taskId, items, updatedItems];
}
