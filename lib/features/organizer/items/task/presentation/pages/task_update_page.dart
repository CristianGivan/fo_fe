part of '../../task_lib.dart';

/// Adds a new task and assigns an owner.
class UpdateTaskPage extends StatefulWidget {
  final TaskEntity task;
  final Tasks tasks;

  const UpdateTaskPage({
    Key? key,
    required this.task,
    required this.tasks,
  }) : super(key: key);

  @override
  State<UpdateTaskPage> createState() => _UpdateTaskPageState();
}

class _UpdateTaskPageState extends State<UpdateTaskPage> {
  late var inputController = TextEditingController();
  final ownerInputController = TextEditingController();
  Set<Tag> currentTags = <Tag>{};

  @override
  void initState() {
    super.initState();
    // Check if the widget's task is not null
    inputController = TextEditingController(text: widget.task.subject);
  }

  @override
  void dispose() {
    // Dispose the inputController when the state is disposed to avoid memory leaks
    inputController.dispose();
    super.dispose();
  }

  void _addTag(String tagName) {
    Tag newTag = Tag(tagName);
    newTag.id = database.addTag(newTag);
    setState(() {
      currentTags = {newTag};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Update Task")),
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
                          title: const Text('New tag'),
                          content: TextField(
                            decoration: const InputDecoration(
                                hintText: 'Enter the tag name'),
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
                      "Add Tag",
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
                      database.updateTaskFields(widget.task.id ?? 0,
                          inputController.text, currentTags, widget.tasks);

                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TasksPage(tasks: widget.tasks)));
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
