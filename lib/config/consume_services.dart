import 'package:get/get.dart';
import 'package:hotel_booking/services/network_status.dart';

class Services {
  static void init() async {
    Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);
  }
}
