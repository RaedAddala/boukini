import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    final double height = Get.height;
    final double width = Get.width;
    return Container(
      color: Colors.grey.shade50.withOpacity(0.46),
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 21.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 12),
          SvgPicture.asset(
            "assets/onboarding/screen1.svg",
            height: height * 0.42,
            width: width * 0.8,
            fit: BoxFit.fill,
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator()),
          ),
          // OctoImage(
          //   image: const AssetImage("assets/onboarding/find.jpg"),
          //   filterQuality: FilterQuality.high,
          //   fit: BoxFit.fill,
          //   fadeInCurve: Curves.easeInOut,
          //   fadeInDuration: const Duration(milliseconds: 400),
          //   progressIndicatorBuilder:
          //       OctoProgressIndicator.circularProgressIndicator(),
          //   errorBuilder: OctoError.icon(),
          //   height: height * 0.42,
          //   width: width * 0.8,
          // ),
          Column(
            children: [
              Text(
                "Choose Your Accommodation",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 20.5,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Browse our accommodation catalog, set your needs and choose the most suitable one.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
