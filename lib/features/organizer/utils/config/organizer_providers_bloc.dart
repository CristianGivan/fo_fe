import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getOrganizerBlocProviders() {
  return [
    BlocProvider<TaskBloc>(
      create: (_) => GetIt.instance<TaskBloc>(),
    ),
  ];
}
