import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/auth/utils/auth_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getAuthBlocProviders() {
  return [
    BlocProvider<AuthSignBloc>(
      create: (_) => GetIt.instance<AuthSignBloc>(),
    ),
    BlocProvider<AuthTokenBloc>(
      create: (_) => GetIt.instance<AuthTokenBloc>(),
    ),
  ];
}
