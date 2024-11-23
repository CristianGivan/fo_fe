// validation_utils.dart

import 'package:fo_fe/core/const/regexp.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

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

  static isUserNameEmailPasswordValidValid(UserEntity user) {
    return isNameEmailPasswordValid(name: user.name, email: user.email, password: user.password);
  }

  static isNameEmailPasswordValid(
      {required String name, required String email, required String password}) {
    return isNameValid(name) && isEmailValid(email) && isPasswordValid(password);
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
