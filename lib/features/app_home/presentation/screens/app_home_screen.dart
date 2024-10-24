import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/practice/presentation/utils/practice_exports.dart';
import 'package:fo_fe/features/settings/utils/config/settings_route_names.dart';
import 'package:go_router/go_router.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthenticationBlocSession, AuthenticationBlocSessionState>(
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
          BlocBuilder<AuthenticationBlocSession, AuthenticationBlocSessionState>(
            builder: (context, state) {
              if (state is AuthenticationSessionAuthenticated) {
                return IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<AuthenticationBlocToken>().add(
                          LogoutBlocEvent(authId: state.authEntity.id),
                        );
                    context.pushNamed(AuthenticationRouterNames.authenticationRouteName);
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
              onPressed: () => context.pushNamed(AuthenticationRouterNames.authenticationRouteName),
              child: const Text('Go to the authentication screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(OrganizerRouterNames.organizerRouteName),
              child: const Text('Go to the organizer screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(PracticeRouterNames.practiceRouteName),
              child: const Text('Go to the practice screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(SettingsRouteNames.settingsRouteName),
              child: const Text('Go to the settings screen'),
            ),
          ),
        ],
      ),
    );
  }
}
