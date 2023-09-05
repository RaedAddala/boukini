import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/config/consume_services.dart';
import 'package:hotel_booking/config/globals.dart';

import 'controllers/firebase_auth.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({super.key});

  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  final _firebaseAuthController = Get.put(AuthController());
  final _myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formBorder = OutlineInputBorder(
    gapPadding: 2.0,
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      width: 1.4,
      color: Color(0xff00b4d8),
    ),
  );
  Country country = Country(
    phoneCode: "216",
    countryCode: "TN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Tunisia",
    example: "Tunisia",
    displayName: "Tunisia",
    displayNameNoCountryCode: "TN",
    e164Key: "",
  );
  @override
  void dispose() {
    _myController.dispose();
    _firebaseAuthController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (!Globals.servicesInitialized) {
      Services.init();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _myController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: _myController.text.length,
      ),
    );
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 18,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.5))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.scaleDown,
                          width: 24.5,
                          height: 24.5,
                        ),
                        Text(
                          "oukini",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: Colors.cyan.shade600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 230,
                  height: 230,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue.shade50,
                  ),
                  child: SvgPicture.asset(
                    "assets/auth/register.svg",
                    height: 185,
                    width: 185,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  "Phone Verification",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.blue.shade400,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                      ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Enter your phone number.\nA verification code will be sent to your phone.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: SizedBox(
                        width: Get.width * 0.85,
                        child: TextFormField(
                          controller: _myController,
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
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          onChanged: (value) {
                            setState(() {
                              _myController.text = value;
                            });
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                          ],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: const Color(0xff0466c8),
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            hintText: "Enter Phone Number",
                            enabledBorder: _formBorder.copyWith(
                              borderSide: const BorderSide(
                                color: Colors.black12,
                              ),
                            ),
                            focusedBorder: _formBorder,
                            errorBorder: _formBorder.copyWith(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  const SizedBox(height: 7),
                                  InkWell(
                                    onTap: () {
                                      showCountryPicker(
                                        context: context,
                                        countryListTheme:
                                            const CountryListThemeData(
                                          bottomSheetHeight: 400,
                                        ),
                                        onSelect: (value) {
                                          setState(() {
                                            country = value;
                                          });
                                        },
                                      );
                                    },
                                    child: Text(
                                      "${country.flagEmoji} + ${country.phoneCode}",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            suffixIcon: (_formKey.currentState != null &&
                                    _formKey.currentState!.validate())
                                ? Container(
                                    height: 15,
                                    width: 15,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5.5,
                                    ),
                                    margin: const EdgeInsets.all(4.5),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.lightGreen,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.done_rounded,
                                        size: 26,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 3.5),
                  child: ElevatedButton(
                    onPressed: () => sendPhoneNumber(),
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                            elevation: const MaterialStatePropertyAll(5),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).primaryColorDark),
                            surfaceTintColor: const MaterialStatePropertyAll(
                                Color(0xffcaf0f8)),
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.lightBlue)),
                    child: const Text(
                      "Validate",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = _myController.text;
    _firebaseAuthController.signWithPhone(
      "+${country.phoneCode}$phoneNumber",
    );
  }
}
