import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/config/routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signWithPhone(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(minutes: 2),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) => throw Exception(error.message),
        codeSent: (verificationId, forceResendingToken) {
          Get.snackbar("Verfication Code", verificationId);
          if (Get.currentRoute == Routes.otp) {
            Get.parameters["number"] = phoneNumber;
            Get.parameters["verificationId"] = verificationId;
          } else {
            Get.toNamed(
              Routes.otp,
              parameters: {
                "verificationId": verificationId,
                "number": phoneNumber,
              },
            );
          }
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (exception) {
      Get.snackbar("Connection Error", exception.message.toString());
    }
  }
}
