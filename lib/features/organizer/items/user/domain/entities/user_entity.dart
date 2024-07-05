class UserEntity {
  final int _id;
  final String _name;
  final String? _email;

  UserEntity({
    int? id,
    required String name,
    String? email,
  })  : _id = id ?? 0,
        _name = name,
        _email = email ?? "";

  factory UserEntity.empty() => UserEntity(name: "");

  int get id => _id;

  String get name => _name;

  String? get email => _email;
}
