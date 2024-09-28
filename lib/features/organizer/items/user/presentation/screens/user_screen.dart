import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/presentation/pages/user_management_actions_page.dart';
import 'package:fo_fe/features/organizer/items/user/presentation/widgets/user_info_widget.dart';
import 'package:fo_fe/features/organizer/items/user/presentation/widgets/user_list_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: BlocBuilder<AuthenticationBlocSession,
          AuthenticationBlocSessionState>(
        builder: (context, state) {
          if (state is AuthenticationSessionAuthenticated) {
            final userId = state.authEntity.userId;

            return Column(
              children: [
                UserInfoWidget(userId: userId),
                // Pass userId to widget
                Expanded(child: UserListWidget(userId: userId)),
                // Pass userId to widget
                UserManagementActionsPage(userId: userId),
                // Pass userId to widget
              ],
            );
          } else {
            return const Center(
                child:
                    CircularProgressIndicator()); // Handle other states or loading
          }
        },
      ),
    );
  }
}
