import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/config/routes.dart';
import 'package:pinput/pinput.dart';

import 'controllers/firebase_auth.dart';

class OTPForm extends StatefulWidget {
  final userExists = false;
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  final String verificationId = Get.parameters["verificationId"]!;
  final AuthController _firebaseAuthController = Get.find();
  String otp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 26,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => _firebaseAuthController.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xff00b4d8),
                                ),
                              )
                            : Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(width: 0.5))),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            .copyWith(
                                                color: Colors.cyan.shade600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: 230,
                  height: 230,
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue.shade50,
                  ),
                  child: SvgPicture.asset(
                    "assets/auth/otp.svg",
                    height: 185,
                    width: 185,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Enter the OTP send to your number.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  onCompleted: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  defaultPinTheme: PinTheme(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (otp != "") {
                        verifyOTP(otp);
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          title: "Enter 6-Digit Code",
                        ));
                      }
                    },
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
                      "Verify",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Didn't receive any code ?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    _firebaseAuthController.signWithPhone(
                      Get.parameters["number"]!,
                    );
                  },
                  child: const Text(
                    "Resend A New Code",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.lightBlue,
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

  void verifyOTP(String otp) {
    _firebaseAuthController.verifyOTP(
      verificationId: verificationId,
      userOTP: otp,
      onSuccess: () {
        if (widget.userExists) {
          // Routes to Login
          Get.toNamed(Routes.logIn);
        } else {
          // Routes to Sign up
          Get.toNamed(Routes.signUp);
        }
      },
    );
  }
}
