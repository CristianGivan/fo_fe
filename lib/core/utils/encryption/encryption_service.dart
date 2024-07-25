import 'dart:convert';

abstract class EncryptionService {
  String encrypt(String data);

  String decrypt(String data);
}

class Base64EncryptionService implements EncryptionService {
  @override
  String encrypt(String data) {
    return base64Encode(utf8.encode(data));
  }

  @override
  String decrypt(String data) {
    return utf8.decode(base64Decode(data));
  }
}
