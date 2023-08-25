import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/config/routes.dart';
import 'package:hotel_booking/repository/Accommodations/Model/accommodations.dart';
import 'package:hotel_booking/utils/style/screen.dart';

import 'utils/style.dart';
import 'widgets/card.dart';

class SeeAll extends StatefulWidget {
  final List<Accommodations> hotels;
  final String title;
  final double height, width;
  final int category;
  const SeeAll({
    super.key,
    required this.hotels,
    required this.title,
    required this.height,
    required this.width,
    required this.category,
  });

  @override
  State<SeeAll> createState() => _StateSeeAll();
}

class _StateSeeAll extends State<SeeAll> {
  int category = 0;
  @override
  void initState() {
    category = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const buttonColor = Color(0xffccff33);
    const overlayColor = Color(0xffc0ff70);
    const surfaceTintColor = Color(0xfff0f9fa);

    final txtStyle = Theme.of(context).textTheme.labelSmall;
    final activeTxtStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 21,
        );
    const double itemCardHeight = 125;
    return WillPopScope(
      onWillPop: () {
        Get.offNamed(Routes.dashboard);
        return Future<bool>.value(false);
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              elevation: 3,
              shadowColor: Theme.of(context).shadowColor,
              backgroundColor: Theme.of(context).colorScheme.primary,
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: BackButton(
                  color: Theme.of(context).colorScheme.onPrimary,
                  onPressed: () {
                    Get.offNamed(Routes.dashboard);
                  },
                ),
              ),
              centerTitle: true,
              title: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
          body: SafeArea(
            top: false,
            maintainBottomViewPadding: true,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 3),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal:
                          screenWidthPercentage(context, percentage: 0.09),
                    ),
                    child: Container(
                      width: screenWidthPercentage(context, percentage: 0.82),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, -2),
                          ),
                          BoxShadow(
                            color: Colors.grey.shade200.withOpacity(0.6),
                            spreadRadius: 2,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 13,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (category != 0) {
                                  setState(() {
                                    category = 0;
                                  });
                                }
                              },
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: borderCircularRadius,
                                      ),
                                    ),
                                    elevation: MaterialStatePropertyAll(
                                        (category == 0) ? 4 : 2),
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            overlayColor),
                                    surfaceTintColor:
                                        const MaterialStatePropertyAll(
                                            surfaceTintColor),
                                    backgroundColor: MaterialStatePropertyAll(
                                        (category == 0)
                                            ? buttonColor
                                            : Colors.white),
                                  ),
                              child: Text(
                                "All",
                                style:
                                    (category == 0) ? activeTxtStyle : txtStyle,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (category != 1) {
                                  setState(() {
                                    category = 1;
                                  });
                                }
                              },
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: borderCircularRadius,
                                      ),
                                    ),
                                    elevation: MaterialStatePropertyAll(
                                        (category == 1) ? 4 : 2),
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            overlayColor),
                                    surfaceTintColor:
                                        const MaterialStatePropertyAll(
                                            surfaceTintColor),
                                    backgroundColor: MaterialStatePropertyAll(
                                        (category == 1)
                                            ? buttonColor
                                            : Colors.white),
                                  ),
                              child: Text(
                                "Hotel",
                                style:
                                    (category == 1) ? activeTxtStyle : txtStyle,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (category != 2) {
                                  setState(() {
                                    category = 2;
                                  });
                                }
                              },
                              style: Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: borderCircularRadius,
                                      ),
                                    ),
                                    elevation: MaterialStatePropertyAll(
                                        (category == 2) ? 4 : 2),
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            overlayColor),
                                    surfaceTintColor:
                                        const MaterialStatePropertyAll(
                                            surfaceTintColor),
                                    backgroundColor: MaterialStatePropertyAll(
                                        (category == 2)
                                            ? buttonColor
                                            : Colors.white),
                                  ),
                              child: Text(
                                "Villa",
                                style:
                                    (category == 2) ? activeTxtStyle : txtStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.hotels
                          .where((element) {
                            if (category == 0) {
                              return true;
                            } else if (category == 1) {
                              return element.category == 'Hotel';
                            } else {
                              return element.category == 'Villa';
                            }
                          })
                          .map((e) => ItemCard(
                                height: itemCardHeight,
                                picUrl: e.picture,
                                location: e.location,
                                name: e.name,
                                stars: e.stars,
                                id: e.id,
                                price: e.price,
                                rating: e.rating,
                              ))
                          .toList(),
                    ),
                  ),
                  //Pagination
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
  What Needs to be done here :
  - Pagination
  - Shimmer Effect
  - Caching pictures
  - 
 */


//  SizedBox(
//                 height: Get.height - 95,
//                 child: ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   itemCount: widget.hotels.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4),
//                       child: ListTile(
//                         dense: true,
//                         title: Text(
//                           widget.hotels[index].name,
//                           style: Theme.of(context).textTheme.titleLarge,
//                         ),
//                         subtitle: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.location_on_outlined,
//                                   color: Colors.blue.shade300,
//                                 ),
//                                 const SizedBox(width: 2),
//                                 Expanded(
//                                   child: Text(
//                                     widget.hotels[index].location,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelMedium!
//                                         .copyWith(
//                                           color: Colors.blue.shade300,
//                                         ),
//                                     softWrap: true,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 3),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 const SizedBox(
//                                   width: 3,
//                                 ),
//                                 Text(
//                                   "Price:",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelMedium!
//                                       .copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(
//                                   width: 3,
//                                 ),
//                                 Text(
//                                   widget.hotels[index].price.toStringAsFixed(3),
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelLarge!
//                                       .copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Text(
//                                       "/",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelLarge,
//                                     ),
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "night",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .labelSmall,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 3),
//                           ],
//                         ),
//                         isThreeLine: true,
//                         leading: Container(
//                           width: widget.width,
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           decoration: const BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(5),
//                             ),
//                           ),
//                           child: FittedBox(
//                             fit: BoxFit.fill,
//                             child: Image.asset(
//                               widget.hotels[index].picture,
//                               filterQuality: FilterQuality.high,
//                               isAntiAlias: true,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
            