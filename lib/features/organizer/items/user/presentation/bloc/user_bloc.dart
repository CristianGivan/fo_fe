import 'dart:async';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/get_user_and_linked_user_items.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/get_user_items_by_user_id_use_case.dart';
import 'package:fo_fe/features/organizer/items/user/domain/usecases/user_usecase_export.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final AddUserUseCase addUser;
  final AddUserToUserUseCase addUserToUser;
  final UpdateUser updateUser;
  final DeleteUser deleteUser;
  final DeleteUserFromUser deleteUserFromUser;
  final GetUserByIdUseCase getUserById;
  final GetUserItemsByIdSet getUserItemsByIdSet;
  final GetUserItemsByUserId getUserItemsByUserId;
  final GetLinkedUserItems getUserAndLinkedUserItems;

  UserBloc({
    required this.addUser,
    required this.addUserToUser,
    required this.updateUser,
    required this.deleteUser,
    required this.deleteUserFromUser,
    required this.getUserById,
    required this.getUserItemsByIdSet,
    required this.getUserItemsByUserId,
    required this.getUserAndLinkedUserItems,
  }) : super(UserInitialBlocState()) {
    on<AddUserBlocEvent>(_onAddUser);
    on<AddUserToUserBlocEvent>(_onAddUserToUser);
    on<UpdateUserBlocEvent>(_onUpdateUser);
    on<DeleteUserBlocEvent>(_onDeleteUser);
    on<DeleteUserFromUserBlocEvent>(_onDeleteUserFromUser);
    on<GetUserByIdBlocEvent>(_onGetUserById);
    on<GetUserItemsByIdSetBlocEvent>(_onGetUserItemsByIdSet);
    on<GetUserItemsByUserIdBlocEvent>(_onGetUserItemsByUserId);
    on<GetLinkedUserItemsBlocEvent>(_onGetLinkedUserItems);
  }

  Future<void> _onAddUser(AddUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final failureOrSuccess = await addUser(UserParams(user: event.user));
    failureOrSuccess.fold(
      (failure) => emit(UserErrorBlocState(_mapFailureToMessage(failure))),
      (success) => emit(UserSuccessBlocState(success.id)),
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
    final failureOrUser = await getUserById(UserParams(userId: event.id));
    failureOrUser.fold(
      (failure) => emit(UserErrorBlocState(_mapFailureToMessage(failure))),
      (user) => user != null
          ? emit(SingleUserLoadedBlocState(user))
          : emit(UserErrorBlocState('User not found')),
    );
  }

  Future<void> _onGetLinkedUserItems(
      GetLinkedUserItemsBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserLoadingBlocState());
    final failureOrUsers = await getUserAndLinkedUserItems(UserParams(user: event.user));
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
        AddUserToUserParams(userLinked: event.userLinked, authUserId: event.authUserId));
    emit(result.fold(
      (failure) => UserErrorBlocState(_mapFailureToMessage(failure)),
      (id) => UserAddedToUserBlocState(id: id),
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
        return 'An error occurred: \n ${failure.message}';
    }
  }
}
