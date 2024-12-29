import 'package:flutter/material.dart';
import 'package:fo_fe/core/widgets/pages/app_bottom_bar_menu.dart';

class ScreenBottomBarSameMenu extends StatelessWidget {
  final List<PopupMenuEntry> menuOptions;
  final VoidCallback onSearchSubmitted;

  const ScreenBottomBarSameMenu({
    required this.menuOptions,
    required this.onSearchSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBottomBarPage(
        leftMenuOptions: menuOptions,
        onSearchSubmitted: onSearchSubmitted,
        rightMenuOptions: menuOptions);
  }
}
