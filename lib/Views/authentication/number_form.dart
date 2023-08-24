import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/config/consume_services.dart';
import 'package:hotel_booking/config/globals.dart';

import 'Login/login.dart';
import 'SignUp/signup.dart';
import '../controllers/form_colors_controller.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({super.key});
  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  bool busy = false;
  bool numberFound = false;
  bool notSameSession = false;
  final _myController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void dispose() {
    _myController.dispose();
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
      appBar: AppBar(
        elevation: 4,
        shadowColor: globals.appBarShadowColor,
        backgroundColor: globals.appBarbackgroundColor,
        centerTitle: true,
        title: Text(
          "Connect",
          style: globals.appBarTitleStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            color: globals.scaffoldbackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Center(
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
                            width: 26,
                            height: 26,
                          ),
                          Text(
                            "oukini",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.cyan.shade600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Enter Your Phone Number",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "We will send an OTP code to your phone.\n",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FormBuilder(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number :",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            FormBuilderTextField(
                              name: "phone_number",
                              controller: _myController,
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
                              style: Theme.of(context).textTheme.headlineSmall,
                              decoration: const InputDecoration(
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 40),
                        ),
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            if (numberFound) {
                              Get.to(
                                LogInForms(skipOtp: notSameSession),
                                transition: Transition.leftToRightWithFade,
                                arguments: <String, String>{
                                  "phone_number": _myController.text
                                },
                              );
                            } else {
                              Get.to(
                                const SignUpForms(),
                                transition: Transition.leftToRightWithFade,
                                arguments: <String, String>{
                                  "phone_number": _myController.text
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
    );
  }
}
