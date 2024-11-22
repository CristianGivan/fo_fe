import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/auth_sign_bloc/auth_log_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/auth_token_bloc/auth_token_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getAuthBlocProviders() {
  return [
    BlocProvider<AuthLogBloc>(
      create: (_) => GetIt.instance<AuthLogBloc>(),
    ),
    BlocProvider<AuthTokenBloc>(
      create: (_) => GetIt.instance<AuthTokenBloc>(),
    ),
    BlocProvider<SignUpBloc>(
      create: (_) => GetIt.instance<SignUpBloc>(),
    ),
  ];
}
