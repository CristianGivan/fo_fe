import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/const/constants.dart';

class OrganizerItemEntity extends Equatable {
  final int _id;
  final DateTime _createdDate;
  final int _creatorId;
  final int _remoteId;
  final DateTime? _lastUpdate;
  final DateTime? _lastViewDate;
  final int? _remoteViews;
  final int? _views;
  final String? _checksum;

//todo why constructor cannot be const with INITIAL_EPOCH_DATE
  OrganizerItemEntity({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastAccessedDate,
    int? remoteAccesses,
    int? accesses,
    String? checksum,
  })  : _id = id ?? 0,
        _createdDate = createdDate ?? INITIAL_EPOCH_DATE,
        _creatorId = creatorId ?? 0,
        _remoteId = remoteId ?? 0,
        _lastUpdate = lastUpdate,
        _lastViewDate = lastAccessedDate,
        _remoteViews = remoteAccesses,
        _views = accesses,
        _checksum = checksum;

  @override
  List<Object?> get props => [
        id,
        createdDate,
        creatorId,
        remoteId,
        lastUpdate,
        lastAccessedDate,
        remoteAccesses,
        accesses,
        checksum,
      ];

  int get id => _id;

  DateTime get createdDate => _createdDate;

  int get creatorId => _creatorId;

  int get remoteId => _remoteId;

  DateTime? get lastUpdate => _lastUpdate;

  DateTime? get lastAccessedDate => _lastViewDate;

  int? get remoteAccesses => _remoteViews;

  int? get accesses => _views;

  String? get checksum => _checksum;

//  todo tests
  Map<String, dynamic> jsonToCheckForUpdates() {
    return {
      "remoteId": remoteId,
      "checksum": checksum,
      "lastUpdate": lastUpdate?.toIso8601String(),
    };
  }
}
