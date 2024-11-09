// Lookahead assertions
const String lowerCaseLookaheadPattern = r'(?=.*?[a-z])';
const String upperCaseLookaheadPattern = r'(?=.*?[A-Z])';
const String digitLookaheadPattern = r'(?=.*?[0-9])';
const String specialCharLookaheadPattern = r'(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])';
const String minPasswordLengthPattern = r'.{9,}';

// Character classes
const String lowerCasePattern = r'[a-z]';
const String upperCasePattern = r'[A-Z]';
const String digitPattern = r'[0-9]';
const String specialCharPattern = r'[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]';

// Other patterns
const String namePattern = r'^[\w\s]{1,30}$';
const String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

// RegExp objects
RegExp specialCharRegExp = RegExp(specialCharPattern);
RegExp userNameRegExp = RegExp(namePattern);
RegExp emailRegExp = RegExp(emailPattern);
RegExp minPasswordLengthRegExp = RegExp(minPasswordLengthPattern);
RegExp passwordRegExp = RegExp(
    '^$upperCaseLookaheadPattern$lowerCaseLookaheadPattern$digitLookaheadPattern$specialCharLookaheadPattern$minPasswordLengthPattern\$');

// Character class RegExp objects
RegExp upperCaseRegExp = RegExp(upperCasePattern);
RegExp lowerCaseRegExp = RegExp(lowerCasePattern);
RegExp digitRegExp = RegExp(digitPattern);
