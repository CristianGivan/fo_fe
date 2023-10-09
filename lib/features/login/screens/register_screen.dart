import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise'),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => context.push('/login'),
                child: const Text('Go to the login screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
