import 'package:bloc_tutorial/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_tutorial/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SigninEvent, SigninState> {
  SignInBloc() : super(SignInInitState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.email == "") {
        emit(SignInErrorState("Please enter valid email"));
      } else if (event.password.length < 8) {
        emit(SignInErrorState("Please enter valid password"));
      } else {
        emit(SignInValidState());
      }
    }); // event SignInTextChangeEvent
    on<SignInButtonChangedEvent>((event, emit) {
      emit(SignInLoadingState());
    }); // event SignInButtonCHangedEvent
  }
}
