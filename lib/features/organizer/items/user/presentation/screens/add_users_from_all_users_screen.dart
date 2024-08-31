import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class AddUsersFromAllUsersScreen extends StatefulWidget {
  final int userId;

  const AddUsersFromAllUsersScreen({super.key, required this.userId});

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

  // Accessing userId from the superclass (AddUsersFromAllUsersScreen)
  Future<void> _addSelectedUsers() async {
    final userId = widget.userId; // Accessing userId from the widget instance

    for (var user in _selectedUsers) {
      context.read<UserBlocUser>().add(AddUserToUserBlocEvent(
            userLinkedId: user.id,
            userId: userId,
          ));
    }

    // Navigate back to the previous screen (UserScreen)
    Navigator.of(context).pop();
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
        buildWhen: (previous, current) {
          // Only rebuild if the current state is UserBlocLoadedState
          return current is UserAllItemsLoadedBlocState;
        },
        builder: (context, state) {
          if (state is UserLoadingBlocState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserAllItemsLoadedBlocState) {
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
          } else if (state is UserErrorBlocState) {
            return Center(child: Text('Failed to load users'));
          }
          return Center(child: Text('???'));
        },
      ),
    );
  }
}
