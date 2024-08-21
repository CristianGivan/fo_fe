part of 'user_bloc.dart';

class UserBlocUser extends Bloc<UserBlocEvent, UserBlocState> {
  final InsertUser insertUser;
  final UpdateUser updateUser;
  final DeleteUser deleteUser;
  final GetUserById getUserById;
  final GetUserItemsAll getUserItemsAll;
  final GetUserItemsByIdSet getUserItemsByIdSet;
  final GetUserItemsByUserId getUserItemsByUserId;
  final AddUserToUser addUserToUser;
  final DeleteUserFromUser deleteUserFromUser;

  UserBlocUser({
    required this.insertUser,
    required this.updateUser,
    required this.deleteUser,
    required this.getUserById,
    required this.getUserItemsAll,
    required this.getUserItemsByIdSet,
    required this.getUserItemsByUserId,
    required this.addUserToUser,
    required this.deleteUserFromUser,
  }) : super(UserBlocInitialState()) {
    on<InsertUserBlocEvent>(_onInsertUser);
    on<UpdateUserBlocEvent>(_onUpdateUser);
    on<DeleteUserBlocEvent>(_onDeleteUser);
    on<GetUserByIdBlocEvent>(_onGetUserById);
    on<GetUserItemsAllBlocEvent>(_onGetUserItemsAll);
    on<GetUserItemsByIdSetBlocEvent>(_onGetUserItemsByIdSet);
    on<GetUserItemsByUserIdBlocEvent>(_onGetUserItemsByUserId);
    on<AddUserToUserBlocEvent>(_onAddUserToUser);
    on<DeleteUserFromUserBlocEvent>(_onDeleteUserFromUser);
  }

  Future<void> _onInsertUser(
      InsertUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await insertUser(InsertUserParams(user: event.user));
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (id) => UserBlocInsertedState(id: id),
    ));
  }

  Future<void> _onUpdateUser(
      UpdateUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await updateUser(UpdateUserParams(user: event.user));
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (success) => UserBlocUpdatedState(success: success),
    ));
  }

  Future<void> _onDeleteUser(
      DeleteUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await deleteUser(DeleteUserParams(userId: event.userId));
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (id) => UserBlocDeletedState(id: id),
    ));
  }

  Future<void> _onGetUserById(
      GetUserByIdBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await getUserById(GetUserByIdParams(id: event.id));
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (user) => UserBlocLoadedState(user: user),
    ));
  }

  Future<void> _onGetUserItemsAll(
      GetUserItemsAllBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await getUserItemsAll(NoParams());
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (users) => UserBlocAllItemsLoadedState(users: users),
    ));
  }

  Future<void> _onGetUserItemsByIdSet(
      GetUserItemsByIdSetBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await getUserItemsByIdSet(
        GetUserItemsByIdSetParams(idSet: event.idSet));
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (users) => UserBlocItemsLoadedState(users: users),
    ));
  }

  Future<void> _onGetUserItemsByUserId(
      GetUserItemsByUserIdBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await getUserItemsByUserId(
        GetUserItemsByUserIdParams(userId: event.userId));
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (users) => UserBlocItemsLoadedState(users: users),
    ));
  }

  Future<void> _onAddUserToUser(
      AddUserToUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await addUserToUser(AddUserToUserParams(
        userLinkedId: event.userLinkedId, userId: event.userId));
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (id) => UserBlocAddedState(id: id),
    ));
  }

  Future<void> _onDeleteUserFromUser(
      DeleteUserFromUserBlocEvent event, Emitter<UserBlocState> emit) async {
    emit(UserBlocLoading());
    final result = await deleteUserFromUser(DeleteUserFromUserParams(
        userLinkedId: event.userLinkedId, userId: event.userId));
    emit(result.fold(
      (failure) => UserBlocErrorState(message: _mapFailureToMessage(failure)),
      (id) => UserBlocDeletedState(id: id),
    ));
  }
}
