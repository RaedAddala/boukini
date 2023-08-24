import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/screens/authentication/otp.dart';

import '../Views/authentication/Login/login.dart';
import '../Views/authentication/SignUp/signup.dart';

import '../screens/authentication/phone_number.dart';
import '../screens/mainscreens/main_screen.dart';
import '../screens/onboarding/onboarding.dart';
import '../screens/onboarding/welcome.dart';

import 'globals.dart';

const _transitionDuration = Duration(milliseconds: 200);
const _transitionCurve = Curves.fastOutSlowIn;
const _transitionType = Transition.native;

class Routes {
  static String signUp = '/signUp';
  static String logIn = '/logIn';
  static String dashboard = '/dashboard';

  static String welcome = '/welcome';
  static String onboarding = '/onboarding';
  static String phoneNumber = '/phoneNumber';
  static String otp = '/otp';
}

final getPages = [
  GetPage(
    name: Routes.otp,
    page: () {
      return const OTPForm();
    },
    transition: _transitionType,
    transitionDuration: _transitionDuration,
    curve: _transitionCurve,
  ),
  GetPage(
    name: Routes.onboarding,
    page: () {
      return Onboarding();
    },
    transition: _transitionType,
    transitionDuration: _transitionDuration,
    curve: _transitionCurve,
  ),
  GetPage(
    name: Routes.welcome,
    page: () {
      return const Welcome();
    },
    transition: _transitionType,
    transitionDuration: _transitionDuration,
    curve: _transitionCurve,
  ),
  GetPage(
    name: Routes.dashboard,
    page: () {
      return const MainScreen(index: 0);
    },
    transition: _transitionType,
    transitionDuration: _transitionDuration,
    curve: _transitionCurve,
    middlewares: [
      RouteGuard(),
    ],
  ),
  GetPage(
    name: Routes.phoneNumber,
    page: () {
      return const PhoneNumberForm();
    },
    transition: _transitionType,
    transitionDuration: _transitionDuration,
    curve: _transitionCurve,
  ),
  GetPage(
    name: Routes.signUp,
    page: () {
      return const SignUpForms();
    },
    transition: _transitionType,
    transitionDuration: _transitionDuration,
    curve: _transitionCurve,
  ),
  GetPage(
    name: Routes.logIn,
    page: () {
      return const LogInForms(
        skipOtp: false,
      );
    },
    transition: _transitionType,
    transitionDuration: _transitionDuration,
    curve: _transitionCurve,
  ),
];

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return Globals.connected ? RouteSettings(name: Routes.phoneNumber) : null;
  }
}
