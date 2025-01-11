import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_bloc/task_items_link/item_link_items_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_cubit/task_form_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getTaskBlocProviders() {
  return [
    BlocProvider<TaskBloc>(
      create: (_) => GetIt.instance<TaskBloc>(),
    ),
    BlocProvider<ItemLinkItemsBloc<TagEntity>>(
      create: (_) => GetIt.instance<ItemLinkItemsBloc<TagEntity>>(),
    ),
    BlocProvider<ItemLinkItemsBloc<UserEntity>>(
      create: (_) => GetIt.instance<ItemLinkItemsBloc<UserEntity>>(),
    ),
    BlocProvider<TaskFormCubit>(
      create: (_) => GetIt.instance<TaskFormCubit>(),
    ),
  ];
}
