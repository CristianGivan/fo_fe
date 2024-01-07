part of tasks;

//Widget containing the list of tasks under an event
//Also contains a floating action button to add tasks under the same event
class TasksPage extends StatefulWidget {
  final Tasks tasks;

  const TasksPage({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskBloc()..add(GetTaskListByTasksId(tasksId: widget.tasks.id)),
      child: Scaffold(
        key: UniqueKey(),
        appBar: AppBar(
          title: const Text("Tasks"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state.status == TasksStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == TaskStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == TaskStatus.success) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.taskList.length,
                  itemBuilder: (context, int i) {
                    return TaskCard(
                      task: state.taskList[i],
                      tasks: widget.tasks,
                    );
                  },
                );
              } else {
                return const Center(child: Text('Unknown'));
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddTask(tasks: widget.tasks)));
              setState(() {});
            },
            child: const Text("+", style: TextStyle(fontSize: 29))),
      ),
    );
  }
}
