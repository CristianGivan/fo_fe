import 'package:fo_fe/features/organizer/domain/entities/organizer_item_entity.dart';

import '../../../../../core/utils/exports/external_exports.dart';

class LinkItemCardPage<T extends OrganizerItemEntity> extends StatelessWidget {
  final T item;

  const LinkItemCardPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.subject),
    );
  }
}
