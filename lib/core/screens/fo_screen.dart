import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../routes/app_route_constants.dart';

class FO extends StatelessWidget {
  const FO({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FO'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => context.go(RouteConstants.foTasksRouteName),
                child: const Text('Go to the topics screen'),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => context.push(RouteConstants.foTasksRouteName),
                child: const Text('Go to the tasks screen'),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(RouteConstants.foReminderRouteName),
                child: const Text('Go to the reminder screen'),
              ),
            ),
            Center(
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
