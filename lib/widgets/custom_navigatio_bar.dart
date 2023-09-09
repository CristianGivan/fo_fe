import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<CustomNavigationBarItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({super.key, 
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Add padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((entry) {
          final int index = entry.key;
          final CustomNavigationBarItem item = entry.value;

          final isSelected = index == currentIndex;

          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  item.icon,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
                Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomNavigationBarItem {
  final IconData icon;
  final String label;

  CustomNavigationBarItem({
    required this.icon,
    required this.label,
  });
}
