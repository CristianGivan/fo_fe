part of 'user_bloc.dart';

abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object?> get props => [];
}

class UserInsertBlocEvent extends UserBlocEvent {
  final UserEntity user;

  const UserInsertBlocEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserUpdateBlocEvent extends UserBlocEvent {
  final UserEntity user;

  const UserUpdateBlocEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserDeleteBlocEvent extends UserBlocEvent {
  final int userId;

  const UserDeleteBlocEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class GetUserByIdBlocEvent extends UserBlocEvent {
  final int id;

  const GetUserByIdBlocEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetUserItemsAllBlocEvent extends UserBlocEvent {}

class GetUserItemsByIdSetBlocEvent extends UserBlocEvent {
  final IdSet idSet;

  const GetUserItemsByIdSetBlocEvent({required this.idSet});

  @override
  List<Object?> get props => [idSet];
}

class GetUserItemsByUserIdBlocEvent extends UserBlocEvent {
  final int userId;

  const GetUserItemsByUserIdBlocEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class AddUserToUserBlocEvent extends UserBlocEvent {
  final int userLinkedId;
  final int userId;

  const AddUserToUserBlocEvent(
      {required this.userLinkedId, required this.userId});

  @override
  List<Object?> get props => [userLinkedId, userId];
}

class DeleteUserFromUserBlocEvent extends UserBlocEvent {
  final int userLinkedId;
  final int userId;

  const DeleteUserFromUserBlocEvent(
      {required this.userLinkedId, required this.userId});

  @override
  List<Object?> get props => [userLinkedId, userId];
}
