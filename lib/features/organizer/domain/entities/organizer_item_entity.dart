import 'package:fo_fe/core/utils/date_time/date_time_constants.dart';
import 'package:fo_fe/features/organizer/domain/entities/item_entity.dart';

class OrganizerItemEntity extends ItemEntity {
  final int _creatorId;
  final String _subject;
  final DateTime _createdDate;
  final DateTime? _lastUpdate;
  final DateTime? _lastViewedDate;
  final int? _remoteViews;
  final int? _views;
  final String? _checksum;

  OrganizerItemEntity({
    super.id,
    super.remoteId,
    int? creatorId,
    String? subject,
    DateTime? createdDate,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
  })  : _creatorId = creatorId ?? 0,
        _subject = subject ?? "",
        _createdDate = createdDate ?? INITIAL_EPOCH_DATE,
        _lastViewedDate = lastViewedDate ?? INITIAL_EPOCH_DATE,
        _lastUpdate = lastUpdate ?? INITIAL_EPOCH_DATE,
        _remoteViews = remoteViews ?? 0,
        _views = views ?? 0,
        _checksum = checksum ?? "";

  static final OrganizerItemEntity _emptyInstance = OrganizerItemEntity(
    subject: "",
    id: 0,
    remoteId: 0,
    creatorId: 0,
    createdDate: INITIAL_EPOCH_DATE,
    lastUpdate: INITIAL_EPOCH_DATE,
    lastViewedDate: INITIAL_EPOCH_DATE,
    remoteViews: 0,
    views: 0,
    checksum: "",
  );

  factory OrganizerItemEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  @override
  List<Object?> get props => [
        super.props,
        creatorId,
        subject,
        createdDate,
        lastUpdate,
        lastViewedDate,
        remoteViews,
        views,
        checksum,
      ];

  int get creatorId => _creatorId;

  String get subject => _subject;

  DateTime get createdDate => _createdDate;

  DateTime? get lastUpdate => _lastUpdate;

  DateTime? get lastViewedDate => _lastViewedDate;

  int? get remoteViews => _remoteViews;

  int? get views => _views;

  String? get checksum => _checksum;

  Map<String, dynamic> jsonToCheckForUpdates() {
    return {
      "remoteId": remoteId,
      "checksum": checksum,
      "lastUpdate": lastUpdate?.toIso8601String(),
    };
  }
}
