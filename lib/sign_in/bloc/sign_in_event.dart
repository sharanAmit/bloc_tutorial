abstract class SigninEvent{}
class SignInTextChangedEvent extends SigninEvent{
  final String email;
  final String password;
  SignInTextChangedEvent(this.email, this.password);
}
class SignInButtonChangedEvent extends SigninEvent{
  final String email;
  final String password;
  SignInButtonChangedEvent(this.email, this.password);
}