import 'package:fo_fe/core/utils/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

abstract class OrganizerItemRemoteDataSource<T extends OrganizerItemEntity> {
  Future<OrganizerItems<T>> getOrganizerItemsByIdSet(IdSet idSet);
}

class OrganizerItemRemoteDataSourceImpl<T extends OrganizerItemEntity>
    implements OrganizerItemRemoteDataSource<T> {
  @override
  Future<OrganizerItems<T>> getOrganizerItemsByIdSet(IdSet idSet) {
    // TODO: implement syncTaskListWithIdSet
    throw UnimplementedError();
  }
}
