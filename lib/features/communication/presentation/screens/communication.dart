import 'package:flutter/material.dart';

class Communication extends StatefulWidget {
  const Communication(
      {super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<Communication> createState() => _SecondScreen();
}

class _SecondScreen extends State<Communication> {
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
              'Communication',
            ),
          ],
        ),
      ),
    );
  }
}
