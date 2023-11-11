import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes/app_route_constants.dart';
import '../../../organizer/router/organizer_router_names.dart';

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
            const Center(
              child: Text(
                'List of items:',
              ),
            ),
            const Center(
              child: Text(
                'items 1',
              ),
            ),
            const Center(
              child: Text(
                'items 2',
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(RouteCoreConstants.authenticationRoute),
                child: const Text('Quick'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(OrganizerRouterNames.organizerRoute),
                child: const Text('Organizer'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(RouteCoreConstants.authenticationRoute),
                child: const Text('Communication'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(RouteCoreConstants.authenticationRoute),
                child: const Text('Media'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(RouteCoreConstants.practiceGamesRoute),
                child: const Text('Practice'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    context.push(RouteCoreConstants.authenticationRoute),
                child: const Text('Authentication'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () => context.push(RouteCoreConstants.settingsRoute),
                child: const Text('Settings'),
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
