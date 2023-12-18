import 'package:flutter/material.dart';
import 'package:fo_fe/features/tasks/entity/tag_entity.dart';
import 'package:fo_fe/features/tasks/entity/task_entity.dart';
import 'package:fo_fe/features/tasks/entity/tasks_entity.dart';
import 'package:fo_fe/features/tasks/model/tasks.dart';
import 'package:fo_fe/features/tasks/tasks.dart';
import '../../../main.dart';


/// Adds a new task and assigns an owner.
class UpdateTask extends StatefulWidget {
  final TaskEntity? task;
  final TasksEntity tasks;

  const UpdateTask({Key? key,  this.task ,required this.tasks,}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}


class _UpdateTaskState extends State<UpdateTask> {
  late var inputController = TextEditingController();
  final ownerInputController = TextEditingController();
  List<TagEntity> currentTags = [];

  @override
  void initState() {
    super.initState();
    // Check if the widget's task is not null
    if (widget.task != null) {
      inputController = TextEditingController(text: widget.task!.subject);
    } else {
      // Initialize the inputController with an empty value if the task is null
      inputController = TextEditingController();
    }
  }

  @override
  void dispose() {
    // Dispose the inputController when the state is disposed to avoid memory leaks
    inputController.dispose();
    super.dispose();
  }


  void _addTag(String tagName) {
    TagEntity newTag = TagEntity(tagName);
    objectbox.tagBox.put(newTag);
    setState(() {
      currentTags = [newTag];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Task")),
        body: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: inputController,

              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Text("Assign Owner:", style: TextStyle(fontSize: 17)),
                Expanded(child: Card(child: buildSingleOwner(context))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Spacer(),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('New Owner'),
                          content: TextField(
                            autofocus: true,
                            decoration: const InputDecoration(
                                hintText: 'Enter the owner name'),
                            controller: ownerInputController,
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Submit'),
                              onPressed: () {
                                _addTag(ownerInputController.text);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                      ownerInputController.clear();
                    },
                    child: const Text(
                      "Add Owner",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ElevatedButton(
                  child: const Text(
                    "Save",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (inputController.text.isNotEmpty) {
                      objectbox.updateTask(widget.task?.id ?? 0,
                          inputController.text, currentTags, widget.tasks);

                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          )
        ]));
  }

  Widget buildSingleOwner(context) {
    dynamic onTap() async {
      final selectedOwners = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const TagList()));

      if (selectedOwners == null) return;
      setState(() {
        currentTags = selectedOwners;
      });

      return selectedOwners;
    }

    return currentTags.isEmpty
        ? buildListTile(title: "No Owner", onTap: onTap)
        : buildListTile(
            title: currentTags.map((owners) => owners.tag).join(", "),
            onTap: onTap);
  }

  Widget buildListTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
      trailing:
          const Icon(Icons.arrow_drop_down, color: Colors.black, size: 20),
    );
  }
}
