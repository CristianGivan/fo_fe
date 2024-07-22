import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/authentication/domain/usecases/sign_up.dart';

import '../../../../core/util/organizer/core_util_organizer.dart';

part 'authentication_bloc_authentication.dart';
part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case NetworkFailure:
      return 'Network error occurred';
    case ServerFailure:
      return 'Server error occurred';
    case AuthenticationFailure:
      return 'Authentication failed';
    default:
      return 'Unexpected error occurred';
  }
}
