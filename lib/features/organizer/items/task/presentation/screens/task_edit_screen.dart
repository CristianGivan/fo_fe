import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_edit_action_buttons_page.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_form_fields_page.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

// Main TaskEditScreen with modular widgets
class TaskEditScreen extends StatefulWidget {
  final TaskEntity task;

  const TaskEditScreen({super.key, required this.task});

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Task')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TaskFormFieldsPage(task: widget.task),
            const SizedBox(height: 20),
            const TaskEditActionButtonsPage(),
          ],
        ),
      ),
    );
  }
}
