import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_route_names.dart';
import 'package:go_router/go_router.dart';

class OrganizerHome extends StatelessWidget {
  const OrganizerHome({super.key});

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
                    context.push(AuthenticationRouterNames.authenticationRoute);
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
              onPressed: () => context.push('/organizer/task'),
              child: const Text('Go to the topics screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.push('/organizer/task'),
              child: const Text('Go to the tasks screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.push(TaskRouterNames.taskRoute),
              child: const Text('Go to the reminder screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.push('/authentication'),
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
