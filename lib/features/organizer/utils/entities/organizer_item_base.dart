import 'package:fo_fe/core/utils/exports/external_exports.dart';

class OrganizerItemBase extends Equatable {
  final int _id;
  final int _remoteId;

  const OrganizerItemBase({int? id, int? remoteId})
      : _id = id ?? 0,
        _remoteId = remoteId ?? 0;

  // Factory for an "empty" instance
  static final OrganizerItemBase _emptyInstance = OrganizerItemBase(id: 0, remoteId: 0);

  factory OrganizerItemBase.empty() => _emptyInstance;

  bool get isEmpty => this == _emptyInstance;

  @override
  List<Object?> get props => [id, remoteId];

  int get id => _id;

  int get remoteId => _remoteId;
}
