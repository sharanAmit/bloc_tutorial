import 'package:bloc_tutorial/sign_in/bloc/signin_bloc.dart';
import 'package:bloc_tutorial/sign_in/email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => SignInBloc(),
                      child: EmailPage(),
                    );
                  },
                ),
              );
            },
            child: Text(
              "Continue with email",
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Continue with Gmail",
            ),
          ),
        ],
      ),
    );
  }
}
