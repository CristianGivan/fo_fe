import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/bloc/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/cubit/tag_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getTagBlocProviders() {
  return [
    BlocProvider<TagBlocTag>(
      create: (_) => GetIt.instance<TagBlocTag>(),
    ),
    BlocProvider<TagCubit>(
      create: (_) => GetIt.instance<TagCubit>(),
    ),
    BlocProvider<TagBloc>(
      create: (_) => GetIt.instance<TagBloc>(),
    ),
  ];
}
