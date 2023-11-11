import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/routes/app_route_constants.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text('Reminder'),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => context.push(RouteCoreConstants.homeRoute),
                child: const Text('Go to the tasks screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
