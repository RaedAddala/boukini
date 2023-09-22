import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/config/routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  var _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  String? _uid;
  String? get uid => _uid;

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

  void verifyOTP({
    required String verificationId,
    required String userOTP,
    required Function onSuccess,
  }) async {
    _isLoading.value = true;
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOTP);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;
      if (user != null) {
        _uid = user.uid;
        onSuccess();
      } else {
        _isLoading.value = false;
      }
    } on FirebaseAuthException catch (exception) {
      Get.snackbar("Connection Error", exception.message.toString());
      _isLoading.value = true;
    }
  }

  Future<bool> checkExistingUser(String? uid) async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("user").doc(uid ?? _uid).get();
    if (snapshot.exists) {
      return true;
    } else {
      return false;
    }
  }
}
