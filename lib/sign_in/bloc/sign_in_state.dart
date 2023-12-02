abstract class SigninState {}

class SignInInitState extends SigninState {}

class SignInErrorState extends SigninState {
  final String error;
  SignInErrorState(this.error);
}

class SignInInvalidState extends SigninState {}

class SignInValidState extends SigninState {}

class SignInLoadingState extends SigninState {}
