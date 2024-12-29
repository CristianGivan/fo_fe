import 'package:fo_fe/core/widgets/core_widget_exports.dart';

import '../../utils/exports/external_exports.dart';

class NavigationMenu extends StatelessWidget {
  final List<MenuButton> buttons;

  const NavigationMenu({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttons.map((button) => Center(child: button)).toList(),
    );
  }
}
