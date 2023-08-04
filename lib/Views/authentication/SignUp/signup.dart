import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../utils/spaces.dart';
import '../../../utils/theme.dart';
import '../controllers/page_controller.dart';
import '../otp_verification.dart';
import 'Forms/credentials.dart';
import 'Forms/password.dart';
import 'Forms/terms.dart';

class SignUpForms extends StatefulWidget {
  const SignUpForms({super.key});
  @override
  State<SignUpForms> createState() => _SignUpFormsState();
}

class _SignUpFormsState extends State<SignUpForms> {
  @override
  void dispose() {
    pagecontroller.dispose();
    Get.delete<FormPageController>();
    super.dispose();
  }

  static const int _numberOfWidgets = 4;
  static const int _initialPage = 0;

  final FormPageController controller =
      Get.put(FormPageController(_numberOfWidgets, _initialPage));
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
      onWillPop: () {
        controller.prevPage();
        return Future<bool>.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: gWholePagePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gSmallVerSpace,
                Padding(
                  padding: gElementHorizantalSmallPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: gTopScreenTextSize * 1.4,
                        onPressed: () {
                          controller.prevPage();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: gThemeOnSecondaryTextColor,
                        ),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                      const Padding(
                        padding: gElementHorizantalHugePadding,
                        child: Text(
                          "Sign Up",
                          style: gTopScreenTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: gFormPadding,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pagecontroller,
                      children: <Widget>[
                        OTPverificationForm(
                          formKey: otpformKey,
                          phoneNumber: Get.arguments["phone_number"],
                        ),
                        CredentialForm(
                          formKey: credentialsformkey,
                        ),
                        PasswordForm(formKey: passwordformkey),
                        TermsAndConditions(formKey: passwordformkey),
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
