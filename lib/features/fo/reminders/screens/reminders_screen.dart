import 'package:flutter/material.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: const Center(
          child: Text('Reminder'),
        ),
      ),
    );
  }
}
