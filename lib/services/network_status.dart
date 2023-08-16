import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:get/get.dart';

import '../Views/no_connection/network_error.dart';

class NetworkStatusService extends GetxService {
  bool _connectionDialogShown = false;

  @override
  Future<void> onReady() async {
    super.onReady();
    _connectionDialogShown = !(await InternetConnectionChecker().hasConnection);
    if (_connectionDialogShown) {
      Get.dialog(const NetworkErrorPage(), useSafeArea: false);
    }
  }

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult currStatus) async {
        if (currStatus != ConnectivityResult.none &&
            await InternetConnectionChecker().hasConnection) {
          if (_connectionDialogShown) Get.back();
        } else {
          Get.dialog(const NetworkErrorPage(), useSafeArea: false);
          _connectionDialogShown = true;
        }
      },
    );
  }
}
