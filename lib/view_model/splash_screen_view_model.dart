import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
class SplashScreenViewModel extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  bool isConnected = false;

  Future<void> updateConnection() async {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        isConnected = true;
        _streamSubscription?.cancel();
      }
      isConnected = false;
    });
    notifyListeners();
  }
}
