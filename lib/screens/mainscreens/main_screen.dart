import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hotel_booking/screens/mainscreens/dashboard.dart';
import 'package:hotel_booking/screens/mainscreens/utils/style.dart';

class MainScreen extends StatefulWidget {
  final int index;
  const MainScreen({super.key, required this.index});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  @override
  void initState() {
    _index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double iconActiveSize = 26;
    const double iconInactiveSize = 18;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        child: Dashboard(),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0, bottom: 9),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.grey.shade300.withOpacity(.5),
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
              tabBorderRadius: 120,
              tabMargin: const EdgeInsets.all(0),
              gap: 5,
              curve: Curves.easeInCirc,
              duration: const Duration(milliseconds: 600),
              tabBackgroundColor: redish.withOpacity(0.65),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
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
