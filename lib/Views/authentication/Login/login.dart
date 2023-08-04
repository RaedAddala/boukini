import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../utils/screen.dart';
import '../../../utils/spaces.dart';
import '../../../utils/theme.dart';
import '../controllers/page_controller.dart';
import '../otp_verification.dart';
import 'Forms/enter_pass.dart';

class LogInForms extends StatefulWidget {
  const LogInForms({super.key});
  @override
  State<LogInForms> createState() => _LogInFormsState();
}

class _LogInFormsState extends State<LogInForms> {
  @override
  void dispose() {
    pagecontroller.dispose();
    Get.delete<FormPageController>();
    super.dispose();
  }

  static const int _numberOfWidgets = 2;
  final FormPageController controller =
      Get.put(FormPageController(_numberOfWidgets));
  late final pagecontroller = controller.pagecontroller;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> otpformKey =
        GlobalKey<FormBuilderState>();
    final GlobalKey<FormBuilderState> verifyPasswordFormKey =
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        iconSize: gTitleTextSize * 1.4,
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
                      const Expanded(
                        child: Padding(
                          padding: gElementHorizantalHugePadding,
                          child: Text(
                            "Credentials",
                            style: gTitleTextStyle,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                  gHugeVerSpace,
                  PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pagecontroller,
                    onPageChanged: (pagecontroller) {
                      // The go back button and the default return of the device
                      // must be modified
                    },
                    children: <Widget>[
                      /* ALL The Forms will be here */
                      OTPverificationForm(formKey: otpformKey),
                      VerifyPasswordForm(formKey: verifyPasswordFormKey),
                    ],
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
