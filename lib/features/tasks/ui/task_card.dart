part of '../tasks.dart';

/// Styling for an event card. Includes the task name, owner and a check mark.
/// A card can be deleted through the delete button inside the menu bar.
class TaskCard extends StatefulWidget {
  final Task task;
  final Tasks tasks;

  const TaskCard({super.key, required this.task, required this.tasks});

  @override
  State<TaskCard> createState() {
    return _TaskCardState();
  }
}

class _TaskCardState extends State<TaskCard> {
  Set<Tag> tagSet = <Tag>{};
  String assignedString = "";
  bool? taskStatus;

  void toggleCheckBox() {
    bool newStatus = widget.task.changeState();
    database.updateTask(widget.task);

    setState(() {
      taskStatus = newStatus;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {});

    tagSet.addAll(database.getTagSetFromTask(widget.task));

    assignedString = tagSet.map((tag) => tag.tag).join(', ');
    taskStatus = widget.task.status;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  UpdateTaskPage(task: widget.task, tasks: widget.tasks)));
        },
        child: BlocProvider(
          create: (context) =>
              TagBloc()..add(GetTagListByTaskId(widget.task.id)),
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
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.task.subject,
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
                              BlocBuilder<TagBloc, TagBlocState>(
                                builder: (context, state) {
                                  if (state.status == TagBlocStatus.initial) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state.status ==
                                      TagBlocStatus.loading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state.status ==
                                      TagBlocStatus.success) {
                                    assignedString = state.tagList
                                        .map((tag) => tag.tag)
                                        .join(', ');
                                    return Flexible(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Tags: $assignedString",
                                            style: taskStatus!
                                                ? const TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.0,
                                                    color: Color.fromARGB(
                                                        255, 106, 106, 106),
                                                    fontStyle: FontStyle.italic,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    overflow:
                                                        TextOverflow.visible)
                                                : const TextStyle(
                                                    fontSize: 15.0,
                                                    height: 1.0,
                                                    overflow:
                                                        TextOverflow.visible,
                                                    fontStyle: FontStyle.italic,
                                                  )),
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child: Text('Tags: Unknown'));
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        PopupMenuButton<Menu>(
                          onSelected: (item) =>
                              onSelected(context, item.text, widget.task),
                          itemBuilder: (BuildContext context) =>
                              [...MenuItems.menuList.map(buildItem)],
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
          ),
        ));
  }

  PopupMenuItem<Menu> buildItem(Menu item) =>
      PopupMenuItem<Menu>(value: item, child: Text(item.text!));

  void onSelected(BuildContext context, String? item, Task task) {
    if (item == "Delete") {
      database.deleteTask(task.id);
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TasksPage(tasks: widget.tasks)));
      debugPrint("Task ${task.subject} ");
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              UpdateTaskPage(task: widget.task, tasks: widget.tasks)));
    }
  }
}
