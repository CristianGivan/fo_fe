import 'package:fo_fe/core/utils/date_time/date_time_constants.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagEntity extends OrganizerItemEntity {
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
  static final TagEntity _emptyInstance = TagEntity(subject: "");

  factory TagEntity.empty() => _emptyInstance;

  bool get isEmpty => this == _emptyInstance;

  String get subject => _subject;

  @override
  // TODO: implement props
  List<Object?> get props => [
        ...super.props,
        _subject,
      ];
}
