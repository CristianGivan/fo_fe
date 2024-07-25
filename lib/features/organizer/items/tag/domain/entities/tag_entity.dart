import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/const/constants.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

class TagEntity extends OrganizerItemEntity with EquatableMixin {
  final String _subject;

  TagEntity({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
    required String subject,
  })  : _subject = subject,
        super(
          id: id ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
          creatorId: creatorId ?? 0,
          remoteId: remoteId ?? 0,
          lastUpdate: lastUpdate ?? INITIAL_EPOCH_DATE,
          lastAccessedDate: lastViewDate ?? INITIAL_EPOCH_DATE,
          remoteAccesses: remoteViews ?? 0,
          accesses: views ?? 0,
          checksum: checksum ?? '',
        );

  factory TagEntity.empty() => TagEntity(subject: "");

  String get subject => _subject;

  @override
  // TODO: implement props
  List<Object?> get props => [
        ...super.props,
        _subject,
      ];
}
