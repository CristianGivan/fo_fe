import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:get_it/get_it.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_cubit/task_form_cubit.dart';

List<BlocProvider> getTaskBlocProviders() {
  return [
    BlocProvider<TaskBloc>(
      create: (_) => GetIt.instance<TaskBloc>(),
    ),
    BlocProvider<TaskFormCubit>(
      create: (_) => GetIt.instance<TaskFormCubit>(),
    ),
  ];
}
