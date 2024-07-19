part of 'user_bloc.dart';

abstract class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object?> get props => [];
}

class UserBlocInitial extends UserBlocState {}

class UserBlocLoading extends UserBlocState {}

class UserBlocInserted extends UserBlocState {
  final int id;

  const UserBlocInserted({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserBlocUpdated extends UserBlocState {
  final bool success;

  const UserBlocUpdated({required this.success});

  @override
  List<Object?> get props => [success];
}

class UserBlocDeleted extends UserBlocState {
  final int id;

  const UserBlocDeleted({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserBlocLoaded extends UserBlocState {
  final UserEntity user;

  const UserBlocLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserBlocItemsLoaded extends UserBlocState {
  final OrganizerItems<UserEntity> users;

  const UserBlocItemsLoaded({required this.users});

  @override
  List<Object?> get props => [users];
}

class UserBlocAdded extends UserBlocState {
  final int id;

  const UserBlocAdded({required this.id});

  @override
  List<Object?> get props => [id];
}

class UserBlocError extends UserBlocState {
  final String message;

  const UserBlocError({required this.message});

  @override
  List<Object?> get props => [message];
}
