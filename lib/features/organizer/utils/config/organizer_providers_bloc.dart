import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getOrganizerBlocProviders() {
  return [
    BlocProvider<TaskBloc>(
      create: (_) => GetIt.instance<TaskBloc>(),
    ),
    BlocProvider<TaskUserLinkBloc>(
      create: (_) => GetIt.instance<TaskUserLinkBloc>(),
    ),
    BlocProvider<TaskTagLinkBloc>(
      create: (_) => GetIt.instance<TaskTagLinkBloc>(),
    ),
    BlocProvider<TaskReminderLinkBloc>(
      create: (_) => GetIt.instance<TaskReminderLinkBloc>(),
    ),
    // Add more BlocProviders as needed
  ];
}
