import 'package:flutter/material.dart';

class QuickNoteReminderTaskScreen extends StatefulWidget {
  const QuickNoteReminderTaskScreen(
      {super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<QuickNoteReminderTaskScreen> createState() =>
      _QuickNoteReminderTaskScreenState();
}

class _QuickNoteReminderTaskScreenState
    extends State<QuickNoteReminderTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colorWidget,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/quick_note');
              },
              child: const Text('Create Note'),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/quick_reminder');
              },
              child: const Text('Create Reminder'),
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/quick_task');
              },
              child: const Text('Create task'),
            ),
          ],
        ),
      ),
    );
  }
}
