import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Views/controllers/form_colors_controller.dart';
import 'package:hotel_booking/config/routes.dart';

class SeeAll extends StatelessWidget {
  final List<Map<String, dynamic>> hotels;
  final String title;
  final double height, width;
  const SeeAll(
      {super.key,
      required this.hotels,
      required this.title,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    GlobalFormThemeVarController globals = Get.find();
    return WillPopScope(
      onWillPop: () {
        Get.offNamed(Routes.mainScreen);
        return Future<bool>.value(false);
      },
      child: Scaffold(
        backgroundColor: globals.scaffoldbackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 4,
          shadowColor: globals.appBarShadowColor,
          backgroundColor: globals.appBarbackgroundColor,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: BackButton(
              color: globals.appBarElementsColor,
              onPressed: () {
                Get.offNamed(Routes.mainScreen);
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            title,
            style: globals.appBarTitleStyle,
          ),
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              SizedBox(
                height: Get.height - 95,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemCount: hotels.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          dense: true,
                          title: Text(
                            hotels[index]["name"],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.blue.shade300,
                                  ),
                                  const SizedBox(width: 2),
                                  Expanded(
                                    child: Text(
                                      hotels[index]["location"],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            color: Colors.blue.shade300,
                                          ),
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
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
                                    hotels[index]["price"].toStringAsFixed(3),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "night",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                          ]),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                            ],
                          ),
                          isThreeLine: true,
                          leading: Container(
                            width: width,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                hotels[index]["picturePath"],
                                filterQuality: FilterQuality.high,
                                isAntiAlias: true,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
