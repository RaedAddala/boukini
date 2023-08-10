import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hotel_booking/config/routes.dart';

class FormPageController extends GetxController {
  final int numberOfPages;
  final int initialPage;
  late final PageController pagecontroller;
  int currPage = 0;
  FormPageController(this.numberOfPages, this.initialPage) {
    pagecontroller = PageController(
      initialPage: initialPage,
    );
  }
  void nextPage() {
    if (currPage == numberOfPages - 1) {
      //Get.offAllNamed(Routes.dashboard);
    } else {
      pagecontroller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      currPage++;
    }
  }

  void prevPage() {
    if (currPage == 0) {
      Get.offAllNamed(Routes.phoneNumber);
    } else {
      pagecontroller.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      currPage--;
    }
  }
}
