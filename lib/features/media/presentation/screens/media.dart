import 'package:flutter/material.dart';

class Media extends StatefulWidget {
  const Media({super.key, required this.title, required this.colorWidget});

  final String title;
  final Color colorWidget;

  @override
  State<Media> createState() => _SecondScreen();
}

class _SecondScreen extends State<Media> {
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
              'Media',
            ),
          ],
        ),
      ),
    );
  }
}
