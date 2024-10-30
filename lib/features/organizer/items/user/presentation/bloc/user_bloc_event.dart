part of 'user_bloc.dart';

abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object> get props => [];
}

class AddUserBlocEvent extends UserBlocEvent {
  final UserEntity user;

  AddUserBlocEvent(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUserBlocEvent extends UserBlocEvent {
  final UserEntity user;

  UpdateUserBlocEvent(this.user);

  @override
  List<Object> get props => [user];
}

class DeleteUserBlocEvent extends UserBlocEvent {
  final int userId;

  DeleteUserBlocEvent(this.userId);

  @override
  List<Object> get props => [userId];
}

class GetUserByIdBlocEvent extends UserBlocEvent {
  final int id;

  GetUserByIdBlocEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetUserItemsAllBlocEvent extends UserBlocEvent {}

class GetUserItemsByIdSetBlocEvent extends UserBlocEvent {
  final IdSet idSet;

  GetUserItemsByIdSetBlocEvent(this.idSet);

  @override
  List<Object> get props => [idSet];
}

class GetUserItemsByUserIdBlocEvent extends UserBlocEvent {
  final int userId;

  const GetUserItemsByUserIdBlocEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AddUserToUserBlocEvent extends UserBlocEvent {
  final int userLinkedId;
  final int userId;

  const AddUserToUserBlocEvent({required this.userLinkedId, required this.userId});

  @override
  List<Object> get props => [userLinkedId, userId];
}

class DeleteUserFromUserBlocEvent extends UserBlocEvent {
  final int userLinkedId;
  final int userId;

  const DeleteUserFromUserBlocEvent({required this.userLinkedId, required this.userId});

  @override
  List<Object> get props => [userLinkedId, userId];
}
