import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Views/screens/see_all.dart';
import 'package:hotel_booking/repository/Places/places_repository.dart';
import 'package:intl/intl.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hotel_booking/utils/style/material_theme.dart';

import 'package:hotel_booking/utils/style/screen.dart';

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

  static const cards = <Map<String, dynamic>>[
    {
      "price": 220.0,
      "rating": 4.5,
      "name": "Djerba Resort",
      "location": "Zone Touristique, Djerba",
      "picturePath": "assets/images/resort.jpg",
    },
    {
      "price": 520.0,
      "rating": 4.8,
      "name": "Laicos",
      "location": "Mohamed V, Tunis",
      "picturePath": "assets/images/laico.jpg",
    },
    {
      "price": 592.0,
      "rating": 5.0,
      "name": "Marriott",
      "location": "Centre Urbain Nord, Djerba",
      "picturePath": "assets/images/marriott.png",
    },
  ];

  static const yellowish = Color(0xffbdfd58);
  final formKey = GlobalKey<FormBuilderState>();
  final _checkinController = TextEditingController();
  final _checkoutController = TextEditingController();

  final _pageviewController = PageController(
    viewportFraction: 0.75,
    initialPage: 0,
  );

  final borderCircularRadius = BorderRadius.circular(20);

  @override
  void dispose() {
    _checkinController.dispose();
    _checkoutController.dispose();
    _pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double iconActiveSize = 26;
    const double iconInactiveSize = 18;
    final txtStyle = Theme.of(context).textTheme.labelSmall;
    final activeTxtStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.bold);

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* 
              * Header contains : 
              *  - The Username
              *  - His Balance
              *
               */
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 14.0),
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
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.blue[500],
                                      ),
                                      child: Icon(
                                        notification
                                            ? Icons.notifications_active
                                            : Icons.notifications,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.blue[500]),
                                      child: Icon(
                                        Icons.history,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Popular",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(SeeAll(
                                      hotels: cards,
                                      title: "Popular",
                                      height: 400.0,
                                      width: Get.width * 0.3));
                                },
                                child: Text(
                                  "see All",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.blue.shade200),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 202,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                controller: _pageviewController,
                                physics: const BouncingScrollPhysics(
                                  decelerationRate: ScrollDecelerationRate.fast,
                                ),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                children: cards
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 3,
                                          ),
                                          child: SizedBox(
                                            height: 202,
                                            width: Get.width * 0.55,
                                            child: Item(
                                                width: Get.width * 0.55,
                                                height: 202,
                                                price: e["price"],
                                                rating: e["rating"],
                                                name: e["name"],
                                                location: e["location"],
                                                picturePath: e["picturePath"]),
                                          ),
                                        ))
                                    .toList()
                                    .sublist(0, min(3, cards.length)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 68,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidthPercentage(context, percentage: 0.11),
                ),
                child: Container(
                  width: screenWidthPercentage(context, percentage: 0.78),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 12.0,
                    ),
                    child: Column(
                      children: [
                        FormBuilder(
                          key: formKey,
                          child: Column(
                            children: [
                              // Categories
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  borderCircularRadius,
                                            ),
                                          ),
                                          surfaceTintColor:
                                              MaterialStatePropertyAll(
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .background),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  (_categorieIndex == 0)
                                                      ? yellowish
                                                      : Colors.white),
                                        ),
                                    child: Text(
                                      "All",
                                      style: (_categorieIndex == 0)
                                          ? activeTxtStyle
                                          : txtStyle,
                                    ),
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
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  borderCircularRadius,
                                            ),
                                          ),
                                          surfaceTintColor:
                                              MaterialStatePropertyAll(
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .background),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  (_categorieIndex == 1)
                                                      ? yellowish
                                                      : Colors.white),
                                        ),
                                    child: Text(
                                      "Hotel",
                                      style: (_categorieIndex == 1)
                                          ? activeTxtStyle
                                          : txtStyle,
                                    ),
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
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  borderCircularRadius,
                                            ),
                                          ),
                                          surfaceTintColor:
                                              MaterialStatePropertyAll(
                                                  Theme.of(context)
                                                      .colorScheme
                                                      .background),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  (_categorieIndex == 2)
                                                      ? yellowish
                                                      : Colors.white),
                                        ),
                                    child: Text(
                                      "Villa",
                                      style: (_categorieIndex == 2)
                                          ? activeTxtStyle
                                          : txtStyle,
                                    ),
                                  ),
                                ],
                              ),
                              // Location
                              // We can make use of the Google Map API for
                              // search autocomplete but it is not free
                              //
                              const SizedBox(
                                height: 3,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0),
                                    child: Text(
                                      "Location :",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  FormBuilderTypeAhead<String>(
                                      name: "location",
                                      itemBuilder: (context, location) {
                                        return ListTile(title: Text(location));
                                      },
                                      suggestionsCallback: (pattern) async {
                                        if (pattern.isNotEmpty &&
                                            pattern.length > 4) {
                                          var places = await PlaceRepository
                                              .getSuggestions(
                                            pattern,
                                          );
                                          return places.map((e) {
                                            StringBuffer buf = StringBuffer();
                                            if (e.name != null) {
                                              buf.write(e.name);
                                            }
                                            if (e.district != null) {
                                              if (buf.isNotEmpty) {
                                                buf.write(" , ");
                                              }
                                              buf.write(e.district);
                                            }
                                            if (e.city != null) {
                                              if (buf.isNotEmpty) {
                                                buf.write(" , ");
                                              }
                                              buf.write(e.city);
                                            }
                                            if (e.state != null) {
                                              if (buf.isNotEmpty) {
                                                buf.write(" , ");
                                              }
                                              buf.write(e.state);
                                            }
                                            buf.write(" , ");
                                            buf.write(e.country);
                                            return buf.toString();
                                          }).toList();
                                        }
                                        return <String>[];
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                        errorMaxLines: 1,
                                        filled: true,
                                        fillColor: formFillColor,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                              width: 2.0,
                                              strokeAlign:
                                                  BorderSide.strokeAlignInside),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100.0)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              width: 3.0,
                                              strokeAlign:
                                                  BorderSide.strokeAlignInside),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100.0)),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.0)),
                                        ),
                                        prefixIcon: const Icon(
                                          Icons.location_on_outlined,
                                        ),
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.minLength(4,
                                            allowEmpty: true,
                                            errorText:
                                                "Autocomplete available after entering 4 characters"),
                                      ])),
                                ],
                              ),
                              // Check in & Check out
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Text(
                                            "Check-in",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        FormBuilderDateTimePicker(
                                          name: "checkin",
                                          controller: _checkinController,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          keyboardType: TextInputType.datetime,
                                          initialDatePickerMode:
                                              DatePickerMode.day,
                                          initialEntryMode:
                                              DatePickerEntryMode.calendarOnly,
                                          inputType: InputType.date,
                                          format: DateFormat.yMd('fr_FR'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            errorMaxLines: 1,
                                            errorStyle: const TextStyle(
                                              fontSize: 0,
                                            ),
                                            filled: true,
                                            fillColor: formFillColor,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  width: 2.0,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignInside),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100.0)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColorDark,
                                                  width: 3.0,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignInside),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100.0)),
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0)),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.edit_calendar_rounded,
                                            ),
                                          ),
                                          validator: (DateTime? input) {
                                            bool? v =
                                                _checkoutController.isBlank;
                                            String f = (v != null && !v)
                                                ? _checkoutController.text
                                                : "";

                                            if (input != null &&
                                                f != "" &&
                                                DateFormat.yMd('fr_FR')
                                                    .parse(f)
                                                    .isBefore(input)) {
                                              return "Check-in must be before Check-out";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Text(
                                            "Check-out",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        FormBuilderDateTimePicker(
                                          name: "checkout",
                                          controller: _checkoutController,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          keyboardType: TextInputType.datetime,
                                          initialDatePickerMode:
                                              DatePickerMode.day,
                                          initialEntryMode:
                                              DatePickerEntryMode.calendarOnly,
                                          inputType: InputType.date,
                                          format: DateFormat.yMd('fr_FR'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            errorMaxLines: 1,
                                            errorStyle: const TextStyle(
                                              fontSize: 0,
                                            ),
                                            filled: true,
                                            fillColor: formFillColor,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  width: 2.0,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignInside),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100.0)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColorDark,
                                                  width: 3.0,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignInside),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(100.0)),
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100.0)),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.edit_calendar_rounded,
                                            ),
                                          ),
                                          validator: (DateTime? input) {
                                            bool? v =
                                                _checkinController.isBlank;
                                            String f = (v != null && !v)
                                                ? _checkinController.text
                                                : "";

                                            if (input != null &&
                                                f != "" &&
                                                DateFormat.yMd('fr_FR')
                                                    .parse(f)
                                                    .isAfter(input)) {
                                              return "Check-in must be before Check-out";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Search Button
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        ElevatedButton(
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
                                surfaceTintColor: MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.background),
                                minimumSize: const MaterialStatePropertyAll(
                                    Size(double.infinity, 34)),
                                maximumSize: const MaterialStatePropertyAll(
                                    Size(double.infinity, 34)),
                                backgroundColor:
                                    const MaterialStatePropertyAll(yellowish),
                              ),
                          onPressed: () {},
                          child: Text(
                            "Search",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
              tabBackgroundColor: yellowish.withOpacity(0.5),
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

class Item extends StatelessWidget {
  final double price;
  final double rating;
  final String name;
  final String location;
  final String picturePath;

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
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    picturePath,
                    filterQuality: FilterQuality.high,
                    isAntiAlias: true,
                  ),
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
                      child: Text(name,
                          style: Theme.of(context).textTheme.titleMedium),
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
