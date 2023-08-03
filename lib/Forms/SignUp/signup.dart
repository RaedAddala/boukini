import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/Forms/FirstForm/otp.dart';
import 'package:hotel_booking/Forms/SignUp/Forms/credentials.dart';
import 'package:hotel_booking/Forms/SignUp/Forms/set_password.dart';
import 'package:hotel_booking/Forms/SignUp/signup_controller.dart';

import '../../utils/style.dart';

class SignUpForms extends StatefulWidget {
  const SignUpForms({super.key});
  @override
  State<SignUpForms> createState() => _SignUpFormsState();
}

class _SignUpFormsState extends State<SignUpForms> {
  @override
  void dispose() {
    pagecontroller.dispose();
    Get.delete<SignUpPageController>();
    super.dispose();
  }

  static const int _numberOfWidgets = 3;
  final SignUpPageController controller =
      Get.put(SignUpPageController(_numberOfWidgets));
  late final pagecontroller = controller.pagecontroller;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> otpformKey =
        GlobalKey<FormBuilderState>();
    final GlobalKey<FormBuilderState> credentialsformkey =
        GlobalKey<FormBuilderState>();
    final GlobalKey<FormBuilderState> passwordformkey =
        GlobalKey<FormBuilderState>();
    return WillPopScope(
      onWillPop: () => controller.prevPage(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              padding: gWholePagePadding,
              width: screenWidth(context),
              height: screenHeight(context),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pagecontroller,
                onPageChanged: (pagecontroller) {
                  // The go back button and the default return of the device
                  // must be modified
                },
                children: <Widget>[
                  /* ALL The Forms will be here */
                  OTPForm(formKey: otpformKey),
                  CredentialsForm(formKey: credentialsformkey),
                  PasswordForm(formKey: passwordformkey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
