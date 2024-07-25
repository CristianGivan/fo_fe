import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_route_constants_old.dart';

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation> {
  bool showMenu = false;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (showMenu) {
        if (constraints.maxWidth < 800) {
          return Padding(
            padding: MediaQuery.of(context)
                .viewInsets, // Adjust the padding as needed
            child: ScaffoldWithNavigationBar(
              body: widget.navigationShell,
              selectedIndex: widget.navigationShell.currentIndex,
              onDestinationSelected: _goBranch,
            ),
          );
        } else {
          return ScaffoldWithNavigationRail(
            body: widget.navigationShell,
            selectedIndex: widget.navigationShell.currentIndex,
            onDestinationSelected: _goBranch,
          );
        }
      } else {
        return WithoutNavigationBar(
          body: widget.navigationShell,
        );
      }
    });
  }
}

class WithoutNavigationBar extends StatelessWidget {
  const WithoutNavigationBar({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            label: RouteCoreConstants.homeMenuName,
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: RouteCoreConstants.settingsMenuName,
            icon: Icon(Icons.settings),
          ),
          // NavigationDestination(
          //   label: RouteCoreConstants.foAppMenuName,
          //   icon: Icon(Icons.home),
          // ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                  label: Text(RouteCoreConstants.homeMenuName),
                  icon: Icon(Icons.home)),
              NavigationRailDestination(
                  label: Text(RouteCoreConstants.settingsMenuName),
                  icon: Icon(Icons.settings)),
              // NavigationRailDestination(
              //     label: Text(RouteCoreConstants.authenticationRouteName),
              //     icon: Icon(Icons.login)),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
