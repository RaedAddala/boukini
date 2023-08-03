import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/route_manager.dart';
import 'package:hotel_booking/Forms/SignUp/signup.dart';
import 'package:hotel_booking/utils/spaces.dart';
import 'package:hotel_booking/utils/style.dart';

import '../FormStyles/form_style.dart';

class PhoneNumberForm extends StatefulWidget {
  final formKey = GlobalKey<FormBuilderState>();
  PhoneNumberForm({super.key});
  @override
  State<PhoneNumberForm> createState() => PhoneNumberFormState();
}

class PhoneNumberFormState extends State<PhoneNumberForm> {
  PhoneNumberFormState();
  bool busy = false;
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
                    "Enter Your Phone Number☎️",
                    style: gTitleTextStyle,
                  ),
                  gMidVerSpace,
                  const Text(
                    "We will send an OTP code to your number",
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
                            child: FormBuilderTextField(
                              name: "phone_number",
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
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
                                label: Text("Phone Number"),
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
                          ),
                        ),
                        gMidVerSpace,
                        Container(
                          padding: gFormPadding,
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
                                Get.to(
                                  const SignUpForms(),
                                  transition: Transition.leftToRightWithFade,
                                );
                              }
                            },
                            child: busy
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Center(
                                    child: Text(
                                      "Send OTP",
                                      style: gButtonTextStyle,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
