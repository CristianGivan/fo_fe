part of '../tasks.dart';
class TasksHome extends StatefulWidget {
  const TasksHome({super.key});

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(child: EventList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddEvent()));
          },
          child: const Text("+", style: TextStyle(fontSize: 29))),
    );
  }
}
