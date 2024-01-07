// part of tasks;

// /// Generates and returns list of tasks belonging a parent event.
// class TaskList extends StatefulWidget {
//   final int tasksId;

//   const TaskList({
//     super.key,
//     required this.tasksId,
//   });

//   @override
//   State<TaskList> createState() => _TaskListState();
// }

// class _TaskListState extends State<TaskList> {
//   TaskCard Function(BuildContext, int) _itemBuilder(List<TaskEntity> tasks) =>
//       (BuildContext context, int index) => TaskCard(task: tasks[index], tasks:database.getTasks(widget.tasksId) ?? TasksEntity("only to not have optional"));

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<TaskEntity>>(
//         stream: database.getTasksOfEvent(widget.tasksId),
//         builder: (context, snapshot) {
//           if (snapshot.data?.isNotEmpty ?? false) {
//             return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: snapshot.hasData ? snapshot.data!.length : 0,
//                 itemBuilder: _itemBuilder(snapshot.data ?? []));
//           } else {
//             return const Center(child: Text("Press the + icon to add tasks"));
//           }
//         });
//   }
// }
