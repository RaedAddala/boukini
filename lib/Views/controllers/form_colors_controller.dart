import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalFormThemeVarController extends GetxController {
  final Color appBarShadowColor;
  final Color appBarbackgroundColor;
  final TextStyle appBarTitleStyle;
  final Color scaffoldbackgroundColor;
  final Color appBarElementsColor;

  GlobalFormThemeVarController({
    required this.appBarShadowColor,
    required this.appBarbackgroundColor,
    required this.appBarTitleStyle,
    required this.scaffoldbackgroundColor,
    required this.appBarElementsColor,
  });
}
