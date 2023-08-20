import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/config/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final borderCircularRadius = BorderRadius.circular(40);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.scaleDown,
                          width: 26,
                          height: 26,
                        ),
                        Text(
                          "oukini",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.cyan.shade600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SvgPicture.asset(
                  "assets/onboarding/welcomePage.svg",
                  height: 300,
                ),
                const SizedBox(height: 15),
                Text(
                  "Let's get Started!",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Book your vacation easily with your app Boukini.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    softWrap: true,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.onboarding);
                    },
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                          elevation: const MaterialStatePropertyAll(4),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: borderCircularRadius,
                            ),
                          ),
                          surfaceTintColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.background),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red.shade600),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                        ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
