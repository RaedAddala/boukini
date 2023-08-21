import 'dart:math';

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
          duration: 700,
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
                enableSideReveal: true,
                pages: const [
                  Screen1(),
                  Screen2(),
                  Screen3(),
                  Screen4(),
                  Screen5(),
                ],
              ),
              Positioned(
                bottom: 12,
                left: 22,
                child: Center(
                  child: OutlinedButton(
                    onPressed: () {
                      if (_currentIndex < _numPages) _currentIndex++;
                      _pageController.animateToPage(
                        page: _currentIndex,
                        duration: 700,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black38),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(14),
                      foregroundColor: Colors.white,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 15,
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
                bottom: 45,
                right: 38,
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
            ],
          ),
        ),
      ),
    );
  }
}
