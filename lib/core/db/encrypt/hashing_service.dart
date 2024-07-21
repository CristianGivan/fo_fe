import 'dart:convert';

import 'package:crypto/crypto.dart';

class HashingService {
  static String hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to UTF8
    final digest = sha256.convert(bytes); // Hash the password
    return digest.toString(); // Return the hashed password as a string
  }
}
