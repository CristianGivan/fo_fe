import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemsType extends Equatable {
  final String type;
  final String routeName;
  final String Function(OrganizerItemEntity) itemTextBuilder; // Accepts OrganizerItemEntity

  const ItemsType({
    required this.type,
    required this.routeName,
    required this.itemTextBuilder,
  });

  @override
  List<Object?> get props => [type, routeName];
}
