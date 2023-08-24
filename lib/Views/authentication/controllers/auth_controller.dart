import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void SignWithPhone(String phoneNumber) async {
    try {} on FirebaseAuthException catch (exception) {
      Get.snackbar("Connection Error", exception.message.toString());
    }
  }
}
