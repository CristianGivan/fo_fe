import 'package:authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:organizer/organizer.dart';

import '../../../router/routes/app_route_constants.dart';

class AppScreen extends StatelessWidget {
   const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email=context.select((AuthenticationBloc bloc) => bloc.state.user?.email.toString())??"no user!";
    return Scaffold(
      appBar: AppBar(
        title:  Text(email),
      ),
      body: ListView(
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
                  context.push(AuthenticationRouterNames.authenticationRoute),
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
                  context.push(AuthenticationRouterNames.authenticationRoute),
              child: const Text('Communication'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.push(AuthenticationRouterNames.authenticationRoute),
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
                  context.push(AuthenticationRouterNames.authenticationRoute),
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
    );
  }
}
