import 'package:fo_fe/core/utils/exports/external_exports.dart';

abstract class ItemEntity extends Equatable {
  final int id;
  final int remoteId;
  final String subject;

  const ItemEntity({
    required this.id,
    required this.remoteId,
    required this.subject,
  });

  bool get isEmpty;

  @override
  List<Object?> get props => [id, remoteId, subject];
}
