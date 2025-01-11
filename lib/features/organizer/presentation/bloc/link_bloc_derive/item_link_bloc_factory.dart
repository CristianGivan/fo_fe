import 'package:dartz/dartz.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/link_bloc_derive/item_link_tag_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/link_bloc_derive/item_link_user_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/utils/exports/core_utils_exports.dart';

OrganizerLinkBloc<T> createItemLinkBloc<T extends OrganizerItemEntity>(ItemParams params) {
  final GetLinkItemsByItemIdUseCase<T> getUserItemsByTaskIdUseCase = GetIt.instance.get();

  switch (params.itemType) {
    case ItemType.taskUser:
      return ItemLinkUserBloc(
        getItemsLinked: (ItemParams params) => getUserItemsByTaskIdUseCase(params)
            as Future<Either<Failure, OrganizerItems<UserEntity>>>,
      ) as OrganizerLinkBloc<T>;
    case ItemType.taskTag:
      return ItemLinkTagBloc(
        getItemsLinked: (ItemParams params) => getUserItemsByTaskIdUseCase(params)
            as Future<Either<Failure, OrganizerItems<TagEntity>>>,
      ) as OrganizerLinkBloc<T>;
    default:
      throw UnsupportedError('Unsupported itemType: ${params.itemType}');
  }
}
