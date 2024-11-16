import 'package:fo_fe/features/organizer/utils/config/organizer_router_names.dart';

class AuthRouterNames {
  static const String authRoutePath = '/authentication';
  static const String authRouteName = authRoutePath;
  static const String authSignInRoutePath = 'sign-in';
  static const String authSignInRouteName = '$authRouteName/$authSignInRoutePath';
  static const String authSignUpRoutePath = 'sign-up';
  static const String authSignUpRouteName = '$authRouteName/$authSignUpRoutePath';
  static const String authWithAutoLogInRoutePath = OrganizerRouterNames.organizerRoutePath;
  static const String authWithAutoLogInRouteName = '$authRouteName/$authWithAutoLogInRoutePath';
}
