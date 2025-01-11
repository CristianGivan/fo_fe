part of 'item_link_items_bloc.dart';

abstract class ItemLinkItemsBlocEvent extends Equatable {
  final ItemType itemsType;

  const ItemLinkItemsBlocEvent({required this.itemsType});

  @override
  List<Object> get props => [];
}

class GetItemsByTaskIdBlocEvent extends ItemLinkItemsBlocEvent {
  final int taskId;

  const GetItemsByTaskIdBlocEvent({required super.itemsType, required this.taskId});

  @override
  List<Object> get props => [taskId];
}

class UpdateItemsOfTaskBlocEvent extends ItemLinkItemsBlocEvent {
  final int taskId;
  final OrganizerItems<UserEntity> userItems;
  final OrganizerItems<UserEntity> updatedUserItems;

  const UpdateItemsOfTaskBlocEvent({
    required super.itemsType,
    required this.taskId,
    required this.userItems,
    required this.updatedUserItems,
  });

  @override
  List<Object> get props => [taskId, userItems, updatedUserItems];
}

class UpdateTaskItemsLinkBlocEvent extends ItemLinkItemsBlocEvent {
  final TaskUserLinkEntity taskUserLink;

  const UpdateTaskItemsLinkBlocEvent({required super.itemsType, required this.taskUserLink});

  @override
  List<Object> get props => [taskUserLink];
}
