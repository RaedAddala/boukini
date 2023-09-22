import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/repository/Accommodations/Model/accommodations.dart';
import 'package:hotel_booking/repository/Accommodations/accomodations_repo.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Details extends StatefulWidget {
  final int id;
  const Details({super.key, required this.id});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  late final Future<AccommodationDetails?> _cardFuture;
  AccommodationDetails? card;
  bool loaded = false;
  @override
  void initState() {
    _cardFuture = AccommodationsRepo.getAccommodationById(widget.id);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cardFuture.then((value) {
        card = value;
        setState(() {
          loaded = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final picHeight = Get.height * 0.43;
    final formHeight = Get.height * 0.615;

    final picWidth = Get.width;
    final loadingDimension = Get.height * 0.1;
    final wholeScreenloadingDimension = Get.height * 0.5;

    final blocStart = Get.height * 0.385;
    final itemStartH = Get.height * 0.04;
    final itemStartW = Get.width * 0.025;

    final spacinginBetween = Get.height * 0.01;
    final cardinfo = card;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        child: (loaded != false)
            ? (cardinfo != null && cardinfo.isBlank! == false)
                ? SizedBox.expand(
                    child: Stack(
                      children: [
                        Container(
                          height: picHeight,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(
                                height: picHeight,
                                width: picWidth,
                                child: CachedNetworkImage(
                                  imageUrl: cardinfo.picture,
                                  filterQuality: FilterQuality.high,
                                  placeholder: (context, url) => SizedBox(
                                    height: loadingDimension,
                                    width: loadingDimension,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3.0,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.black12,
                                    child: Icon(
                                      Icons.error_outline_outlined,
                                      size: picWidth * 0.6,
                                      color: Colors.red,
                                    ),
                                  ),
                                  fadeInCurve: Curves.bounceIn,
                                  fadeOutCurve: Curves.bounceOut,
                                  fadeOutDuration:
                                      const Duration(milliseconds: 250),
                                  fadeInDuration:
                                      const Duration(milliseconds: 500),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: itemStartH,
                                left: itemStartW,
                                right: itemStartW,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colors.grey.shade900
                                            .withOpacity(0.28),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0, horizontal: 4.0),
                                        child: BackButton(
                                          color: Colors.white,
                                          onPressed: () => Get.back(),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colors.grey.shade900
                                            .withOpacity(0.28),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(14.0),
                                        child: Icon(
                                          Icons.bookmark_outline,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: blocStart,
                          child: Container(
                            height: formHeight,
                            width: Get.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              color: Color(0xfffafafa),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          cardinfo.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      SizedBox(height: 0.4 * spacinginBetween),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Text(
                                          "${cardinfo.category} ${cardinfo.stars.toString()} Stars ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      SizedBox(height: 0.6 * spacinginBetween),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.location_on_outlined,
                                              color: Colors.blue.shade300,
                                              size: 20),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              cardinfo.location,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                    color: Colors.blue.shade200,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            cardinfo.rating.toStringAsFixed(1),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                          ),
                                          const SizedBox(width: 3.5),
                                          RatingBarIndicator(
                                            rating: cardinfo.rating,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star_rounded,
                                              color: Color(0xffffd400),
                                            ),
                                            itemCount: 5,
                                            itemSize: 20.0,
                                            unratedColor:
                                                const Color(0xffffd400)
                                                    .withAlpha(65),
                                          ),
                                          const SizedBox(width: 3.5),
                                          Text(
                                            "( ${cardinfo.nbOfReviews} reviews )",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                    color:
                                                        Colors.grey.shade500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: spacinginBetween),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              cardinfo.description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 10,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 1.5 * spacinginBetween),
                                      Divider(
                                        color: Colors.grey.shade300,
                                        thickness: 0.75,
                                      ),
                                      SizedBox(height: spacinginBetween),
                                      Text(
                                        "Detail Properties",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0,
                                    ),
                                    child: GridView.count(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1 / 0.22,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.restaurant_rounded,
                                              size: 14,
                                            ),
                                            const SizedBox(width: 2),
                                            Text(
                                              "Restaurant",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.spa_rounded,
                                              size: 14,
                                            ),
                                            const SizedBox(width: 2),
                                            Text(
                                              "Spa",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.pool_outlined,
                                              size: 14,
                                            ),
                                            const SizedBox(width: 2),
                                            Text(
                                              "Swimming Pool",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.beach_access,
                                              size: 14,
                                            ),
                                            const SizedBox(width: 2),
                                            Text(
                                              "Near the beach",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.grey.shade100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${cardinfo.price.toStringAsFixed(0)} DT",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                const Text("night"),
                                              ],
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                Theme.of(context)
                                                    .primaryColorDark,
                                              ),
                                            ),
                                            onPressed: () => Get.defaultDialog(
                                              title: '',
                                              radius: 30,
                                              content:
                                                  Content(formKey: formKey),
                                            ),
                                            child: Text(
                                              "Reserve Now",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: wholeScreenloadingDimension,
                      width: wholeScreenloadingDimension,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.white,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 24,
                          ),
                          SizedBox(height: 25),
                          Center(
                            child: Text(
                              "404 NOT FOUND",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            : Center(
                child: Container(
                  alignment: Alignment.center,
                  height: wholeScreenloadingDimension,
                  width: wholeScreenloadingDimension,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: const CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}

class Content extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;

  const Content({super.key, required this.formKey});

  @override
  State<Content> createState() => _StateContent();
}

class _StateContent extends State<Content> {
  final _datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = widget.formKey;
  
    return Container(
      padding: const EdgeInsets.all(10),
      height: Get.height * 0.5,
      width: Get.width * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilder(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Dates",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 5),
                SfDateRangePicker(
                  view: DateRangePickerView.month,
                  monthViewSettings:
                      const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                  selectionMode: DateRangePickerSelectionMode.range,
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                    
                    DateFormat.yMd('fr_FR').format(
                        dateRangePickerSelectionChangedArgs.value.startDate);
                  },
                ),

                // FormBuilderDateRangePicker(
                //   name: "Credit Card Number",
                //   controller: _datecontroller,
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   keyboardType: TextInputType.datetime,
                //   initialEntryMode: DatePickerEntryMode.calendarOnly,
                //   format: DateFormat.yMd('fr_FR'),
                //   style: Theme.of(context).textTheme.labelMedium,
                //   decoration: InputDecoration(
                //     isDense: true,
                //     contentPadding: const EdgeInsets.symmetric(
                //         horizontal: 10, vertical: 10),
                //     errorMaxLines: 1,
                //     errorStyle: const TextStyle(
                //       fontSize: 0,
                //     ),
                //     filled: true,
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: Theme.of(context).primaryColorLight,
                //           width: 2.0,
                //           strokeAlign: BorderSide.strokeAlignInside),
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(100.0)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //           color: Theme.of(context).primaryColorDark,
                //           width: 3.0,
                //           strokeAlign: BorderSide.strokeAlignInside),
                //       borderRadius:
                //           const BorderRadius.all(Radius.circular(100.0)),
                //     ),
                //     border: const OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(100.0)),
                //     ),
                //     prefixIcon: const Icon(
                //       Icons.edit_calendar_rounded,
                //     ),
                //   ),
                //   firstDate: DateTime.now(),
                //   lastDate: DateTime(DateTime.now().year + 2),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//openContainer
///SizeTransition