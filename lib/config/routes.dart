import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Views/screens/main_screen.dart';
import '../Views/authentication/Login/login.dart';
import '../Views/authentication/SignUp/signup.dart';
import '../Views/authentication/number_form.dart';

class Routes {
  static String home = '/';
  static String phoneNumber = '/phoneNumber';
  static String signUp = '/signUp';
  static String logIn = '/logIn';
  static String mainScreen = '/mainScreen';
}

final getPages = [
  GetPage(
    name: Routes.mainScreen,
    page: () {
      return const MainScreen();
    },
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn,
  ),
  GetPage(
    name: Routes.home,
    page: () {
      return const Text("Welcome");
    },
    middlewares: [
      RouteGuard(),
    ],
  ),
  GetPage(
    name: Routes.phoneNumber,
    page: () {
      return const PhoneNumberForm();
    },
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn,
  ),
  GetPage(
    name: Routes.signUp,
    page: () {
      return const SignUpForms();
    },
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn,
  ),
  GetPage(
    name: Routes.logIn,
    page: () {
      return const LogInForms(
        skipOtp: false,
      );
    },
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn,
  ),
];

/* This will be managed in the future */
dynamic userToken;

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return userToken == null ? RouteSettings(name: Routes.phoneNumber) : null;
  }
}
