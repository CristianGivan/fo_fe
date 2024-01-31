part of '../../tasks_lib.dart';

//Widget containing the list of tasks under an event
//Also contains a floating action button to add tasks under the same event
class TasksPage extends StatefulWidget {
  final Tasks? tasks;

  const TasksPage({super.key, this.tasks});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskBloc()..add(GetTaskListByTasksId(widget.tasks!.id)),
      child: Scaffold(
        key: UniqueKey(),
        appBar: AppBar(
          title: const Text("Tasks"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state.status == TaskBlocStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == TaskBlocStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == TaskBlocStatus.success) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.taskList.length,
                  itemBuilder: (context, int i) {
                    return TaskCard(
                      task: state.taskList[i],
                      tasks: widget.tasks ?? Tasks(""),
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
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AddTask(tasks: widget.tasks ?? Tasks(""))));
              setState(() {});
            },
            child: const Text("+", style: TextStyle(fontSize: 29))),
      ),
    );
  }
}
