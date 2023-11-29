import 'package:bloc_tutorial/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Gain) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Internet connected",
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state == InternetState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Internet not connected",
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state == InternetState.Gain) {
              return Text("Connected to internet...");
            } else if (state == InternetState.Lost) {
              return Text("Not Connected to internet...");
            } else {
              return Text("Loading...");
            }
          },
        ),
        // BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {

        //   },
        // ),
      ),
    );
  }
}
