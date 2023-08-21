import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'package:hotel_booking/config/routes.dart';

import 'onboarding_screens/screen1.dart';
import 'onboarding_screens/screen2.dart';
import 'onboarding_screens/screen3.dart';
import 'onboarding_screens/screen4.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() {
    return _OnboardingState();
  }
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  static const int _numPages = 4;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCirc,
        );
        return Future<bool>.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              LiquidSwipe(
                enableLoop: false,
                pages: [
                  Screen1(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
