import 'package:get/get.dart';
import 'package:hotel_booking/config/routes.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../onboarding_screens/screen1.dart';
import '../onboarding_screens/screen2.dart';
import '../onboarding_screens/screen3.dart';
import '../onboarding_screens/screen4.dart';
import '../onboarding_screens/screen5.dart';
import '../onboarding_screens/screen6.dart';

class OnboardingController extends GetxController {
  static const int _numPages = 6;
  static const pages = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
    Screen5(),
    Screen6(),
  ];
  final LiquidController _pageController = LiquidController();

  get pageController => _pageController;
  static get numPages => _numPages;

  RxInt currentIndex = 0.obs;

  void prevView() {
    if (currentIndex.value > 0) currentIndex.value--;
    _pageController.animateToPage(
      page: currentIndex.value,
      duration: 800,
    );
  }

  void nextView() {
    currentIndex.value++;
    if (currentIndex.value == numPages) {
      skip();
    } else {
      _pageController.animateToPage(
        page: currentIndex.value,
        duration: 850,
      );
    }
  }

  skip() {
    Get.offAllNamed(Routes.phoneNumber);
  }
}
