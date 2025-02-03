import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/widgets/item_card_container.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserCard extends StatelessWidget {
  final UserEntity userEntity;

  const UserCard(
    this.userEntity, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemCardContainer(
      onTap: () => _handleTap(context),
      onLongPress: () => _handleLongPress(context),
      onConfirmDismiss: (direction, context) => _handleConfirmDismiss(direction, context),
      child: _build(context),
    );
  }

  void _handleTap(BuildContext context) {
    context.pushNamed(UserRouterNames.userViewRouteName, extra: userEntity.id);
  }

  void _handleLongPress(BuildContext context) {
    context.pushNamed(UserRouterNames.userUpdateRouteName, extra: userEntity.id);
  }

  Future<bool> _handleConfirmDismiss(DismissDirection direction, BuildContext context) async {
    return true;
  }

  Widget _build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              userEntity.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
