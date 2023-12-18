part of tasks;

//Widget containing the list of tasks under an event
//Also contains a floating action button to add tasks under the same event
class TasksPage extends StatefulWidget {
  final TasksEntity tasks;

  const TasksPage({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                child: TaskList(
              tasksId: widget.tasks.id,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddTask(event: widget.tasks)));
            setState(() {});
          },
          child: const Text("+", style: TextStyle(fontSize: 29))),
    );
  }
}
