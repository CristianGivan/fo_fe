// lib/features/organizer/items/user/presentation/screen/user_add_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserAddScreen extends StatefulWidget {
  const UserAddScreen({super.key});

  @override
  _UserAddScreenState createState() => _UserAddScreenState();
}

class _UserAddScreenState extends State<UserAddScreen> {
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  void _saveUser(BuildContext context) {
    final String userName = _userNameController.text;
    if (userName.isNotEmpty) {
      final user = UserEntity(name: userName);
      BlocProvider.of<UserBlocUser>(context).add(AddUserBlocEvent(user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userNameController,
              decoration: const InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            BlocConsumer<UserBlocUser, UserBlocState>(
              listener: (context, state) {
                if (state is UserSuccessBlocState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User saved successfully')),
                  );
                  context.pop();
                } else if (state is UserErrorBlocState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is UserLoadingBlocState) {
                  return CircularProgressIndicator();
                }
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _saveUser(context),
                    child: const Text('Save User'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
