import 'package:fo_fe/core/utils/core_utils_exports.dart';

class TokenManager {
  final EncryptionService encryptionService;

  TokenManager(this.encryptionService);

  // Instance method for encryption
  String encryptToken(String token) {
    return encryptionService.encrypt(token);
  }

  // Instance method for decryption
  String decryptToken(String encryptedToken) {
    return encryptionService.decrypt(encryptedToken);
  }

  // Static method for token generation
  static String generateToken() {
    // Example token generation logic, you can use UUID or JWT in a real scenario
    return 'generated_token_${DateTime.now().millisecondsSinceEpoch}';
  }
}
