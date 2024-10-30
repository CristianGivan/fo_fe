part of 'user_bloc.dart';

abstract class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object> get props => [];
}

class UserInitialBlocState extends UserBlocState {}

class UserLoadingBlocState extends UserBlocState {}

class UserItemsLoadedBlocState extends UserBlocState {
  final OrganizerItems<UserEntity> userItems;

  UserItemsLoadedBlocState(this.userItems);

  @override
  List<Object> get props => [userItems];
}

class UserErrorBlocState extends UserBlocState {
  final String message;

  UserErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}

class UserSuccessBlocState extends UserBlocState {
  final int id;

  UserSuccessBlocState(this.id);

  @override
  List<Object> get props => [id];
}

class SingleUserLoadedBlocState extends UserBlocState {
  final UserEntity user;

  SingleUserLoadedBlocState(this.user);

  @override
  List<Object> get props => [user];
}

class UserAddedBlocState extends UserBlocState {
  final int id;

  const UserAddedBlocState({required this.id});

  @override
  List<Object> get props => [id];
}

class UserDeletedBlocState extends UserBlocState {
  final int id;

  const UserDeletedBlocState({required this.id});

  @override
  List<Object> get props => [id];
}

class UserItemsLoadedBlocIState extends UserBlocState {
  final OrganizerItems<UserEntity> users;

  const UserItemsLoadedBlocIState({required this.users});

  @override
  List<Object> get props => [users];
}
