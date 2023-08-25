import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemCard extends StatelessWidget {
  final double height;
  final String picUrl;
  final String name, location;
  final int stars;
  final int id;
  final double price;
  final double rating;
  const ItemCard({
    super.key,
    required this.height,
    required this.picUrl,
    required this.name,
    required this.location,
    required this.stars,
    required this.price,
    required this.rating,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: height,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width * 0.45,
              height: height,
              child: CachedNetworkImage(
                key: UniqueKey(),
                fit: BoxFit.fill,
                imageUrl: picUrl,
                width: Get.width * 0.45,
                height: height,
                filterQuality: FilterQuality.high,
                placeholder: (context, url) => SizedBox(
                  height: height * 0.2,
                  width: height * 0.2,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.black12,
                  child: Icon(
                    Icons.error_outline_outlined,
                    size: height * 0.4,
                    color: Colors.red,
                  ),
                ),
                fadeInCurve: Curves.bounceIn,
                fadeOutCurve: Curves.bounceOut,
                fadeOutDuration: const Duration(milliseconds: 400),
                fadeInDuration: const Duration(milliseconds: 800),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 13.0,
                  left: 13.0,
                  top: 3.0,
                  bottom: 5.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Colors.blue.shade300, size: 16),
                        const SizedBox(width: 1),
                        Expanded(
                          child: Text(
                            location,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: Colors.blue.shade300,
                                  fontSize: 10,
                                ),
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                          price.toStringAsFixed(0),
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
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ]),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          rating.toStringAsFixed(1),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                        ),
                        const SizedBox(width: 2),
                        RatingBarIndicator(
                          rating: rating,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star_rounded,
                            color: Color(0xffffd400),
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: const Color(0xffffd400).withAlpha(65),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
