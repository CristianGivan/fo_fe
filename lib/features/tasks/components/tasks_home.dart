part of '../tasks.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({super.key});

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()..add(GetAllTasks()),
      child: Scaffold(
        key: UniqueKey(),
        appBar: AppBar(
          title: const Text("Events"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              if (state.status == TasksStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == TasksStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == TasksStatus.success) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.tasksList.length,
                  itemBuilder: (context, int i) {
                    return TasksCard(tasks: state.tasksList[i]);
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddEvent()));
            },
            child: const Text("+", style: TextStyle(fontSize: 29))),
      ),
    );
  }
}
