import 'package:fo_fe/features/app_home/presentation/app_bar_widget.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/practice/presentation/utils/practice_exports.dart';
import 'package:fo_fe/features/settings/utils/config/settings_route_names.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarWidget(title: 'Organizer'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(AuthRouterNames.authRouteName),
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
