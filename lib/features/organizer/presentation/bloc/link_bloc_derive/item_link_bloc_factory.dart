import 'package:fo_fe/features/organizer/presentation/bloc/link_bloc_derive/item_tag_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/link_bloc_derive/item_user_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

OrganizerLinkBloc<T> createItemLinkBloc<T extends OrganizerItemEntity>(ItemsTypeEnum itemType) {
  switch (itemType) {
    case ItemsTypeEnum.taskUser:
      return ItemUserLinkBloc(getItemsLinked: GetIt.instance.get()) as OrganizerLinkBloc<T>;
    case ItemsTypeEnum.taskTag:
      return ItemTagLinkBloc(getItemsLinked: GetIt.instance.get()) as OrganizerLinkBloc<T>;
    default:
      throw UnsupportedError('Unsupported itemType: $itemType');
  }
}
