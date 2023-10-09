import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_route_constants.dart';

class DisplaySettings extends StatelessWidget {
  const DisplaySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Settings'),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                //todo add change theme function
                onPressed: () =>
                    context.push(RouteConstants.settingsDisplayRouteName),
                child: const Text('todo add change theme function'),
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
