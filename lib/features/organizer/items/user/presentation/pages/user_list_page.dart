import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserListPage extends StatelessWidget {
  final Function(UserEntity) onSelectUser;
  final OrganizerItems<UserEntity> selectedUsers;

  UserListPage({
    Key? key,
    required this.onSelectUser,
    required this.selectedUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        if (state is UserLoadingBlocState) {
          return _buildLoadingIndicator();
        } else if (state is UserItemsLoadedBlocState) {
          return _buildUserList(state);
        } else if (state is UserErrorBlocState) {
          return _buildErrorMessage(state);
        } else {
          return _buildNoUsersMessage();
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildUserList(UserItemsLoadedBlocState state) {
    return ListView.builder(
      itemCount: state.userItems.size(),
      itemBuilder: (context, index) {
        final user = state.userItems.getAt(index);
        final isSelected = selectedUsers.contains(user);

        return ListTile(
          title: Text(user.name),
          trailing: Icon(
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          ),
          onTap: () => onSelectUser(user),
        );
      },
    );
  }

  Widget _buildErrorMessage(UserErrorBlocState state) {
    return Center(child: Text(state.errorMessage));
  }

  Widget _buildNoUsersMessage() {
    return const Center(child: Text('No Users Available'));
  }
}
