import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/env/env.dart';
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
  static const yellowish = Color(0xffbdfd58);
  final formKey = GlobalKey<FormBuilderState>();
  final _checkinController = TextEditingController();
  final _checkoutController = TextEditingController();

  final borderCircularRadius = BorderRadius.circular(20);

  @override
  void dispose() {
    _checkinController.dispose();
    _checkoutController.dispose();
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
        maintainBottomViewPadding: true,
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
                          vertical: 10.0, horizontal: 14.0),
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
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 62,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidthPercentage(context, percentage: 0.11),
                ),
                child: Container(
                  width: screenWidthPercentage(context, percentage: 0.78),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
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
                                          shadowColor: MaterialStatePropertyAll(
                                              Theme.of(context).shadowColor),
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
                                          shadowColor: MaterialStatePropertyAll(
                                              Theme.of(context).shadowColor),
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
                                          shadowColor: MaterialStatePropertyAll(
                                              Theme.of(context).shadowColor),
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
                                height: 5,
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
                                              .client
                                              .getSuggestions(
                                                  pattern, Env.geoApifyKey);
                                          return places.map((e) {
                                            StringBuffer buf = StringBuffer();
                                            if (e.name != null)
                                              buf.write(e.name);
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
                                          });
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
                                height: 7,
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
                                shadowColor: MaterialStatePropertyAll(
                                    Theme.of(context).shadowColor),
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
                          height: 3,
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
