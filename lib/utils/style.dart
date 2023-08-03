import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/values.dart';

const EdgeInsetsGeometry gVerticalWholePagePadding =
    EdgeInsets.symmetric(vertical: gPagePadding);
const EdgeInsetsGeometry gHorizantalWholePagePadding =
    EdgeInsets.symmetric(horizontal: gPagePadding);
const EdgeInsetsGeometry gWholePagePadding = EdgeInsets.all(gPagePadding);

const EdgeInsetsGeometry gElementHugePadding =
    EdgeInsets.all(gelementHugePadding);
const EdgeInsetsGeometry gElementVerticalHugePadding =
    EdgeInsets.symmetric(vertical: gelementHugePadding);
const EdgeInsetsGeometry gElementHorizantalHugePadding =
    EdgeInsets.symmetric(horizontal: gelementHugePadding);

const EdgeInsetsGeometry gElementSmallPadding =
    EdgeInsets.all(gelementSmallPadding);
const EdgeInsetsGeometry gElementVerticalSmallPadding =
    EdgeInsets.symmetric(vertical: gelementSmallPadding);
const EdgeInsetsGeometry gElementHorizantalSmallPadding =
    EdgeInsets.symmetric(horizontal: gelementSmallPadding);

const EdgeInsetsGeometry gFormPadding =
    EdgeInsets.symmetric(vertical: 12.0, horizontal: 9.0);
/* 
  Theme Colors used:
*/

// Buttons Color:
const Color gThemeFormColor = Color(0xff0096c7);
const Color gThemePrimaryColor = Color(0xff0077b6);

// Background Color
const Color gThemeSecondartyColor = Color(0xfff8f7ff);
// Text on buttons
const Color gThemeOnPrimaryTextColor = Colors.white;
// Text everywhere else buttons except for small text
const Color gThemeOnSecondaryTextColor = Colors.black87;

const Color gBodyTextColor = Color(0xff868686);
const double gBodyTextSize = 12;

const TextStyle gBodyTextStyle = TextStyle(
  color: gBodyTextColor,
  fontSize: gBodyTextSize,
  fontWeight: FontWeight.w200,
);

const double gTitleTextSize = 26;

const TextStyle gTitleTextStyle = TextStyle(
  color: gThemeOnSecondaryTextColor,
  fontSize: gTitleTextSize,
  fontWeight: FontWeight.w900,
);

const double gSecondaryTitleTextSize = 18;

const TextStyle gSecondaryTitleTextStyle = TextStyle(
  color: gThemeOnSecondaryTextColor,
  fontSize: gSecondaryTitleTextSize,
  fontWeight: FontWeight.w500,
);

const double gButtonTextSize = 18;

const TextStyle gButtonTextStyle = TextStyle(
  color: gThemeOnPrimaryTextColor,
  fontSize: gButtonTextSize,
  fontWeight: FontWeight.w500,
);
const double gTextSize = 16;

const TextStyle gTextStyle = TextStyle(
  color: gThemeOnSecondaryTextColor,
  fontSize: gTextSize,
  fontWeight: FontWeight.w300,
);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidthPercentage(BuildContext context, {double percentage = 1.0}) =>
    screenWidth(context) * percentage;
double screenHeightPercentage(BuildContext context,
        {double percentage = 1.0}) =>
    screenHeight(context) * percentage;
