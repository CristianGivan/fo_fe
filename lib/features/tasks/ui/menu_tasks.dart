import 'package:flutter/material.dart';
import 'package:fo_fe/features/tasks/entity/task_entity.dart';
import 'package:fo_fe/features/tasks/model/task.dart';

import '../../../main.dart';
import 'delete_menu.dart';

class MenuTask extends StatefulWidget {
  const MenuTask({super.key, this.task});

  final TaskEntity? task;

  @override
  State<MenuTask> createState() => _MenuTaskState();
}

class _MenuTaskState extends State<MenuTask> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      onSelected: (item) => _onSelected(context, widget.task!),
      itemBuilder: (BuildContext context) =>
          [...MenuItems.menuList.map(buildItem)],
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Icon(color: Colors.grey, Icons.more_vert),
      ),
    );
  }

  PopupMenuItem<Menu> buildItem(Menu item) =>
      PopupMenuItem<Menu>(value: item, child: Text(item.text!));

  void _onSelected(BuildContext context, TaskEntity task) {
    // task.deleteTask(task.id);
    // debugPrint(
    //     "Task ${task.subject} deleted and had owners: ${task.tagList.map((tag) => tag.tag).join(", ")}");
  }
}
