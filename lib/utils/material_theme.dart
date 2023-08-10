import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'dart:math';

const double circularBorderValue = 12;
const double borderSideWidth = 1;
const formFillColor = Color(0xff0496ff);
final OutlineInputBorder formFocusedBorder = OutlineInputBorder(
  borderRadius: borderRadius,
  borderSide: BorderSide(
    width: borderSideWidth,
    color: AppTheme.lightTheme.colorScheme.secondary,
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

const BorderRadius borderRadius = BorderRadius.all(
  Radius.circular(circularBorderValue),
);

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xff0496ff),
    typography: Typography.material2021(),
    brightness: Brightness.light,
    textTheme:
        GoogleFonts.comfortaaTextTheme().merge(GoogleFonts.alegreyaTextTheme()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xff00b4d8),
    typography: Typography.material2021(colorScheme: const ColorScheme.dark()),
    brightness: Brightness.dark,
    textTheme:
        GoogleFonts.comfortaaTextTheme().merge(GoogleFonts.alegreyaTextTheme()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    ),
  );
}

// const MaterialColor _materialColor = MaterialColor(
//   0xff4c9bf5,
//   <int, Color>{
//     50: Color(0xff9fccfa),
//     100: Color(0xff8ec2f9),
//     200: Color(0xff7eb8f8),
//     300: Color(0xff6daff7),
//     400: Color(0xff5ca5f6),
//     500: Color(0xff4c9bf5),
//     600: Color(0xff3b91f4),
//     700: Color(0xff2a88f3),
//     800: Color(0xff1a7ef2),
//     900: Color(0xff0974f1),
//   },
// );
