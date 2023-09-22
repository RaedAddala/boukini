import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/screens/mainscreens/details.dart';
import 'package:pinput/pinput.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

import 'package:hotel_booking/config/routes.dart';
import 'package:hotel_booking/repository/Accommodations/Model/accommodations.dart';
import 'package:hotel_booking/utils/style/screen.dart';

import 'utils/style.dart';
import 'widgets/card.dart';

class SeeAll extends StatefulWidget {
  final List<Accommodations> accommodations;
  final String title;
  final double height, width;
  final int category;
  const SeeAll({
    super.key,
    required this.accommodations,
    required this.title,
    required this.height,
    required this.width,
    required this.category,
  });

  @override
  State<SeeAll> createState() => _StateSeeAll();
}

class _StateSeeAll extends State<SeeAll> {
  final ScrollController _scrollController = ScrollController();
  static const double itemCardHeight = 125;

  List<Accommodations> hotels = [];
  List<Accommodations> villas = [];
  List<Accommodations> accommodations = [];
  List<List<Accommodations>> all = [];

  int category = 0;

  @override
  void initState() {
    category = widget.category;
    accommodations = widget.accommodations;
    for (var item in accommodations) {
      if (item.category == "Hotel") {
        hotels.add(item);
      } else {
        villas.add(item);
      }
    }
    all.add(accommodations);
    all.add(hotels);
    all.add(villas);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(all[category].length);
    // print(all[category]);
    // print(accommodations);
    // print(hotels);
    // print(villas);

    const buttonColor = Color(0xffccff33);
    const overlayColor = Color(0xffc0ff70);
    const surfaceTintColor = Color(0xfff0f9fa);

    final txtStyle = Theme.of(context).textTheme.labelSmall;
    final activeTxtStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 21,
        );
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
          controller: _scrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ScrollToHide(
                    scrollController: _scrollController,
                    height: 70,
                    child: Padding(
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
                                  style: (category == 0)
                                      ? activeTxtStyle
                                      : txtStyle,
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
                                  style: (category == 1)
                                      ? activeTxtStyle
                                      : txtStyle,
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
                                child: Text("Villa",
                                    style: (category == 2)
                                        ? activeTxtStyle
                                        : txtStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 1,
                          childAspectRatio: 1 / 0.35,
                        ),
                        itemCount: 1 + all[category].length,
                        itemBuilder: itemBuilder,
                      ),
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

  Widget? itemBuilder(BuildContext context, int index) =>
      (index < all[category].length)
          ? GestureDetector(
              onTap: () => Get.to(
                Details(id: all[category][index].id),
                transition: transitionType,
                duration: transitionDuration,
                curve: transitionCurve,
              ),
              child: ItemCard(
                height: itemCardHeight,
                picUrl: all[category][index].picture,
                location: all[category][index].location,
                name: all[category][index].name,
                stars: all[category][index].stars,
                id: all[category][index].id,
                price: all[category][index].price,
                rating: all[category][index].rating,
              ),
            )
          : Container();
  // : const Padding(
  //     padding: EdgeInsets.symmetric(vertical: 32),
  //     child: Center(
  //       child: CircularProgressIndicator(),
  //     ),
  // );
}
