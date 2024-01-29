part of '../../tasks.dart';

class MenuTask extends StatefulWidget {
  const MenuTask({super.key, this.task});

  final TaskEntityObjectBox? task;

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

  void _onSelected(BuildContext context, TaskEntityObjectBox task) {
    // task.deleteTask(task.id);
    // debugPrint(
    //     "Task ${task.subject} deleted and had owners: ${task.tagList.map((tag) => tag.tag).join(", ")}");
  }
}
