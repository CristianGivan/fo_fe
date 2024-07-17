import 'dart:convert'; // for the utf8.encode method

import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';

import '../../../../../../core/const/constants.dart';

class UserEntity extends OrganizerItemEntity with EquatableMixin {
  final String _name;
  final String _hashedPassword;
  final String? _email;

  UserEntity({
    int? id,
    required String name,
    String? email,
    DateTime? createdDate,
    String? hashedPassword,
  })  : _name = name,
        _email = email ?? "",
        _hashedPassword = _hashPassword(hashedPassword ?? name),
        super(
          id: id ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
        );

  factory UserEntity.empty() => UserEntity(name: "", hashedPassword: "");

  String get name => _name;

  String? get email => _email;

  String get hashedPassword => _hashedPassword;

  static String _hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to UTF8
    final digest = sha256.convert(bytes); // Hash the password
    return digest.toString(); // Return the hashed password as a string
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
