import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/config/reminder_route_names.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class OrganizerHomeScreen extends StatelessWidget {
  const OrganizerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthenticationBlocSession,
            AuthenticationBlocSessionState>(
          builder: (context, state) {
            if (state is AuthenticationSessionAuthenticated) {
              return Text('Welcome, authId: ${state.authEntity.id},'
                  'userId: ${state.authEntity.userId}');
            } else if (state is AuthenticationSessionLoading) {
              return const CircularProgressIndicator();
            } else {
              return const Text('Organizer');
            }
          },
        ),
        actions: [
          BlocBuilder<AuthenticationBlocSession,
              AuthenticationBlocSessionState>(
            builder: (context, state) {
              if (state is AuthenticationSessionAuthenticated) {
                return IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<AuthenticationBlocToken>().add(
                          LogoutBlocEvent(authId: state.authEntity.id),
                        );
                    context.pushNamed(
                        AuthenticationRouterNames.authenticationRouteName);
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(TaskRouterNames.taskRouteName),
              child: const Text('Go to the topics screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(TaskRouterNames.taskRouteName),
              child: const Text('Go to the tasks screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () =>
                  context.pushNamed(ReminderRouterNames.reminderRouteName),
              child: const Text('Go to the reminder screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(TagRouterNames.tagRouteName),
              child: const Text('Go to the tag screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context
                  .pushNamed(AuthenticationRouterNames.authenticationRouteName),
              child: const Text('Authentication'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.push('/user'),
              child: const Text('User'),
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
