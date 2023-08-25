import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerItem({
    super.key,
    required this.height,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        height: height,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.grey.shade300.withOpacity(.46),
            )
          ],
        ),
      ),
    );
  }
}
