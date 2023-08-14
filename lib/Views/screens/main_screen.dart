import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hotel_booking/utils/screen.dart';

import '../controllers/form_colors_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  bool notification = true;
  int _categorieIndex = 0;
  static const yellowish = Color(0xfff0ff50);

  @override
  Widget build(BuildContext context) {
    const double iconActiveSize = 28;
    const double iconInactiveSize = 20;
    GlobalFormThemeVarController globals = Get.put(
        GlobalFormThemeVarController(
          appBarShadowColor: Theme.of(context).shadowColor,
          appBarTitleStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          appBarElementsColor: Theme.of(context).colorScheme.onPrimary,
          appBarbackgroundColor: Theme.of(context).colorScheme.primary,
          scaffoldbackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        permanent: true);
    return Scaffold(
      backgroundColor: globals.scaffoldbackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                /* 
              * Header contains : 
              *  - The Username
              *  - His Balance
              *
               */
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 18.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello,Raed!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Your Balance is : ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                      ),
                                      Text(
                                        '4 000 DT',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Colors.blue[500]),
                                    child: Icon(
                                      notification
                                          ? Icons.notifications_active
                                          : Icons.notifications,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Colors.blue[500]),
                                    child: Icon(
                                      Icons.history,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                /* In a single container we have :
              // Choosing Category
              // Location Input
              // Check in/out dates
              // Search button
              */
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                /*
              Presenting two rows first for top rated
              second for popular ones 
               */
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 88,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        screenWidthPercentage(context, percentage: 0.12)),
                child: Container(
                    height: 250,
                    width: screenWidthPercentage(context, percentage: 0.76),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade800.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Categories
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (_categorieIndex != 0) {
                                    setState(() {
                                      _categorieIndex = 0;
                                    });
                                  }
                                },
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style!
                                    .copyWith(
                                      backgroundColor: MaterialStatePropertyAll(
                                          (_categorieIndex == 0)
                                              ? yellowish
                                              : Colors.white),
                                    ),
                                child: const Text("All"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_categorieIndex != 1) {
                                    setState(() {
                                      _categorieIndex = 1;
                                    });
                                  }
                                },
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style!
                                    .copyWith(
                                      backgroundColor: MaterialStatePropertyAll(
                                          (_categorieIndex == 1)
                                              ? yellowish
                                              : Colors.white),
                                    ),
                                child: const Text("Hotel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_categorieIndex != 2) {
                                    setState(() {
                                      _categorieIndex = 2;
                                    });
                                  }
                                },
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style!
                                    .copyWith(
                                      backgroundColor: MaterialStatePropertyAll(
                                          (_categorieIndex == 2)
                                              ? yellowish
                                              : Colors.white),
                                    ),
                                child: const Text("Villa"),
                              ),
                            ],
                          ),
                        ),
                        // Location
                        const Row(),

                        // Check in & Check out
                        const Row(),

                        // Search Button
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: 30.0, right: 30.0, top: 2.0, bottom: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(35),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 10,
                blurRadius: 10,
                color: Colors.black.withOpacity(.12),
              )
            ],
          ),
          child: SafeArea(
            child: GNav(
              onTabChange: (index) {
                setState(() {
                  _index = index;
                });
              },
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[900]!,
              activeColor: Colors.black,
              color: Theme.of(context).textTheme.bodySmall!.color,
              tabBorderRadius: 80,
              gap: 8,
              curve: Curves.easeInCirc,
              duration: const Duration(milliseconds: 600),
              tabBackgroundColor: yellowish.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              tabs: [
                GButton(
                  icon: (_index == 0) ? Icons.home : Icons.home_outlined,
                  iconSize: (_index == 0) ? iconActiveSize : iconInactiveSize,
                  text: "Home",
                ),
                GButton(
                  icon: (_index == 1) ? Icons.list_sharp : Icons.list_outlined,
                  iconSize: (_index == 1) ? iconActiveSize : iconInactiveSize,
                  text: "Catalogue",
                ),
                GButton(
                  icon: (_index == 2)
                      ? Icons.bookmark_outlined
                      : Icons.bookmark_outline,
                  iconSize: (_index == 2) ? iconActiveSize : iconInactiveSize,
                  text: "Bookmarked",
                ),
                GButton(
                  icon:
                      (_index == 3) ? Icons.person_2 : Icons.person_2_outlined,
                  iconSize: (_index == 3) ? iconActiveSize : iconInactiveSize,
                  text: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
