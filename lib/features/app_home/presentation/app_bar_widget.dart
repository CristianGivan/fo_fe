import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AuthLogBloc, AuthLogBlocState>(
          builder: (context, state) {
            if (state is AuthLogLoadingBlocState) {
              return const CircularProgressIndicator();
            } else if (state is AuthAuthenticatedBlocState) {
              return _buildAuthenticatedTitle(context, state.authEntity);
            } else {
              return Text(title);
            }
          },
        ),
        BlocBuilder<AuthLogBloc, AuthLogBlocState>(
          builder: (context, state) {
            if (state is AuthAuthenticatedBlocState) {
              final authEntity = (state as dynamic).authEntity;
              return IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  context.read<AuthLogBloc>().add(
                        AuthLogOutBlocEvent(authId: authEntity.id),
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
