class AuthenticationRouterNames {
  static const String authenticationRoutePath = '/authentication';
  static const String authenticationRouteName = authenticationRoutePath;
  static const String authenticationSignInRoutePath = 'sign-in';
  static const String authenticationSignInRouteName =
      '$authenticationRouteName/$authenticationSignInRoutePath';
  static const String authenticationSignUpRoutePath = 'sign-up';
  static const String authenticationSignUpRouteName =
      '$authenticationRouteName/$authenticationSignUpRoutePath';
  static const String authenticationAuthenticationWithAutoLogInRoutePath =
      'authenticationWithAutoLogIn';
  static const String authenticationAuthenticationWithAutoLogInRouteName =
      '$authenticationRouteName/$authenticationAuthenticationWithAutoLogInRoutePath';
}
