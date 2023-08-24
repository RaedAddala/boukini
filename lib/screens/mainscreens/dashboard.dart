import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/repository/Accommodations/Model/accommodations.dart';
import 'package:hotel_booking/repository/Accommodations/accomodations_repo.dart';
import 'package:hotel_booking/screens/mainscreens/widgets/shimmer.dart';
import 'package:hotel_booking/utils/style/material_theme.dart';
import 'package:intl/intl.dart';

import 'see_all.dart';
import 'utils/style.dart';
import 'widgets/item_card.dart';
import 'package:hotel_booking/repository/Places/places_repository.dart';
import 'package:hotel_booking/utils/style/screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool notification = true;
  int _categorieIndex = 0;
  final formKey = GlobalKey<FormBuilderState>();
  final _checkinController = TextEditingController();
  final _checkoutController = TextEditingController();

  final _pageviewController = PageController(
    viewportFraction: 0.75,
    initialPage: 0,
  );
  final _cardsFuture = AccommodationsRepo.getAllAccommodations();
  late List<Accommodations> cards;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cardsFuture.then((value) {
        cards = value;
        setState(
          () {
            isLoaded = true;
          },
        );
      });
    });
  }

  @override
  void dispose() {
    _checkinController.dispose();
    _checkoutController.dispose();
    _pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context).textTheme.labelSmall;
    final activeTxtStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.bold);

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.blue[500]),
                                  child: Icon(
                                    Icons.history,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
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
                            onTap: () async {
                              if (!isLoaded) {
                                cards = await _cardsFuture;
                                setState(() {
                                  isLoaded = true;
                                });
                              }
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
                            children: isLoaded
                                ? cards
                                    .where((element) {
                                      if (_categorieIndex == 0) {
                                        return true;
                                      } else if (_categorieIndex == 1) {
                                        return element.category == 'Hotel';
                                      } else {
                                        return element.category == 'Villa';
                                      }
                                    })
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 3,
                                        ),
                                        child: SizedBox(
                                          height: 202,
                                          width: Get.width * 0.55,
                                          child: Item(
                                              //key: const ObjectKey(),
                                              width: Get.width * 0.55,
                                              height: 202,
                                              price: e.price,
                                              rating: e.rating,
                                              name: e.name,
                                              location: e.location,
                                              picturePath: e.picture,
                                              stars: e.stars),
                                        ),
                                      ),
                                    )
                                    .toList()
                                    .sublist(0, min(4, cards.length))
                                : List.generate(
                                    4,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      child: SizedBox(
                                        height: 202,
                                        width: Get.width * 0.55,
                                        child: ShimmerItem(
                                          height: 202,
                                          width: Get.width * 0.55,
                                        ),
                                      ),
                                    ),
                                  ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                          borderRadius: borderCircularRadius,
                                        ),
                                      ),
                                      surfaceTintColor:
                                          MaterialStatePropertyAll(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .background),
                                      backgroundColor: MaterialStatePropertyAll(
                                          (_categorieIndex == 0)
                                              ? redish
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
                                          borderRadius: borderCircularRadius,
                                        ),
                                      ),
                                      surfaceTintColor:
                                          MaterialStatePropertyAll(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .background),
                                      backgroundColor: MaterialStatePropertyAll(
                                          (_categorieIndex == 1)
                                              ? redish
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
                                          borderRadius: borderCircularRadius,
                                        ),
                                      ),
                                      surfaceTintColor:
                                          MaterialStatePropertyAll(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .background),
                                      backgroundColor: MaterialStatePropertyAll(
                                          (_categorieIndex == 2)
                                              ? redish
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
                          const SizedBox(
                            height: 3,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: Text(
                                  "Location :",
                                  style: Theme.of(context).textTheme.bodySmall,
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
                                      var places =
                                          await PlaceRepository.getSuggestions(
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
                                    contentPadding: const EdgeInsets.symmetric(
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
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.datetime,
                                      initialDatePickerMode: DatePickerMode.day,
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
                                                horizontal: 10, vertical: 10),
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
                                          Icons.edit_calendar_rounded,
                                        ),
                                      ),
                                      validator: (DateTime? input) {
                                        bool? v = _checkoutController.isBlank;
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.datetime,
                                      initialDatePickerMode: DatePickerMode.day,
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
                                                horizontal: 10, vertical: 10),
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
                                          Icons.edit_calendar_rounded,
                                        ),
                                      ),
                                      validator: (DateTime? input) {
                                        bool? v = _checkinController.isBlank;
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
                      style:
                          Theme.of(context).elevatedButtonTheme.style!.copyWith(
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
                                    const MaterialStatePropertyAll(redish),
                              ),
                      onPressed: () {},
                      child: Text(
                        "Search",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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
    );
  }
}
