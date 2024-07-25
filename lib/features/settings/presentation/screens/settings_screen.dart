import 'package:flutter/material.dart';
import 'package:fo_fe/core/del/app_route_constants_old.dart';
import 'package:go_router/go_router.dart';

class SettingsScreenm extends StatelessWidget {
  const SettingsScreenm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.push(RouteCoreConstants.settingsDisplayRoute),
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
    );
  }
}
