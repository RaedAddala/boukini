import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          SvgPicture.asset(
            "assets/onboarding/screen6.svg",
            height: 330,
            fit: BoxFit.fill,
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator()),
          ),
          const SizedBox(height: 4),
          Text(
            "InAPP Wallet",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Manage your in-app Wallet at ease. All payements will be done with it",
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
