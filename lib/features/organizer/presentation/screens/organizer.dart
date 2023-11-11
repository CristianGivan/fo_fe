import 'package:flutter/material.dart';

class Organizer extends StatefulWidget {
  const Organizer({super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<Organizer> createState() => _SecondScreen();
}

class _SecondScreen extends State<Organizer> {
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
            Text(
              'Organizer',
            ),
          ],
        ),
      ),
    );
  }
}
