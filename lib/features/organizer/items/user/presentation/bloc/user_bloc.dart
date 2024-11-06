import 'dart:async';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/get_user_items_by_user_id.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/user_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocUser extends Bloc<UserBlocEvent, UserBlocState> {
  final AddUser addUser;
  final AddUserToUser addUserToUser;
  final UpdateUser updateUser;
  final DeleteUser deleteUser;
  final DeleteUserFromUser deleteUserFromUser;
  final GetUserById getUserById;
  final GetUserItemsByIdSet getUserItemsByIdSet;
  final GetUserItemsByUserId getUserItemsByUserId;
  final GetConnectedUserItems getConnectedUserItems;

  UserBlocUser({
    required this.addUser,
    required this.addUserToUser,
    required this.updateUser,
    required this.deleteUser,
    required this.deleteUserFromUser,
    required this.getUserById,
    required this.getUserItemsByIdSet,
    required this.getUserItemsByUserId,
    required this.getConnectedUserItems,
  }) : super(UserInitialBlocState()) {
    on<AddUserBlocEvent>(_onAddUser);
    on<AddUserToUserBlocEvent>(_onAddUserToUser);
    on<UpdateUserBlocEvent>(_onUpdateUser);
    on<DeleteUserBlocEvent>(_onDeleteUser);
    on<DeleteUserFromUserBlocEvent>(_onDeleteUserFromUser);
    on<GetUserByIdBlocEvent>(_onGetUserById);
    on<GetUserItemsByIdSetBlocEvent>(_onGetUserItemsByIdSet);
    on<GetUserItemsByUserIdBlocEvent>(_onGetUserItemsByUserId);
    on<GetConnectedUserItemsBlocEvent>(_onGetConnectedUserItems);
  }

  Future<void> _onAddUser(AddUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final failureOrSuccess = await addUser(AddUserParams(user: event.user));
    failureOrSuccess.fold(
      (failure) => emit(UserErrorBlocState(_mapFailureToMessage(failure))),
      (success) => emit(UserSuccessBlocState(success)),
    );
  }

  Future<void> _onUpdateUser(UpdateUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final failureOrSuccess = await updateUser(UpdateUserParams(user: event.user));
    failureOrSuccess.fold(
      (failure) => emit(UserErrorBlocState(_mapFailureToMessage(failure))),
      (success) =>
          emit(success ? UserSuccessBlocState(event.user.id) : UserErrorBlocState('Update failed')),
    );
  }

  Future<void> _onDeleteUser(DeleteUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final failureOrSuccess = await deleteUser(DeleteUserParams(userId: event.userId));
    failureOrSuccess.fold(
      (failure) => emit(UserErrorBlocState(_mapFailureToMessage(failure))),
      (success) => emit(UserSuccessBlocState(success)),
    );
  }

  Future<void> _onGetUserById(GetUserByIdBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final failureOrUser = await getUserById(GetUserByIdParams(id: event.id));
    failureOrUser.fold(
      (failure) => emit(UserErrorBlocState(_mapFailureToMessage(failure))),
      (user) => user != null
          ? emit(SingleUserLoadedBlocState(user))
          : emit(UserErrorBlocState('User not found')),
    );
  }

  Future<void> _onGetConnectedUserItems(
      GetConnectedUserItemsBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final failureOrUsers = await getConnectedUserItems(NoParams());
    failureOrUsers.fold(
      (failure) => emit(UserErrorBlocState(_mapFailureToMessage(failure))),
      (users) => emit(UserItemsLoadedBlocState(users)),
    );
  }

  Future<void> _onGetUserItemsByIdSet(
      GetUserItemsByIdSetBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final failureOrUsers = await getUserItemsByIdSet(UserParams(idSet: event.idSet));
    failureOrUsers.fold(
      (failure) => emit(UserErrorBlocState(_mapFailureToMessage(failure))),
      (users) => emit(UserItemsLoadedBlocState(users)),
    );
  }

  Future<void> _onGetUserItemsByUserId(
      GetUserItemsByUserIdBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final result = await getUserItemsByUserId(UserParams(userId: event.userId));
    emit(result.fold(
      (failure) => UserErrorBlocState(_mapFailureToMessage(failure)),
      (users) => UserItemsLoadedBlocIState(users: users),
    ));
  }

  Future<void> _onAddUserToUser(AddUserToUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final result = await addUserToUser(
        AddUserToUserParams(userLinkedId: event.userLinkedId, userId: event.userId));
    emit(result.fold(
      (failure) => UserErrorBlocState(_mapFailureToMessage(failure)),
      (id) => UserAddedBlocState(id: id),
    ));
  }

  Future<void> _onDeleteUserFromUser(
      DeleteUserFromUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final result = await deleteUserFromUser(
        DeleteUserFromUserParams(userLinkedId: event.userLinkedId, userId: event.userId));
    emit(result.fold(
      (failure) => UserErrorBlocState(_mapFailureToMessage(failure)),
      (id) => UserDeletedBlocState(id: id),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return 'Network error occurred';
      case ServerFailure:
        return 'Server error occurred';
      case CacheFailure:
        return 'Cache error occurred';
      default:
        return 'Unexpected error occurred';
    }
  }
}
