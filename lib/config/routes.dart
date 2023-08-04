import 'package:get/route_manager.dart';
import 'package:hotel_booking/Views/first.dart';

import '../Views/authentication/Login/login.dart';
import '../Views/authentication/SignUp/signup.dart';
import '../Views/authentication/number_form.dart';


class Routes {
  static String first = '/';
  static String phoneNumber = '/phoneNumber';
  static String signUp = '/signUp';
  static String logIn = '/logIn';
}

final getPages = [
  GetPage(
    name: Routes.phoneNumber,
    page: () {
      return PhoneNumberForm();
    },
  ),
  GetPage(
    name: Routes.signUp,
    page: () {
      return const SignUpForms();
    },
  ),
  GetPage(
    name: Routes.first,
    page: () {
      return const FirstPage();
    },
  ),
  GetPage(
    name: Routes.logIn,
    page: () {
      return const LogInForms();
    },
  ),
];
