import 'package:fo_fe/core/utils/exports/external_exports.dart';

abstract class UserLinkEntity extends Equatable {
  final int id;
  final int remoteId;
  final bool isSelected;

  const UserLinkEntity({
    required this.id,
    required this.remoteId,
    required this.isSelected,
  });

  bool get isEmpty;

  @override
  List<Object?> get props => [id, remoteId, isSelected];
}
