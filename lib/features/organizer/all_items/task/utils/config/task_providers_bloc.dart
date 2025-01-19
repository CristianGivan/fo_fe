import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_cubit/task_form_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getTaskBlocProviders() {
  return [
    BlocProvider<TaskBloc>(create: (_) => GetIt.instance<TaskBloc>()),
    BlocProvider<TaskFormCubit>(create: (_) => GetIt.instance<TaskFormCubit>()),
  ];
}
