import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/utils/screen.dart';

import 'Login/login.dart';
import 'SignUp/signup.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Theme.of(context).shadowColor,
        backgroundColor: (ThemeMode.system == ThemeMode.light)
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).primaryColorDark,
        centerTitle: true,
        title: Text(
          "Connect",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            color: Theme.of(context).scaffoldBackgroundColor,
            height: screenHeightPercentage(context, percentage: 0.9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Enter Your Phone Number",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "We will send an OTP code to your phone.\n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
                              height: 8,
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
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
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
                                  style: TextStyle(fontSize: 26),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.scaleDown,
                          width: 60,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Boukini",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
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
}
