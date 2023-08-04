import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/route_manager.dart';
import 'package:hotel_booking/Views/authentication/Login/login.dart';
import 'package:hotel_booking/utils/spaces.dart';

import '../../utils/theme.dart';
import 'SignUp/signup.dart';
import 'styles/form_style.dart';

class PhoneNumberForm extends StatefulWidget {
  final formKey = GlobalKey<FormBuilderState>();
  PhoneNumberForm({super.key});
  @override
  State<PhoneNumberForm> createState() => PhoneNumberFormState();
}

class PhoneNumberFormState extends State<PhoneNumberForm> {
  PhoneNumberFormState();
  bool busy = false;
  bool numberFound = false;
  bool notSameSession = false;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = widget.formKey;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: gWholePagePadding,
            child: Padding(
              padding: gElementHugePadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gHugeVerSpace,
                  const Text(
                    "Enter Your Phone Number",
                    style: gTitleTextStyle,
                  ),
                  gMidVerSpace,
                  const Text(
                    "We will send an OTP code to your phone",
                    style: gTextStyle,
                  ),
                  gHugeVerSpace,
                  Container(
                    padding: gFormPadding,
                    child: Column(
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
                                    "Phone Number :",
                                    style: gSecondaryTitleTextStyle,
                                  ),
                                ),
                                gMidVerSpace,
                                FormBuilderTextField(
                                  name: "phone_number",
                                  controller: myController,
                                  onTapOutside: (event) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(8),
                                  ],
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: formFillColor,
                                    border: formBorder,
                                    focusedBorder: formFocusedBorder,
                                    prefixIcon: Icon(
                                      Icons.phone_outlined,
                                      color: gThemePrimaryColor,
                                    ),
                                    labelStyle: labelStyle,
                                  ),
                                  validator: FormBuilderValidators.compose(
                                    [
                                      FormBuilderValidators.required(
                                        errorText: "Field can't be empty",
                                      ),
                                      FormBuilderValidators.equalLength(
                                        8,
                                        errorText: 'Must be 8 digits',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        gMidVerSpace,
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
                                if (numberFound) {
                                  Get.to(
                                    LogInForms(skipOtp: notSameSession),
                                    transition: Transition.leftToRightWithFade,
                                    arguments: <String, String>{
                                      "phone_number": myController.text
                                    },
                                  );
                                } else {
                                  Get.to(
                                    const SignUpForms(),
                                    transition: Transition.leftToRightWithFade,
                                    arguments: <String, String>{
                                      "phone_number": myController.text
                                    },
                                  );
                                }
                              }
                            },
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
