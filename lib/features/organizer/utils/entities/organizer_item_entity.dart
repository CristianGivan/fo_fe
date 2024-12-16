import 'package:fo_fe/core/utils/date_time/date_time_constants.dart';
import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/organizer/utils/entities/organizer_item_base.dart';

class OrganizerItemEntity extends OrganizerItemBase with EquatableMixin {
  final DateTime _createdDate;
  final int _creatorId;
  final DateTime? _lastUpdate;
  final DateTime? _lastViewDate;
  final int? _remoteViews;
  final int? _views;
  final String? _checksum;

  OrganizerItemEntity({
    super.id,
    super.remoteId,
    DateTime? createdDate,
    int? creatorId,
    DateTime? lastUpdate,
    DateTime? lastAccessedDate,
    int? remoteAccesses,
    int? accesses,
    String? checksum,
  })  : _createdDate = createdDate ?? DateTime.now(),
        _creatorId = creatorId ?? 0,
        _lastUpdate = lastUpdate,
        _lastViewDate = lastAccessedDate,
        _remoteViews = remoteAccesses,
        _views = accesses,
        _checksum = checksum;

  // Factory for an "empty" instance
  static final OrganizerItemEntity _emptyInstance = OrganizerItemEntity(
    id: 0,
    remoteId: 0,
    createdDate: INITIAL_EPOCH_DATE,
    creatorId: 0,
    lastUpdate: INITIAL_EPOCH_DATE,
    lastAccessedDate: INITIAL_EPOCH_DATE,
    remoteAccesses: 0,
    accesses: 0,
    checksum: "",
  );

  factory OrganizerItemEntity.empty() => _emptyInstance;

  bool get isEmpty => this == _emptyInstance;

  @override
  List<Object?> get props => [
        super.props,
        createdDate,
        creatorId,
        lastUpdate,
        lastAccessedDate,
        remoteAccesses,
        accesses,
        checksum,
      ];

  DateTime get createdDate => _createdDate;

  int get creatorId => _creatorId;

  DateTime? get lastUpdate => _lastUpdate;

  DateTime? get lastAccessedDate => _lastViewDate;

  int? get remoteAccesses => _remoteViews;

  int? get accesses => _views;

  String? get checksum => _checksum;

  Map<String, dynamic> jsonToCheckForUpdates() {
    return {
      "remoteId": remoteId,
      "checksum": checksum,
      "lastUpdate": lastUpdate?.toIso8601String(),
    };
  }
}
