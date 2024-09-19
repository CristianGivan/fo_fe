import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getOrganizerBlocProviders() {
  return [
    BlocProvider<TaskBlocTask>(
      create: (_) => GetIt.instance<TaskBlocTask>(),
    ),
    BlocProvider<TaskBlocUser>(
      create: (_) => GetIt.instance<TaskBlocUser>(),
    ),
    BlocProvider<TaskTagLinkBloc>(
      create: (_) => GetIt.instance<TaskTagLinkBloc>(),
    ),
    BlocProvider<TaskBlocReminder>(
      create: (_) => GetIt.instance<TaskBlocReminder>(),
    ),
    // Add more BlocProviders as needed
  ];
}
