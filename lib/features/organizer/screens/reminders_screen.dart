import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:go_router/go_router.dart';

class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text('Reminder'),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.push(OrganizerRouterNames.organizerRouteName),
              child: const Text('Go to the tasks screen'),
            ),
          ),
        ],
      ),
    );
  }
}
