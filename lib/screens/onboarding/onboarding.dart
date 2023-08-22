import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'package:hotel_booking/config/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_screens/screen1.dart';
import 'onboarding_screens/screen2.dart';
import 'onboarding_screens/screen3.dart';
import 'onboarding_screens/screen4.dart';
import 'onboarding_screens/screen5.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() {
    return _OnboardingState();
  }
}

class _OnboardingState extends State<Onboarding> {
  final LiquidController _pageController = LiquidController();
  int _currentIndex = 0;
  static const int _numPages = 5;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_currentIndex > 0) _currentIndex--;
        _pageController.animateToPage(
          page: _currentIndex,
          duration: 800,
        );
        return Future<bool>.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              LiquidSwipe(
                liquidController: _pageController,
                onPageChangeCallback: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                enableLoop: false,
                pages: const [
                  Screen1(),
                  Screen2(),
                  Screen3(),
                  Screen4(),
                  Screen5(),
                ],
              ),
              Positioned(
                bottom: 65,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: Get.width * 0.2,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentIndex + 1 < _numPages) {
                            _currentIndex++;
                            _pageController.animateToPage(
                              page: _currentIndex,
                              duration: 800,
                            );
                          } else {
                            Get.offAllNamed(Routes.home);
                          }
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 2,
                                ),
                              ),
                              elevation: const MaterialStatePropertyAll(3.5),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              surfaceTintColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.background),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.grey.shade50),
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                            ),
                        child: const Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 65,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: Get.width * 0.2,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentIndex > 0) {
                            _currentIndex--;
                            _pageController.animateToPage(
                              page: _currentIndex,
                              duration: 800,
                            );
                          }
                        },
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 2,
                                ),
                              ),
                              elevation: const MaterialStatePropertyAll(3.5),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              surfaceTintColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.background),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.grey.shade50),
                              foregroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                            ),
                        child: const Center(
                          child: Text(
                            "Prev",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 3,
                child: TextButton(
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => Get.offAllNamed(Routes.home),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: _numPages,
                    duration: const Duration(milliseconds: 350),
                    effect: const ScrollingDotsEffect(
                      dotHeight: 7,
                      dotWidth: 14,
                      activeDotScale: 1.6,
                      offset: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
