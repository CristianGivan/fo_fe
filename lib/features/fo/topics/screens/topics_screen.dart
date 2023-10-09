import 'package:flutter/material.dart';

class Topics extends StatelessWidget {
  const Topics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: const Center(
          child: Text('Topics'),
        ),
      ),
    );
  }
}
