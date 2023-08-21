import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  final double height;
  final double width;
  const Screen4(this.height, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          height: width,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset(
              "assets/onboarding/checkin.jpg",
              filterQuality: FilterQuality.low,
              isAntiAlias: true,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Choose Your Accommodation",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          "Browse our accommodation catalog, set your needs and choose the most suitable one",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
