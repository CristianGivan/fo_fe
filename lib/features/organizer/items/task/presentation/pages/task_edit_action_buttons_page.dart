import '../../../../utils/organizer_exports.dart';

class TaskEditActionButtonsPage extends StatelessWidget {
  const TaskEditActionButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () => context.pop(), child: const Text('Save')),
      ],
    );
  }
}
