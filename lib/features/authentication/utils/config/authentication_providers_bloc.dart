import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getAuthenticationBlocProviders() {
  return [
    BlocProvider<AuthenticationSignBloc>(
      create: (_) => GetIt.instance<AuthenticationSignBloc>(),
    ),
    BlocProvider<AuthenticationTokenBloc>(
      create: (_) => GetIt.instance<AuthenticationTokenBloc>(),
    ),
  ];
}
