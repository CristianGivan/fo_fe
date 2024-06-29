part of '../../tasks_lib.dart';

/// Styling for an event card. Includes the name, location and date.
/// Clicking a card navigates to a list of tasks related to event.

class TasksCard extends StatefulWidget {
  final Tasks tasks;

  const TasksCard({super.key, required this.tasks});

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => TasksPage(tasks: widget.tasks)));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 1,
                    offset: Offset(0.5, 0.5),
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            widget.tasks.name,
                            style: const TextStyle(
                                fontSize: 25.0,
                                height: 1.0,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text("Location: ${widget.tasks.location}",
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      height: 1.0,
                                      overflow: TextOverflow.fade)),
                              const Spacer(),
                              Text(
                                  "Date: ${DateFormat.yMd().format(widget.tasks.date ?? DateTime.now())}",
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      height: 1.0,
                                      overflow: TextOverflow.fade))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<Menu>(
                    onSelected: (item) =>
                        onSelected(context, item.text, widget.tasks.id),
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
          ],
        ),
      ),
    );
  }

  PopupMenuItem<Menu> buildItem(Menu item) =>
      PopupMenuItem<Menu>(value: item, child: Text(item.text!));

  void onSelected(BuildContext context, String? item, int id) {
    if (item == "Delete") {
      database.deleteTasks(id);
      // context.pop();
      context.pushReplacementNamed(OrganizerRouterNames.organizerTasksRoute);
      // debugPrint("Task with id ${id} deleted ");
    } else {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => UpdateTask(task: widget.task, tasks: widget.tasks)));
    }
  }
}
