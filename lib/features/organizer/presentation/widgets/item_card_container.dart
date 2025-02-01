import 'package:fo_fe/core/utils/exports/external_exports.dart';

typedef StatusChangeCallback = Future<bool> Function(
    DismissDirection direction, BuildContext context);

class ItemCardContainer extends StatelessWidget {
  final Function() onTap;
  final Function() onLongPress;
  final StatusChangeCallback onConfirmDismiss;
  final Widget child;

  const ItemCardContainer({
    super.key,
    required this.onTap,
    required this.onLongPress,
    required this.onConfirmDismiss,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Dismissible(
        key: Key('${DateTime.now().millisecondsSinceEpoch}'), //todo -learn- what shall I put at key
        direction: DismissDirection.horizontal,
        confirmDismiss: (direction) async => onConfirmDismiss(direction, context),
        background: _buildSwipeActionBackground(Icons.arrow_forward, Colors.green),
        secondaryBackground: _buildSwipeActionBackground(Icons.arrow_back, Colors.red),
        child: child,
      ),
    );
  }

  Widget _buildSwipeActionBackground(IconData icon, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
