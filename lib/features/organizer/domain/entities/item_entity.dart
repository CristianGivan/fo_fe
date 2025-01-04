import 'package:fo_fe/core/utils/exports/external_exports.dart';

class ItemEntity extends Equatable {
  final int _id;
  final int _remoteId;

  const ItemEntity({int? id, int? remoteId, String? subject})
      : _id = id ?? 0,
        _remoteId = remoteId ?? 0;

  // Factory for an "empty" instance
  static final ItemEntity _emptyInstance = ItemEntity(
    id: 0,
    remoteId: 0,
  );

  factory ItemEntity.empty() => _emptyInstance;

  bool get isEmpty => this == _emptyInstance;

  int get id => _id;

  int get remoteId => _remoteId;

  @override
  List<Object?> get props => [id, remoteId];
}
