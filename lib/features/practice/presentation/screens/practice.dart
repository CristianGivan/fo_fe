import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<Practice> createState() => _SecondScreen();
}

class _SecondScreen extends State<Practice> {
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
              'Practice',
            ),
          ],
        ),
      ),
    );
  }
}
