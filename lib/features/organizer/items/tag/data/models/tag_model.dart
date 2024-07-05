import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';

class TagModel extends TagEntity with EquatableMixin {
  TagModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory TagModel.empty() => TagModel(id: 0, name: "");

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
