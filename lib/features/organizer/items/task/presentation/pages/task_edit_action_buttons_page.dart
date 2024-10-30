import '../../../../utils/organizer_exports.dart';

class TaskEditActionButtonsPage extends StatelessWidget {
  final VoidCallback onSave;

  // final VoidCallback onLinkTag;
  // final VoidCallback onLinkReminder;
  // final VoidCallback onLinkUser;

  const TaskEditActionButtonsPage({
    super.key,
    required this.onSave,
    // required this.onLinkTag,
    // required this.onLinkReminder,
    // required this.onLinkUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(onPressed: onSave, child: const Text('Save')),
        // ElevatedButton(onPressed: onLinkTag, child: const Text('Link Tag')),
        // ElevatedButton(onPressed: onLinkReminder, child: const Text('Link Reminder')),
        // ElevatedButton(onPressed: onLinkUser, child: const Text('Link User')),
      ],
    );
  }
}
