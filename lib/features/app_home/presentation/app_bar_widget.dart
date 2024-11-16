import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/auth/utils/auth_exports.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AuthSignBloc, AuthSignBlocState>(
          builder: (context, state) {
            if (state is AuthSignInAutoSuccessBlocState) {
              return _buildAuthenticatedTitle(context, state.authEntity);
            } else if (state is AuthSignInSuccessBlocState) {
              return _buildAuthenticatedTitle(context, state.authEntity);
            } else if (state is AuthSignUpSuccessBlocState) {
              return _buildAuthenticatedTitle(context, state.authEntity);
            } else if (state is AuthSignLoadingBlocState) {
              return const CircularProgressIndicator();
            } else {
              return Text(title);
            }
          },
        ),
        BlocBuilder<AuthSignBloc, AuthSignBlocState>(
          builder: (context, state) {
            if (state is AuthSignInAutoSuccessBlocState ||
                state is AuthSignInSuccessBlocState ||
                state is AuthSignUpSuccessBlocState) {
              final authEntity = (state as dynamic).authEntity;
              return IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  context.read<AuthSignBloc>().add(
                        AuthSignOutBlocEvent(authId: authEntity.id),
                      );
                  context.pushNamed(AuthRouterNames.authRouteName);
                },
              );
            } else {
              return Container(); // Return an empty container if not authenticated
            }
          },
        ),
      ],
    );
  }

  Widget _buildAuthenticatedTitle(BuildContext context, AuthEntity authEntity) {
    return Text('Welcome, authId: ${authEntity.id}, userId: ${authEntity.userId}');
  }
}
