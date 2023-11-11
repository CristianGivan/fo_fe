import 'package:flutter/material.dart';

class QuickReminder extends StatefulWidget {
  const QuickReminder(
      {super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<QuickReminder> createState() => _QuickReminderState();
}

class _QuickReminderState extends State<QuickReminder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colorWidget,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('New reminder'),
          ],
        ),
      ),
    );
  }
}
