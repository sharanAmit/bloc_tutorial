import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initial, Lost, Gain }

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  InternetCubit() : super(InternetState.Initial) {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.Gain);
      } else {
        emit(InternetState.Gain);
      }
    });
  }
  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
