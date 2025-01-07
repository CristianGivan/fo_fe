import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/presentation/pages/user_management_actions_page.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserScreen extends StatefulWidget {
  final OrganizerItems<UserEntity> userItems;

  const UserScreen({super.key, required this.userItems});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late OrganizerItems<UserEntity> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = widget.userItems;
  }

  @override
  Widget build(BuildContext context) {
    _loadUsers(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(selectedItems);
          },
        ),
      ),
      body: Column(
        children: [
          const Center(child: Text('All Users:')),
          _buildUserList(context),
          _buildUserManagementActions(),
        ],
      ),
    );
  }

  void _loadUsers(BuildContext context) {
    final auth = context.read<AuthLogBloc>().state;
    if (auth is AuthAuthenticatedBlocState) {
      context.read<UserBloc>().add(GetLinkedUserItemsBlocEvent(
          UserParams(user: auth.userEntity, userId: auth.userEntity.id)));
    }
  }

  Widget _buildUserList(BuildContext context) {
    return Expanded(
      child: UserListPage(
        onSelectUser: (user) {
          setState(() {
            var builder = selectedItems.toBuilder();
            builder.contains(user) ? builder.remove(user) : builder.add(user);
            selectedItems = builder.build();
          });
        },
        selectedUsers: selectedItems,
      ),
    );
  }

  Widget _buildUserManagementActions() {
    return UserManagementActionsPage(selectedUsers: selectedItems);
  }
}
