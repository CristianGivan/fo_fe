import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getReminderBlocProviders() {
  return [
    BlocProvider<ReminderBloc>(
      create: (_) => GetIt.instance<ReminderBloc>(),
    ),
  ];
}
