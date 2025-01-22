import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/get_task_link_handler.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/update_task_link_handler.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GenericHandlerRegistry {
  final Map<Type, GetTaskLinkHandler> _getHandlers = {};
  final Map<Type, UpdateTaskLinkHandler> _updateHandlers = {};

  void registerGetHandler<T extends ItemEntity>(GetTaskLinkHandler<T> handler) {
    _getHandlers[T] = handler;
  }

  GetTaskLinkHandler<ItemEntity>? getGetHandler<T extends ItemEntity>() {
    return _getHandlers[T];
  }

  void registerUpdateHandler<T extends ItemEntity>(UpdateTaskLinkHandler<T> handler) {
    _updateHandlers[T] = handler;
  }

  UpdateTaskLinkHandler<ItemEntity>? getUpdateHandler<T extends ItemEntity>() {
    return _updateHandlers[T];
  }
}
