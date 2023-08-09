import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Views/authentication/controllers/page_controller.dart';
import 'package:hotel_booking/utils/spaces.dart';
import 'package:hotel_booking/utils/theme.dart';
import '../../../../utils/material_theme.dart';

import '../../controllers/input_formatters.dart';

class CredentialForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  const CredentialForm({
    super.key,
    required this.formKey,
  });
  @override
  State<CredentialForm> createState() => CredentialFormState();
}

class CredentialFormState extends State<CredentialForm> {
  bool busy = false;
  @override
  Widget build(BuildContext context) {
    const requiredMessage = "Field can't be empty";
    final formKey = widget.formKey;
    final FormPageController controller = Get.find();
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Credentials",
            style: gTitleTextStyle,
          ),
          gMidVerSpace,
          const Text(
            "Insert your needed personal information here",
            style: gTextStyle,
          ),
          gMidVerSpace,
          Container(
            padding: gFormPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilder(
                  key: formKey,
                  child: Padding(
                    padding: gElementHorizantalSmallPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: gElementHorizantalHugePadding,
                          child: Text(
                            "Credit Card :",
                            style: gSecondaryTitleTextStyle,
                          ),
                        ),
                        gSmallVerSpace,
                        FormBuilderTextField(
                          name: "Credit Card Number",
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberInputFormatter(),
                          ],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                errorText: requiredMessage,
                              ),
                              FormBuilderValidators.equalLength(
                                19,
                                errorText: "Must contain 16 digits",
                              ),
                              // FormBuilderValidators.creditCard(
                              //   errorText: 'Enter a valid credit card number',
                              // ),
                            ],
                          ),
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: formFillColor,
                            border: formBorder,
                            focusedBorder: formFocusedBorder,
                            prefixIcon: const Icon(
                              Icons.credit_card_outlined,
                              color: gThemePrimaryColor,
                            ),
                          ),
                        ),
                        gHugeVerSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: gElementHorizantalHugePadding,
                                    child: Text(
                                      "CIN :",
                                      style: gSecondaryTitleTextStyle,
                                    ),
                                  ),
                                  gSmallVerSpace,
                                  FormBuilderTextField(
                                    name: "CIN",
                                    keyboardType: TextInputType.number,
                                    onTapOutside: (event) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(8),
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: formFillColor,
                                      border: formBorder,
                                      focusedBorder: formFocusedBorder,
                                      prefixIcon: const Icon(
                                        Icons.perm_identity_outlined,
                                        color: gThemePrimaryColor,
                                      ),
                                    ),
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(
                                          errorText: requiredMessage,
                                        ),
                                        (String? val) {
                                          if (val != null &&
                                              val.isNotEmpty &&
                                              val[0] != '0' &&
                                              val[0] != '1') {
                                            return "CIN must start with a 0 or 1";
                                          }
                                          return null;
                                        },
                                        FormBuilderValidators.equalLength(
                                          8,
                                          errorText: "Must contain 8 digits",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            gBigHorSpace,
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: gElementHorizantalHugePadding,
                                    child: Text(
                                      "Expiry :",
                                      style: gSecondaryTitleTextStyle,
                                    ),
                                  ),
                                  gSmallVerSpace,
                                  FormBuilderTextField(
                                    name: "expires",
                                    keyboardType: TextInputType.number,
                                    onTapOutside: (event) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                      CardMonthFilteringText(),
                                      CardMonthInputFormatter(),
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: formFillColor,
                                      border: formBorder,
                                      focusedBorder: formFocusedBorder,
                                      prefixIcon: const Icon(
                                        Icons.calendar_month_outlined,
                                        color: gThemePrimaryColor,
                                      ),
                                      hintText: "MM/YY",
                                      hintStyle: gBodyTextStyle,
                                    ),
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(
                                          errorText: requiredMessage,
                                        ),
                                        (String? val) {
                                          if (val != null && val.length < 5) {
                                            return "Fill this field";
                                          }
                                          return null;
                                        }
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        gHugeVerSpace,
                      ],
                    ),
                  ),
                ),
                gBigVerSpace,
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
                    onPressed: () {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        controller.nextPage();
                      }
                    },
                    child: busy
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : const Center(
                            child: Text(
                              "Validate",
                              style: gButtonTextStyle,
                            ),
                          ),
                  ),
                ),
                gHugeVerSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
