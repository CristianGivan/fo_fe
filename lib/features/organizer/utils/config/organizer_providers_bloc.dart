import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/logic/tag_cubit/tag_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/user/presentation/user_cubit.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getOrganizerBlocProviders() {
  return [
    BlocProvider<OrganizerCubit<TagEntity>>(create: (_) => GetIt.instance<TagCubit>()),
    BlocProvider<OrganizerCubit<UserEntity>>(create: (_) => GetIt.instance<UserCubit>()),
  ];
}
