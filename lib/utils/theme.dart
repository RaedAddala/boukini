/* 
  Theme Colors used:
*/
// Form Color
import 'package:flutter/material.dart';

const Color gThemeFormColor = Color(0xff0096c7);

// Buttons Color:
const Color gThemePrimaryColor = Color(0xff0077b6);

// Background Color
const Color gThemeSecondartyColor = Color(0xfff8f7ff);
// Text on buttons
const Color gThemeOnPrimaryTextColor = Colors.white;
// Text everywhere else buttons except for small text
const Color gThemeOnSecondaryTextColor = Colors.black87;

const Color gBodyTextColor = Color(0xff868686);

/* 
  Theme Text Styles used:
*/

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
const double gTopScreenTextSize = 22;

const TextStyle gTopScreenTextStyle = TextStyle(
  color: gThemeOnSecondaryTextColor,
  fontSize: gTopScreenTextSize,
  fontWeight: FontWeight.w700,
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

const double gTextSize = 14;

const TextStyle gTextStyle = TextStyle(
  color: gThemeOnSecondaryTextColor,
  fontSize: gTextSize,
  fontWeight: FontWeight.w300,
);
