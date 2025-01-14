import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/presentation/user_presentation_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

ErrorSink createItemBloc<T extends DtoEntity>(ItemsTypeEnum itemType) {
  switch (itemType) {
    case ItemsTypeEnum.taskUser:
      return _userBloc();
    default:
      throw UnsupportedError('Unsupported itemType: $itemType');
  }
}

dynamic _userBloc() {
  return UserBloc(
    addUser: GetIt.instance.get(),
    updateUser: GetIt.instance.get(),
    deleteUser: GetIt.instance.get(),
    getUserById: GetIt.instance.get(),
    addUserToUser: GetIt.instance.get(),
    deleteUserFromUser: GetIt.instance.get(),
    getUserItemsByIdSet: GetIt.instance.get(),
    getUserItemsByUserId: GetIt.instance.get(),
    getUserAndLinkedUserItems: GetIt.instance.get(),
  );
}

TaskBloc _taskBloc() {
  return TaskBloc(
    addTask: GetIt.instance.get(),
    deleteTask: GetIt.instance.get(),
    sortTasksUseCase: GetIt.instance.get(),
    filterTasksUseCase: GetIt.instance.get(),
    updateTaskDtoUseCase: GetIt.instance.get(),
    getTasks: GetIt.instance.get(),
    exportTaskToExcelUseCase: GetIt.instance.get(),
  );
}
