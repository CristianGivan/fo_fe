class AuthRouterNames {
  static const String authRoutePath = '/auth';
  static const String authRouteName = authRoutePath;
  static const String authSignInRoutePath = 'sign-in';
  static const String authSignInRouteName = '$authRouteName/$authSignInRoutePath';
  static const String authSignUpRoutePath = 'sign-up';
  static const String authSignUpRouteName = '$authRouteName/$authSignUpRoutePath';
  static const String authWithAutoLogInRoutePath = "sign-in-auto";
  static const String authWithAutoLogInRouteName = '$authRouteName/$authWithAutoLogInRoutePath';
}
