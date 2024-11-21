import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/auth_sign_bloc/auth_sign_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_in_auto_bloc/sign_in_auto_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/auth_token_bloc/auth_token_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/auth_user_bloc/auth_user_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_out_bloc/sign_out_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getAuthBlocProviders() {
  return [
    BlocProvider<AuthSignBloc>(
      create: (_) => GetIt.instance<AuthSignBloc>(),
    ),
    BlocProvider<AuthTokenBloc>(
      create: (_) => GetIt.instance<AuthTokenBloc>(),
    ),
    BlocProvider<SignInAutoBloc>(
      create: (_) => GetIt.instance<SignInAutoBloc>(),
    ),
    BlocProvider<AuthUserBloc>(
      create: (_) => GetIt.instance<AuthUserBloc>(),
    ),
    BlocProvider<SignInBloc>(
      create: (_) => GetIt.instance<SignInBloc>(),
    ),
    BlocProvider<SignOutBloc>(
      create: (_) => GetIt.instance<SignOutBloc>(),
    ),
    BlocProvider<SignUpBloc>(
      create: (_) => GetIt.instance<SignUpBloc>(),
    ),
  ];
}
