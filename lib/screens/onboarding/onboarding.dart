import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/screens/onboarding/controllers/onboarding_controller.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _controller.prevView();
        return Future<bool>.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              LiquidSwipe(
                liquidController: _controller.pageController,
                onPageChangeCallback: (activePageIndex) {
                  _controller.currentIndex.value = activePageIndex;
                },
                enableLoop: false,
                pages: OnboardingController.pages,
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SizedBox(
                      width: Get.width * 0.25,
                      child: ElevatedButton(
                        onPressed: _controller.nextView,
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                              ),
                              elevation: const MaterialStatePropertyAll(3.5),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              overlayColor: MaterialStatePropertyAll(
                                  Colors.blueGrey.shade50),
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
                bottom: 50,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SizedBox(
                      width: Get.width * 0.25,
                      child: ElevatedButton(
                        onPressed: _controller.prevView,
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                              ),
                              elevation: const MaterialStatePropertyAll(3.5),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              overlayColor: MaterialStatePropertyAll(
                                  Colors.blueGrey.shade50),
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
                  onPressed: _controller.skip,
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Obx(
                  () => Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: _controller.currentIndex.value,
                      count: OnboardingController.numPages,
                      duration: const Duration(milliseconds: 620),
                      effect: const ScrollingDotsEffect(
                        activeDotColor: Colors.white,
                        dotHeight: 7,
                        dotWidth: 14,
                        activeDotScale: 1.8,
                        offset: 22,
                      ),
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
