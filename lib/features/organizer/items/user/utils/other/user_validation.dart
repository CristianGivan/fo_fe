// validation_utils.dart

import 'package:fo_fe/core/const/regexp.dart';

class UserValidation {

  static bool isNameValid(String name) {
    return name.isNotEmpty && userNameRegExp.hasMatch(name);
  }
  static bool isEmailValid(String email) {
    return email.isNotEmpty && emailRegExp.hasMatch(email);
  }


  static bool isPasswordValid(String password) {
    return password.isNotEmpty && passwordRegExp.hasMatch(password);
  }

  static bool isMinPasswordLength(String password) {
    return minPasswordLengthRegExp.hasMatch(password);
  }
  static bool containsUpperCase(String input) {
    return upperCaseRegExp.hasMatch(input);
  }

  static bool containsLowerCase(String input) {
    return lowerCaseRegExp.hasMatch(input);
  }

  static bool containsNumber(String input) {
    return digitRegExp.hasMatch(input);
  }

  static bool containsSpecialChar(String input) {
    return specialCharRegExp.hasMatch(input);
  }
}
