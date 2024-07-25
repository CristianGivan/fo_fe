import 'package:fo_fe/features/organizer/util/id_set.dart';
import 'package:fo_fe/features/organizer/util/organizer_items.dart';

import '../../domain/entities/organizer_item_entity.dart';

abstract class OrganizerItemLocalDataSource<T extends OrganizerItemEntity> {
  Future<OrganizerItems<T>> getOrganizerItemsByIdSet(IdSet idSet);
}

class OrganizerItemLocalDataSourceImpl<T extends OrganizerItemEntity>
    implements OrganizerItemLocalDataSource {
  @override
  Future<OrganizerItems<T>> getOrganizerItemsByIdSet(IdSet idSet) {
    // TODO: implement syncTaskListWithIdSet
    throw UnimplementedError();
  }
}
