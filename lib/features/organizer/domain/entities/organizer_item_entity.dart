import 'package:fo_fe/core/utils/date_time/date_time_constants.dart';
import 'package:fo_fe/features/organizer/domain/entities/item_entity.dart';

abstract class OrganizerItemEntity extends ItemEntity {
  final int _creatorId;
  final DateTime _createdDate;
  final DateTime? _lastUpdate;
  final DateTime? _lastViewedDate;
  final int? _remoteViews;
  final int? _views;
  final String? _checksum;

  OrganizerItemEntity({
    required super.id,
    required super.remoteId,
    int? creatorId,
    required super.subject,
    DateTime? createdDate,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
  })  : _creatorId = creatorId ?? 0,
        _createdDate = createdDate ?? INITIAL_EPOCH_DATE,
        _lastViewedDate = lastViewedDate ?? INITIAL_EPOCH_DATE,
        _lastUpdate = lastUpdate ?? INITIAL_EPOCH_DATE,
        _remoteViews = remoteViews ?? 0,
        _views = views ?? 0,
        _checksum = checksum ?? "";

  @override
  bool get isEmpty;

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
