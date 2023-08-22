import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:get/get.dart';

import '../Views/no_connection/network_error.dart';

class NetworkStatusService extends GetxService {
  bool _connectionDialogShown = false;

  NetworkStatusService() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          if (_connectionDialogShown) {
            Get.back();
            _connectionDialogShown = false;
          }
          break;
        case InternetConnectionStatus.disconnected:
          Get.dialog(const NetworkErrorPage(), useSafeArea: false);
          _connectionDialogShown = true;
          break;
      }
    });
  }
}
