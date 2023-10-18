import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:connectivity/connectivity.dart';

class ConnectivityService {
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(result);
    });
  }

  Future<ConnectivityResult> checkConnectivity() async {
    return await Connectivity().checkConnectivity();
  }

  void dispose() {
    connectionStatusController.close();
  }
}
