import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/practice/presentation/utils/practice_exports.dart';
import 'package:fo_fe/features/settings/utils/settings_exports.dart';

class AppHomeMenu extends StatelessWidget {
  const AppHomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuButton(
          title: 'Go to the authentication screen',
          onPressed: () => context.pushNamed(AuthRouterNames.authRouteName),
        ),
        MenuButton(
          title: 'Go to the organizer screen',
          onPressed: () => context.pushNamed(OrganizerRouterNames.organizerRouteName),
        ),
        MenuButton(
          title: 'Go to the practice screen',
          onPressed: () => context.pushNamed(PracticeRouterNames.practiceRouteName),
        ),
        MenuButton(
          title: 'Go to the settings screen',
          onPressed: () => context.pushNamed(SettingsRouteNames.settingsRouteName),
        ),
      ],
    );
  }
}
