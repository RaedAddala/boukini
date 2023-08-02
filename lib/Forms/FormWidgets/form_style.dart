import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/style.dart';

const Color formFillColor = Color(0xfffefcfb);
const Color formLabelTextColor = Color(0xff00b4d8);

const double circularBorderValue = 13.0;
const double borderSideWidth = 3;
const TextStyle labelStyle = TextStyle(
  color: gThemePrimaryColor,
  fontSize: 18,
);
const OutlineInputBorder formFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(circularBorderValue),
  ),
  borderSide: BorderSide(
    width: borderSideWidth,
    color: gThemeFormColor,
    strokeAlign: BorderSide.strokeAlignCenter,
  ),
);
const OutlineInputBorder formBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(circularBorderValue),
  ),
  borderSide: BorderSide(
    width: borderSideWidth,
    strokeAlign: BorderSide.strokeAlignCenter,
  ),
);
