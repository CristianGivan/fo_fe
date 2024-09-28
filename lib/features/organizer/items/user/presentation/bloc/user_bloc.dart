import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/no_params.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/user_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';
part 'user_bloc_user.dart';

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
