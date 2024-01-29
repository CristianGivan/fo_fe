part of '../../tasks.dart';

/// Adds a new event
class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final eventNameController = TextEditingController();
  final eventLocationController = TextEditingController();

  DateTime? currentDate;

  late Tasks tasks;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()..add(GetAllTasks()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Event"),
        ),
        body: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: eventNameController,
                decoration: const InputDecoration(
                  labelText: 'Event Name',
                ),
              )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: eventLocationController,
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    currentDate != null
                        ? "Date: ${DateFormat.yMd().format(currentDate!)}"
                        : "Date: Not Selected",
                  ),
                ),
                const Spacer(),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextButton(
                      child: const Text("Select a date",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2050))
                            .then((date) {
                          setState(() {
                            currentDate = date;
                          });
                        });
                      },
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    child: const Text(
                      "Save",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (eventLocationController.text.isNotEmpty &&
                              eventNameController
                                  .text.isNotEmpty //&& currentDate != null
                          ) {
                        tasks = Tasks(eventNameController.text,
                            date: currentDate!,
                            location: eventLocationController.text);
                        tasks.id = database.addTasks(tasks);
                        // context.read<TasksBloc>().add(TasksAdded(tasks));
                        // Navigator.pop(context);
                        // () => context.read<TasksBloc>().add(TasksAdded(tasks));
                        // context.pushReplacement(OrganizerRouterNames.organizerTasksRoute);
                        context.pop();
                        context.pushReplacementNamed(
                            OrganizerRouterNames.organizerTasksRoute);
                      }
                    })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
