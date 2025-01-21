import "package:flutter/material.dart";
import "package:internet_connection_checker_plus/internet_connection_checker_plus.dart";

class ConnectionProvider extends ChangeNotifier {
  InternetStatus _connectionStatus = InternetStatus.connected;
  late Stream<InternetStatus> connectionStream;

  ConnectionProvider() {
    connectionStream = InternetConnection().onStatusChange;
    _monitorConnection();
  }

  InternetStatus get connectionStatus => _connectionStatus;

  void _monitorConnection() {
    connectionStream.listen((status) {
      _connectionStatus = status;
      notifyListeners();
    });
  }

  Future<bool> checkInternet() async {
    return await InternetConnection().hasInternetAccess;
  }
}
