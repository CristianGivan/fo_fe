import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getUserBlocProviders() {
  return [
    BlocProvider<UserBloc>(
      create: (_) => GetIt.instance<UserBloc>(),
    ),
    BlocProvider<UserValidationBloc>(
      create: (_) => GetIt.instance<UserValidationBloc>(),
    ),
  ];
}
