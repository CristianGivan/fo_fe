import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';

class TagModel extends TagEntity with EquatableMixin {
  TagModel({
    super.id,
    super.createdDate,
    super.creatorId,
    super.remoteId,
    super.lastUpdate,
    DateTime? lastAccessedDate,
    int? remoteAccesses,
    int? accesses,
    super.checksum,
    required super.subject,
  }) : super(
          lastViewDate: lastAccessedDate,
          remoteViews: remoteAccesses,
          views: accesses,
        );

  factory TagModel.empty() => TagModel(id: 0, subject: "");

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
