part of authentication;

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepo _userRepository;

  SignUpBloc({required UserRepo userRepository}): _userRepository = userRepository, super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        MyUser user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUserData(user);
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
