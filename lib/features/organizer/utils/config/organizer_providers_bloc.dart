import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_cubit/tag_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/presentation/user_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getOrganizerBlocProviders() {
  return [
    BlocProvider<OrganizerBloc<TaskDto>>(create: (_) => GetIt.instance<TaskBloc>()),
    BlocProvider<OrganizerBloc<TagDto>>(create: (_) => GetIt.instance<TagBloc>()),
    BlocProvider<OrganizerCubit<TagEntity>>(create: (_) => GetIt.instance<TagCubit>()),
    BlocProvider<OrganizerCubit<UserEntity>>(create: (_) => GetIt.instance<UserCubit>()),
  ];
}
