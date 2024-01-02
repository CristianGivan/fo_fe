import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;

  const MyUser({required this.id, required this.email, required this.name});

  static const empty = MyUser(id: '', email: '', name: '');

  MyUser copyWith({String? id, String? email, String? name}) {
    return MyUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name);
  }

  MyUserEntity toEntity() {
    return MyUserEntity(id: id, email: email, name: name);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(id: entity.id, email: entity.email, name: entity.name);
  }
  static MyUser fromFirebaseUser(User firebaseUser){
    return MyUser(id: firebaseUser.uid, email: firebaseUser.email??"", name: firebaseUser.displayName??"");
  }

  @override
  List<Object?> get props => [id, email, name];
}
