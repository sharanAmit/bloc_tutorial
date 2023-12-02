import 'package:bloc_tutorial/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_tutorial/cubit/internet_cubit.dart';
import 'package:bloc_tutorial/home_page.dart';
import 'package:bloc_tutorial/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return

      MaterialApp(
        title: 'Flutter Bloc Tutorial',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Welcome(),

    );
  }
}
