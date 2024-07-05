class TagEntity {
  final int _id;
  final String _name;

  TagEntity({
    int? id,
    required String name,
  })  : _id = id ?? 0,
        _name = name;

  factory TagEntity.empty() => TagEntity(name: "");

  String get name => _name;

  int get id => _id;
}
