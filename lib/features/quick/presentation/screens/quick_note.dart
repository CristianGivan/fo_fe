import 'package:flutter/material.dart';

class QuickNote extends StatefulWidget {
  const QuickNote({super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<QuickNote> createState() => _QuickNoteState();
}

class _QuickNoteState extends State<QuickNote> {
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
            Text('New Note'),
          ],
        ),
      ),
    );
  }
}
