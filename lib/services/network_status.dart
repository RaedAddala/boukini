import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:get/get.dart';

import '../Views/no_connection/network_error.dart';

class NetworkStatusService extends GetxService {
  bool _connectionDialogShown = false;

  @override
  Future<void> onReady() async {
    _connectionDialogShown = !(await InternetConnectionChecker().hasConnection);
    if (_connectionDialogShown) {
      Get.dialog(const NetworkErrorPage(), useSafeArea: false);
    }
    super.onReady();
  }

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
