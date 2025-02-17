import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:go_router/go_router.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarPage({super.key, this.title = "Title"});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.pop();
        },
      ),
      title: Row(
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
                          AuthLogOutBlocEvent(authId: authEntity.idSet),
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
      ),
    );
  }

  Widget _buildAuthenticatedTitle(BuildContext context, AuthEntity authEntity) {
    return Text('$title, authId: ${authEntity.id}, userId: ${authEntity.userId}');
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
