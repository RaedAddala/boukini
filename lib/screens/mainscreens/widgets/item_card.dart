import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final double price;
  final double rating;
  final String name;
  final String location;
  final String picturePath;
  final int stars;
  final double height;
  final double width;

  const Item({
    super.key,
    required this.price,
    required this.rating,
    required this.name,
    required this.location,
    required this.picturePath,
    required this.height,
    required this.width,
    required this.stars,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(23),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 5,
            color: Colors.grey.shade200.withOpacity(.6),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: height * 0.55,
                width: width,
                child: CachedNetworkImage(
                  imageUrl: picturePath,
                  filterQuality: FilterQuality.high,
                  placeholder: (context, url) => SizedBox(
                    height: height * 0.21,
                    width: height * 0.21,
                    child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 3.0)),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black12,
                    child: Icon(
                      Icons.error_outline_outlined,
                      size: width * 0.4,
                      color: Colors.red,
                    ),
                  ),
                  fadeInCurve: Curves.bounceIn,
                  fadeOutCurve: Curves.bounceOut,
                  fadeOutDuration: const Duration(milliseconds: 350),
                  fadeInDuration: const Duration(milliseconds: 700),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 6,
                right: 8,
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.grey.shade900.withOpacity(0.28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber.shade200.withOpacity(0.9),
                        ),
                        const SizedBox(width: 1.5),
                        Text(
                          rating.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Container(
            height: height * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 4.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.grey.shade900.withOpacity(0.05),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.bookmark_outline,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: Colors.blue.shade300, size: 15),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        location,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.blue.shade300, fontSize: 10),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Price:",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      price.toStringAsFixed(3),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "/",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "night",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
