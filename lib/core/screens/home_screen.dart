import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_route_constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => context.push(RouteConstants.loginRouteName),
                child: const Text('Go to the login screen'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(RouteConstants.loginRegisterRouteName),
                child: const Text('Go to the register screen'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => context.push(RouteConstants.otherRouteName),
                child: const Text('Go to the other screen'),
              ),
            ),
            const Center(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
