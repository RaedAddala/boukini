import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

const Color formFillColor = Color(0xfffefcfb);
const Color formLabelTextColor = Color(0xff00b4d8);

const double circularBorderValue = 20;
const double borderSideWidth = 3.4;
const BorderRadius borderRadius = BorderRadius.all(
  Radius.circular(circularBorderValue),
);

const TextStyle labelStyle = TextStyle(
  color: gThemePrimaryColor,
  fontSize: 20,
);
const OutlineInputBorder formFocusedBorder = OutlineInputBorder(
  borderRadius: borderRadius,
  borderSide: BorderSide(
    width: borderSideWidth,
    color: gThemeFormColor,
    strokeAlign: BorderSide.strokeAlignCenter,
  ),
);
const OutlineInputBorder formBorder = OutlineInputBorder(
  borderRadius: borderRadius,
  borderSide: BorderSide(
    width: borderSideWidth,
    strokeAlign: BorderSide.strokeAlignCenter,
  ),
);
