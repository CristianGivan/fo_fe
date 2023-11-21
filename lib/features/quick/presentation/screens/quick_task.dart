import 'package:flutter/material.dart';

class QuickTask extends StatefulWidget {
  const QuickTask({super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<QuickTask> createState() => _QuickTaskState();
}

class _QuickTaskState extends State<QuickTask> {
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
            Text('New task'),
          ],
        ),
      ),
    );
  }
}
