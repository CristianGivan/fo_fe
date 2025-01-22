import 'package:flutter/material.dart';

class TagScreenActionsMenu {
  static List<PopupMenuEntry> getMenuItems(BuildContext context) {
    return [
      PopupMenuItem(
        value: 'edit',
        child: Text('Edit Tag'),
      ),
      PopupMenuItem(
        value: 'delete',
        child: Text('Delete Tag'),
      ),
    ];
  }
}
