import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserManagementActionsPage extends StatelessWidget {
  final OrganizerItems<UserEntity> selectedUsers;

  UserManagementActionsPage({super.key, OrganizerItems<UserEntity>? selectedUsers})
      : selectedUsers = selectedUsers ?? OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.pushNamed(UserRouterNames.userAddRouteName),
                  child: const Text('Add User'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (!selectedUsers.isEmpty) {
                      context.pop(selectedUsers);
                    } else {
                      context.pop();
                    }
                  },
                  child: const Text('Link'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => showFilterDialog(context),
                  child: const Text('Filter Users'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => showSortDialog(context),
                  child: const Text('Sort Users'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Enter user description',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

void showFilterDialog(BuildContext context) {
  // Implement the filter dialog for users
}

void showSortDialog(BuildContext context) {
  // Implement the sort dialog for users
}
