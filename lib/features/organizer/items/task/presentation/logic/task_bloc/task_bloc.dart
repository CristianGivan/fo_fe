import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/no_params.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/add_items_to_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'task_bloc_task.dart';
part 'task_bloc_task_event.dart';
part 'task_bloc_task_state.dart';
part 'task_bloc_user.dart';
part 'task_bloc_user_event.dart';
part 'task_bloc_user_state.dart';
part 'task_reminder_link/task_reminder_link_bloc.dart';
part 'task_reminder_link/task_reminder_link_bloc_event.dart';
part 'task_reminder_link/task_reminder_link_bloc_state.dart';
part 'task_tag_link/task_tag_link_bloc.dart';
part 'task_tag_link/task_tag_link_bloc_event.dart';
part 'task_tag_link/task_tag_link_bloc_state.dart';

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case NetworkFailure:
      return 'Network error occurred';
    case ServerFailure:
      return 'Server error occurred';
    case CacheFailure:
      return 'Cache error occurred';
    default:
      return 'Unexpected error occurred';
  }
}
