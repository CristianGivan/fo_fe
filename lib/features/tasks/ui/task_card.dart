part of tasks;

/// Styling for an event card. Includes the task name, owner and a checkmark.
/// A card can be deleted through the delete button inside the menu bar.
class TaskCard extends StatefulWidget {
  final TaskEntity? task;
  final TasksEntity tasks;

  const TaskCard({super.key,this.task, required this.tasks});

  @override
  State<TaskCard> createState() {
    return _TaskCardState();
  }
}

class _TaskCardState extends State<TaskCard> {
  List<TagEntity> tagList = [];
  String assignedString = "";
  bool? taskStatus;

  void toggleCheckBox() {
    bool newStatus = widget.task!.setFinished();
    objectbox.taskBox.put(widget.task!);

    setState(() {
      taskStatus = newStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {});

    tagList.addAll(widget.task!.tagList);

    assignedString = tagList.map((tag) => tag.tag).join(', ');
    taskStatus = widget.task!.status;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UpdateTask(task: widget.task, tasks: widget.tasks)));
        },
        child: Container(
          height: 90,
          margin: const EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(0.5, 0.5),
                      )
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          shape: const CircleBorder(),
                          value: taskStatus,
                          onChanged: (bool? value) {
                            toggleCheckBox();
                          },
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  widget.task!.subject,
                                  style: taskStatus!
                                      ? const TextStyle(
                                      fontSize: 20.0,
                                      height: 1.0,
                                      color:
                                      Color.fromARGB(255, 73, 73, 73),
                                      overflow: TextOverflow.ellipsis,
                                      decoration:
                                      TextDecoration.lineThrough)
                                      : const TextStyle(
                                      fontSize: 20.0,
                                      height: 1.0,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Assigned to: $assignedString",
                                    style: taskStatus!
                                        ? const TextStyle(
                                        fontSize: 15.0,
                                        height: 1.0,
                                        color: Color.fromARGB(
                                            255, 106, 106, 106),
                                        fontStyle: FontStyle.italic,
                                        decoration:
                                        TextDecoration.lineThrough,
                                        overflow: TextOverflow.visible)
                                        : const TextStyle(
                                      fontSize: 15.0,
                                      height: 1.0,
                                      overflow: TextOverflow.visible,
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuButton<Menu>(
                        onSelected: (item) => onSelected(context, item.text ,widget.task!),
                        itemBuilder: (BuildContext context) =>
                        [...MenuItems.menuList.map(buildItem).toList()],
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(color: Colors.grey, Icons.more_vert),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  PopupMenuItem<Menu> buildItem(Menu item) =>
      PopupMenuItem<Menu>(value: item, child: Text(item.text!));

  void onSelected(BuildContext context, String? item, TaskEntity task) {
    if (item == "Delete") {
      objectbox.taskBox.remove(task.id);
      debugPrint(
          "Task ${task.subject} deleted and had owners: ${task.tagList.map((
              tag) => tag.tag).join(", ")}");
    }
    else{
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UpdateTask(task: widget.task, tasks: widget.tasks)));
    }
  }
}