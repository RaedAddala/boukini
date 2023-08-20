import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/config/routes.dart';

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
  static const int _numPages = 3;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.home);
                    },
                    child: const Text("Skip"),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        PageView(
                          controller: _pageController,
                          onPageChanged: (int index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          children: [
                            Container(child: const Text("First Screen")),
                            Container(child: const Text("Second Screen")),
                            Container(child: const Text("Third Screen")),
                          ],
                        ),
                        Positioned(
                          bottom: 80,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                _indicator(_currentIndex == 0),
                                const SizedBox(
                                  width: 10,
                                ),
                                _indicator(_currentIndex == 1),
                                const SizedBox(
                                  width: 10,
                                ),
                                _indicator(_currentIndex == 2),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () => _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOutCirc,
                                ),
                                child: const Text("Prev"),
                              ),
                              const SizedBox(width: 50),
                              ElevatedButton(
                                onPressed: () => _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOutCirc,
                                ),
                                child: const Text("Next"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    height: 8.0,
    width: isActive ? 24.0 : 16.0,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue),
      color: isActive ? Colors.white : const Color(0xFF7B51D3),
      borderRadius: const BorderRadius.all(Radius.circular(100)),
    ),
  );
}
