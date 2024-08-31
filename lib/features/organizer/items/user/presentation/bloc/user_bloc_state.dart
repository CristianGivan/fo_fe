part of 'user_bloc.dart';

abstract class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object?> get props => [];
}

class UserInitialBlocState extends UserBlocState {}

class UserLoadingBlocState extends UserBlocState {}

class UserInsertedBlocState extends UserBlocState {
  final int id;

  const UserInsertedBlocState({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserUpdatedBlocState extends UserBlocState {
  final bool success;

  const UserUpdatedBlocState({required this.success});

  @override
  List<Object?> get props => [success];
}

class UserDeletedBlocState extends UserBlocState {
  final int id;

  const UserDeletedBlocState({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserLoadedBlocState extends UserBlocState {
  final UserEntity user;

  const UserLoadedBlocState({required this.user});

  @override
  List<Object?> get props => [user];
}

class UsertemsLoadedBlocIState extends UserBlocState {
  final OrganizerItems<UserEntity> users;

  const UsertemsLoadedBlocIState({required this.users});

  @override
  List<Object?> get props => [users];
}

class UserAllItemsLoadedBlocState extends UserBlocState {
  final OrganizerItems<UserEntity> users;

  const UserAllItemsLoadedBlocState({required this.users});

  @override
  List<Object?> get props => [users];
}

class UserAddedBlocState extends UserBlocState {
  final int id;

  const UserAddedBlocState({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserErrorBlocState extends UserBlocState {
  final String message;

  const UserErrorBlocState({required this.message});

  @override
  List<Object?> get props => [message];
}
