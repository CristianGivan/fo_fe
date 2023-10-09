import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_route_constants.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
                onPressed: () =>
                    context.push(RouteConstants.settingsDisplayRouteName),
                child: const Text('Go to the display settings'),
              ),
            ),
            const SizedBox(height: 10),
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
