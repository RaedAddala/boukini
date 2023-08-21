import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          SvgPicture.asset(
            "assets/onboarding/screen5.svg",
            height: 340,
            fit: BoxFit.fill,
            placeholderBuilder: (BuildContext context) => Container(
                padding: const EdgeInsets.all(30.0),
                child: const CircularProgressIndicator()),
          ),
          const SizedBox(height: 15),
          Text(
            "Make A Reservation",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "After choosing a hotel, Set the date of your check-in and check-out. Make a reservation demand and wait for the hotel's response.",
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
