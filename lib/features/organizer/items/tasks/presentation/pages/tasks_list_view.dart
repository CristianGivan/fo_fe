// part of '../../tasks_lib.dart';
//
//
// /// Generates and returns a widget with list of events stored in the Box.
// class TasksList extends StatefulWidget {
//   const TasksList({super.key});
//
//   @override
//   State<TasksList> createState() => _TasksListState();
// }
//
// class _TasksListState extends State<TasksList> {
//   TasksCard Function(BuildContext, int) _itemBuilder(List<Tasks> events) =>
//       (BuildContext context, int index) => TasksCard(tasks: events[index]);
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<TasksEntity>>(
//         stream: database.getTasksList(),
//         builder: (context, snapshot) {
//           if (snapshot.data?.isNotEmpty ?? false) {
//             return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: snapshot.hasData ? snapshot.data!.length : 0,
//                 itemBuilder: _itemBuilder(
//                     (Tasks.objectBoxTasksEntityListToTasksList(
//                         snapshot.data ?? []))));
//           } else {
//             return const Center(
//                 child: Text("Press the + icon to add an event"));
//           }
//         });
//   }
// }
