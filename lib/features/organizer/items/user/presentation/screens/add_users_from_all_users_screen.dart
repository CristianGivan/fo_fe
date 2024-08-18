import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class AddUsersFromAllUsersScreen extends StatefulWidget {
  @override
  _AddUsersFromAllUsersScreenState createState() =>
      _AddUsersFromAllUsersScreenState();
}

class _AddUsersFromAllUsersScreenState
    extends State<AddUsersFromAllUsersScreen> {
  final List<UserEntity> _selectedUsers = [];

  @override
  void initState() {
    super.initState();
    // Trigger the event to fetch all users when the screen loads
    context.read<UserBlocUser>().add(GetUserItemsAllBlocEvent());
  }

  void _toggleUserSelection(UserEntity user) {
    setState(() {
      if (_selectedUsers.contains(user)) {
        _selectedUsers.remove(user);
      } else {
        _selectedUsers.add(user);
      }
    });
  }

//todo cg this logic shall be here?
  Future<void> _addSelectedUsers() async {
    final authenticationBloc = context.read<AuthenticationBlocSession>();
    // Create an instance of DeviceInfo
    final deviceInfo = DeviceInfo();

    authenticationBloc.add(GetLoggedInUserIdBlocEvent(deviceInfo: deviceInfo));

    final state = await authenticationBloc.stream.firstWhere((state) =>
        state is AuthenticationUserIdLoaded ||
        state is AuthenticationSessionError);

    if (state is AuthenticationUserIdLoaded) {
      final loggedInUserId = state.userId;

      for (var user in _selectedUsers) {
        context.read<UserBlocUser>().add(AddUserToUserBlocEvent(
            userLinkedId: user.id, userId: loggedInUserId));
      }

      // Navigate back to the previous screen (UserScreen)
      Navigator.of(context).pop();
    } else {
      // Handle error state, show a message, etc.
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to get logged-in user ID')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _addSelectedUsers,
          ),
        ],
      ),
      body: BlocBuilder<UserBlocUser, UserBlocState>(
        builder: (context, state) {
          if (state is UserBlocLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserBlocItemsLoaded) {
            return ListView.builder(
              itemCount: state.users.size(),
              itemBuilder: (context, index) {
                final user = state.users.getAt(index);
                final isSelected = _selectedUsers.contains(user);
                return ListTile(
                  title: Text(user.name),
                  // Assuming UserEntity has a 'name' field
                  trailing: isSelected
                      ? Icon(Icons.check_box)
                      : Icon(Icons.check_box_outline_blank),
                  onTap: () => _toggleUserSelection(user),
                );
              },
            );
          } else if (state is UserBlocError) {
            return Center(child: Text('Failed to load users'));
          }
          return Container();
        },
      ),
    );
  }
}
