import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/router/organizer_bloc_providers.dart';

MultiBlocProvider appBlocProviders({
  required Widget child,
}) {
  return MultiBlocProvider(
    providers: [...getOrganizerBlocProviders()],
    child: child,
  );
}
