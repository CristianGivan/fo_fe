import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';

class TagModel extends TagEntity with EquatableMixin {
  TagModel({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastAccessedDate,
    int? remoteAccesses,
    int? accesses,
    String? checksum,
    required String subject,
  }) : super(
          id: id,
          createdDate: createdDate,
          creatorId: creatorId,
          remoteId: remoteId,
          lastUpdate: lastUpdate,
          lastViewDate: lastAccessedDate,
          remoteViews: remoteAccesses,
          views: accesses,
          checksum: checksum,
          subject: subject,
        );

  factory TagModel.empty() => TagModel(id: 0, subject: "");

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
