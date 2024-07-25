import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getAuthenticationBlocProviders() {
  return [
    BlocProvider<AuthenticationBlocSession>(
      create: (_) => GetIt.instance<AuthenticationBlocSession>(),
    ),
    BlocProvider<AuthenticationBlocToken>(
      create: (_) => GetIt.instance<AuthenticationBlocToken>(),
    ),
    BlocProvider<AuthenticationBlocSignUp>(
      create: (_) => GetIt.instance<AuthenticationBlocSignUp>(),
    ),
    BlocProvider<AuthenticationBlocSignIn>(
      create: (_) => GetIt.instance<AuthenticationBlocSignIn>(),
    ),
  ];
}
