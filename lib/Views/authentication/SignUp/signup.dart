import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/utils/style/screen.dart';

import '../controllers/page_controller.dart';
import 'Forms/credentials.dart';
import 'Forms/password.dart';
import 'Forms/terms.dart';

class SignUpForms extends StatefulWidget {
  const SignUpForms({super.key});
  @override
  State<SignUpForms> createState() => _SignUpFormsState();
}

class _SignUpFormsState extends State<SignUpForms> {
  late final PageController pagecontroller;
  static const int _numberOfWidgets = 3;

  final FormPageController controller =
      Get.put(FormPageController(_numberOfWidgets));
  @override
  void initState() {
    super.initState();
    pagecontroller = controller.pagecontroller;
  }

  @override
  void dispose() {
    pagecontroller.dispose();
    Get.delete<FormPageController>();
    super.dispose();
  }

  final GlobalKey<FormBuilderState> _credentialsformkey =
      GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _passwordformkey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.prevPage();
        return Future<bool>.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          shadowColor: Theme.of(context).shadowColor,
          backgroundColor: Theme.of(context).primaryColorDark,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: BackButton(
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                controller.prevPage();
              },
            ),
          ),
          title: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Sign Up",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Theme.of(context).scaffoldBackgroundColor,
              constraints: BoxConstraints(maxHeight: screenHeight(context)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Boukini",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pagecontroller,
                      children: <Widget>[
                        CredentialForm(
                          formKey: _credentialsformkey,
                        ),
                        PasswordForm(formKey: _passwordformkey),
                        const TermsAndConditions(),
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

// child: Padding(
//             padding: gWholePagePadding,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 gSmallVerSpace,
//                 Padding(
//                   padding: gElementHorizantalSmallPadding,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         iconSize: gTopScreenTextSize * 1.4,
//                         onPressed: () {
//                           controller.prevPage();
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back,
//                           color: gThemeOnSecondaryTextColor,
//                         ),
//                         padding: EdgeInsets.zero,
//                         alignment: Alignment.centerLeft,
//                       ),
//                       const Padding(
//                         padding: gElementHorizantalHugePadding,
//                         child: Text(
//                           "Sign Up",
//                           style: gTopScreenTextStyle,
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: gFormPadding,
//                     child: PageView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       controller: pagecontroller,
//                       children: <Widget>[
//                         OTPverificationForm(
//                           formKey: _otpformKey,
//                           phoneNumber: Get.arguments["phone_number"],
//                         ),
//                         CredentialForm(
//                           formKey: _credentialsformkey,
//                         ),
//                         PasswordForm(formKey: _passwordformkey),
//                         const TermsAndConditions(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
        
