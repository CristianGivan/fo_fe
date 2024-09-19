import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/no_params.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/add_tag_items_to_task.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

part 'task_bloc_reminder.dart';
part 'task_bloc_reminder_event.dart';
part 'task_bloc_reminder_state.dart';
part 'task_bloc_task.dart';
part 'task_bloc_task_event.dart';
part 'task_bloc_task_state.dart';
part 'task_bloc_user.dart';
part 'task_bloc_user_event.dart';
part 'task_bloc_user_state.dart';
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
