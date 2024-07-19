import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/usecases/reminder_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';

part 'reminder_bloc_event.dart';
part 'reminder_bloc_reminder.dart';
part 'reminder_bloc_state.dart';

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
