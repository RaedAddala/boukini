import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Views/screens/main_screen.dart';
import '../Views/authentication/Login/login.dart';
import '../Views/authentication/SignUp/signup.dart';
import '../Views/authentication/number_form.dart';

import '../screens/onboarding/onboarding.dart';
import '../screens/onboarding/welcome.dart';
import 'globals.dart';

const _transitionDuration = Duration(milliseconds: 200);
const _transitionCurve = Curves.fastOutSlowIn;
const _transitionType = Transition.native;

class Routes {
  static String home = '/';
  static String phoneNumber = '/phoneNumber';
  static String signUp = '/signUp';
  static String logIn = '/logIn';
  static String mainScreen = '/mainScreen';

  static String welcome = '/welcome';
  static String onboarding = '/onboarding';
}

final getPages = [
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
    name: Routes.mainScreen,
    page: () {
      return const MainScreen();
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
