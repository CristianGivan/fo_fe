part of authentication;

class LocalUserRepository implements UserRepository {
  @override
  Future<void> logOut() {
    // TODO: implement logOut
    return Future(() => null);
  }

  @override
  Future<void> setUserData(MyUser user) {
    // TODO: implement setUserData
    return Future(() => null);
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    return Future(() => null);
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) {
    // TODO: implement signUp
    return Future(() => MyUser.empty);
  }

  @override
  // TODO: implement user
  Stream<MyUser?> get user async* {
    yield MyUser.empty;
  }
}
