/*
  This is the First Widget that would get Loaded which will decide
  Based on whether the user is connected or not
  on which page it will redirect to


  If Connected  => Dashboard
  If not Connected => EnterNumber Page
  
 */

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../config/routes.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  final bool _connected = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!_connected) {
          Get.toNamed(Routes.signUp);
        } else {
          // go directly to dashboard
        }
      },
      child: const Text("Click Me"),
    );
  }
}
