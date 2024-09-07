import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/config/organizer_providers_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_providers_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_providers_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

MultiBlocProvider appBlocProviders({
  required Widget child,
}) {
  return MultiBlocProvider(
    providers: [
      ...getOrganizerBlocProviders(),
      ...getAuthenticationBlocProviders(),
      ...getUserBlocProviders(),
      ...getTaskBlocProviders(),
      ...getTagBlocProviders()
    ],
    child: child,
  );
}
