import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/routes.dart';

class SignUpPageController extends GetxController {
  final int numberOfPages;
  SignUpPageController(this.numberOfPages);
  int currPage = 0;
  final pagecontroller = PageController(
    initialPage: 0,
  );
  nextPage() {
    if (currPage == numberOfPages - 1) {
    } else {
      pagecontroller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      currPage++;
    }
  }

  prevPage() {
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