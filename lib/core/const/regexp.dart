const String lowerCasePattern = r'(?=.*?[a-z])';
const String upperCasePattern = r'(?=.*?[A-Z])';
const String digitPattern = r'(?=.*?[0-9])';
const String specialCharPattern = r'(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])';
const String minLengthPattern = r'.{9,}';
const String namePattern = r'^[\w\s]{1,30}$';
const String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

RegExp specialCharRegExp = RegExp(specialCharPattern);

RegExp userNameRegExp = RegExp(namePattern);

RegExp  emailRegExp = RegExp(emailPattern);

RegExp passwordRegExp = RegExp(
    '^$upperCasePattern$lowerCasePattern$digitPattern$specialCharPattern$minLengthPattern\$');
