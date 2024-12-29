import 'package:flutter/material.dart';

class AppBottomBarPage extends StatefulWidget {
  final List<PopupMenuEntry> leftMenuOptions;
  final VoidCallback onSearchSubmitted;
  final List<PopupMenuEntry> rightMenuOptions;

  const AppBottomBarPage({
    required this.leftMenuOptions,
    required this.onSearchSubmitted,
    required this.rightMenuOptions,
    super.key,
  });

  @override
  _AppBottomBarPageState createState() => _AppBottomBarPageState();
}

class _AppBottomBarPageState extends State<AppBottomBarPage> {
  bool _isLeftMenuOpen = false;
  bool _isRightMenuOpen = false;

  final double _menuWidth = 100; // Width of the menu when open

  void _toggleLeftMenu(bool isOpen) {
    setState(() {
      _isLeftMenuOpen = isOpen;
    });
  }

  void _toggleRightMenu(bool isOpen) {
    setState(() {
      _isRightMenuOpen = isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Left Menu Button
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => widget.leftMenuOptions,
            onCanceled: () => _toggleLeftMenu(false),
            onSelected: (_) => _toggleLeftMenu(false),
            onOpened: () => _toggleLeftMenu(true),
          ),

          // Left Spacer
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isLeftMenuOpen ? _menuWidth : 0,
          ),

          // TextField (centered and responsive)
          Expanded(
            child: TextField(
              onSubmitted: (query) => widget.onSearchSubmitted(),
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Right Spacer
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isRightMenuOpen ? _menuWidth : 0,
          ),

          // Right Menu Button
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => widget.rightMenuOptions,
            onCanceled: () => _toggleRightMenu(false),
            onSelected: (_) => _toggleRightMenu(false),
            onOpened: () => _toggleRightMenu(true),
          ),
        ],
      ),
    );
  }
}
