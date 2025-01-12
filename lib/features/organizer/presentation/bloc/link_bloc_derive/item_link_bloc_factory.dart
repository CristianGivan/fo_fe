import 'package:dartz/dartz.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/link_bloc_derive/item_tag_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/link_bloc_derive/item_user_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/utils/exports/core_utils_exports.dart';

OrganizerLinkBloc<T> createItemLinkBloc<T extends OrganizerItemEntity>(ItemsTypeEnum itemType) {
  final GetLinkItemsByItemIdUseCase<T> getUserItemsByTaskIdUseCase = GetIt.instance.get();

  switch (itemType) {
    case ItemsTypeEnum.taskUser:
      return ItemUserLinkBloc(
        getItemsLinked: (ItemsLinkParams params) => getUserItemsByTaskIdUseCase(params)
            as Future<Either<Failure, OrganizerItems<UserEntity>>>,
      ) as OrganizerLinkBloc<T>;
    case ItemsTypeEnum.taskTag:
      return ItemTagLinkBloc(
        getItemsLinked: (ItemsLinkParams params) => getUserItemsByTaskIdUseCase(params)
            as Future<Either<Failure, OrganizerItems<TagEntity>>>,
      ) as OrganizerLinkBloc<T>;
    default:
      throw UnsupportedError('Unsupported itemType: $itemType');
  }
}

OrganizerLinkBloc<T> getItemLinkBlocFromContext<T extends OrganizerItemEntity>(
    BuildContext context, ItemsTypeEnum itemType) {
  switch (itemType) {
    //todo -do- what will happen if there are not boc in context
    case ItemsTypeEnum.taskUser:
      return context.read<ItemUserLinkBloc>() as OrganizerLinkBloc<T>;
    case ItemsTypeEnum.taskTag:
      return context.read<ItemTagLinkBloc>() as OrganizerLinkBloc<T>;
    default:
      throw UnsupportedError('Unsupported itemType: $itemType');
  }
}
