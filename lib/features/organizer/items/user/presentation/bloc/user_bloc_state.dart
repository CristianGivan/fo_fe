part of 'user_bloc.dart';

abstract class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object?> get props => [];
}

class UserBlocInitialState extends UserBlocState {}

class UserBlocLoading extends UserBlocState {}

class UserBlocInsertedState extends UserBlocState {
  final int id;

  const UserBlocInsertedState({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserBlocUpdatedState extends UserBlocState {
  final bool success;

  const UserBlocUpdatedState({required this.success});

  @override
  List<Object?> get props => [success];
}

class UserBlocDeletedState extends UserBlocState {
  final int id;

  const UserBlocDeletedState({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserBlocLoadedState extends UserBlocState {
  final UserEntity user;

  const UserBlocLoadedState({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserBlocItemsLoadedState extends UserBlocState {
  final OrganizerItems<UserEntity> users;

  const UserBlocItemsLoadedState({required this.users});

  @override
  List<Object?> get props => [users];
}

class UserBlocAllItemsLoadedState extends UserBlocState {
  final OrganizerItems<UserEntity> users;

  const UserBlocAllItemsLoadedState({required this.users});

  @override
  List<Object?> get props => [users];
}

class UserBlocAddedState extends UserBlocState {
  final int id;

  const UserBlocAddedState({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserBlocErrorState extends UserBlocState {
  final String message;

  const UserBlocErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
