import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:get_it/get_it.dart';

List<BlocProvider> getAuthenticationBlocProviders() {
  return [
    BlocProvider<AuthenticationBlocSession>(
      create: (_) => GetIt.instance<AuthenticationBlocSession>(),
    ),
    BlocProvider<AuthenticationBlocToken>(
      create: (_) => GetIt.instance<AuthenticationBlocToken>(),
    ),
    BlocProvider<AuthenticationSignUp>(
      create: (_) => GetIt.instance<AuthenticationSignUp>(),
    ),
    BlocProvider<AuthenticationBlocSignIn>(
      create: (_) => GetIt.instance<AuthenticationBlocSignIn>(),
    ),
  ];
}
