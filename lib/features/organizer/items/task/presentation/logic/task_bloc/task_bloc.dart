import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

part 'task_bloc_reminder.dart';
part 'task_bloc_reminder_event.dart';
part 'task_bloc_reminder_state.dart';
part 'task_bloc_tag.dart';
part 'task_bloc_tag_event.dart';
part 'task_bloc_tag_state.dart';
part 'task_bloc_task.dart';
part 'task_bloc_task_event.dart';
part 'task_bloc_task_state.dart';
part 'task_bloc_user.dart';
part 'task_bloc_user_event.dart';
part 'task_bloc_user_state.dart';

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
