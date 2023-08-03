import 'package:get/route_manager.dart';

import 'Forms/FirstForm/enter_number.dart';
import 'Forms/SignUp/signup.dart';

class Routes {
  static String phoneNumber = '/phoneNumber';
  static String signUp = '/signUp';
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
];
