import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/utils/config/auth_providers_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/config/reminder_providers_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/config/tag_providers_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/config/task_providers_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/config/organizer_providers_bloc.dart';

MultiBlocProvider appBlocProviders({
  required Widget child,
}) {
  return MultiBlocProvider(
    providers: [
      ...getOrganizerBlocProviders(),
      ...getAuthBlocProviders(),
      ...getUserBlocProviders(),
      ...getTaskBlocProviders(),
      ...getTagBlocProviders(),
      ...getReminderBlocProviders()
    ],
    child: child,
  );
}
