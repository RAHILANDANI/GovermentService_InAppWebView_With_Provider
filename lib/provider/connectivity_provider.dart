import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:govermentservice/model/connectivity_model.dart';

class ConnectivityProvider extends ChangeNotifier {
  Connectivitymodel connectivitymodel =
      Connectivitymodel(coneectivity: "Offline");
  Connectivity connectivity = Connectivity();

  void CheckConnectivity() {
    connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        connectivitymodel.coneectivity = 'online';
        notifyListeners();
      } else {
        connectivitymodel.coneectivity = 'Offline';
        notifyListeners();
      }
    });
  }
}
