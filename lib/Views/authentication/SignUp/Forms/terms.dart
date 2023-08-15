import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/utils/style/material_theme.dart';
import 'package:hotel_booking/utils/style/spaces.dart';
import 'package:hotel_booking/utils/style/theme.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../controllers/page_controller.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});
  @override
  State<TermsAndConditions> createState() => TermsAndConditionsState();
}

class TermsAndConditionsState extends State<TermsAndConditions> {
  bool busy = false;
  bool agree = false;
  bool scrolledtoEnd = false;
  String? termsAndConditions;
  @override
  Future<void> initState() async {
    super.initState();
    termsAndConditions = await loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    final FormPageController controller = Get.find();
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        setState(() {
          scrolledtoEnd = true;
        });
      }
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Terms And Conditions",
          style: gTitleTextStyle,
        ),
        gMidVerSpace,
        const Text(
          "Please read the terms and conditions of the app.",
          style: gTextStyle,
        ),
        gMidVerSpace,
        Expanded(
          child: Container(
            padding: gFormPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: gElementHorizantalSmallPadding,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          termsAndConditions != null
                              ? Text(termsAndConditions!)
                              : const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    FormBuilderCheckbox(
                      enabled: scrolledtoEnd,
                      name: "accept",
                      initialValue: agree,
                      onChanged: (value) {
                        setState(
                          () {
                            agree = value ?? false;
                          },
                        );
                      },
                      title: const Text(
                        "I have read and accept terms and conditions",
                        style: gSecondaryTitleTextStyle,
                      ),
                    ),
                    Container(
                      padding: gElementSmallPadding,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: gThemePrimaryColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: borderRadius,
                          ),
                        ),
                        onPressed: agree
                            ? () {
                                controller.nextPage();
                              }
                            : null,
                        child: busy
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Center(
                                child: Text(
                                  "Validate",
                                  style: gButtonTextStyle,
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
    );
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/terms_conditions.txt');
}
