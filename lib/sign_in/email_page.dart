import 'package:bloc_tutorial/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_tutorial/sign_in/bloc/sign_in_state.dart';
import 'package:bloc_tutorial/sign_in/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPage extends StatelessWidget {
  EmailPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In with email"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            BlocBuilder<SignInBloc, SigninState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.error,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email Address",
              ),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangedEvent(
                    emailController.text,
                    passwordController.text,
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangedEvent(
                    emailController.text,
                    passwordController.text,
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SigninState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInButtonChangedEvent(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        (state is SignInValidState) ? Colors.cyan : Colors.grey,
                  ),
                  child: Text(
                    "Submit",
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
