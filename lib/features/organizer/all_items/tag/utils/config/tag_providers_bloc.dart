import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_bloc/tag_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_cubit/tag_cubit.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getTagBlocProviders() {
  return [
    BlocProvider<TagBloc>(
      create: (_) => GetIt.instance<TagBloc>(),
    ),
    BlocProvider<TagCubit>(
      create: (_) => GetIt.instance<TagCubit>(),
    ),
  ];
}
