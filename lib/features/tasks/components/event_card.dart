part of tasks;

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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TasksPage(tasks: widget.tasks)));
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
                                  "Date: ${DateFormat.yMd().format(widget.tasks.date!)}",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
