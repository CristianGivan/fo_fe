import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class UserInfoWidget extends StatelessWidget {
  final int userId;

  UserInfoWidget({required this.userId});

  @override
  Widget build(BuildContext context) {
    // Trigger the event to fetch the user details by ID when the widget is built
    context.read<UserBlocUser>().add(GetUserByIdBlocEvent(id: userId));

    return BlocBuilder<UserBlocUser, UserBlocState>(
      buildWhen: (previous, current) {
        // Only rebuild if the current state is UserBlocLoadedState
        return current is UserLoadedBlocState;
      },
      builder: (context, state) {
        if (state is UserLoadingBlocState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserLoadedBlocState) {
          final user = state.user;

          // Display the user details
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${user.name}'),
                Text('Email: ${user.email}'),
              ],
            ),
          );
        } else if (state is UserErrorBlocState) {
          return Center(child: Text('Failed to load user'));
        }
        return Container(); // Empty container for irrelevant states
      },
    );
  }
}
