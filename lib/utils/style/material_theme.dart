import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'dart:math';

const double circularBorderValue = 18;
const double borderSideWidth = 1.2;
const formFillColor = Color(0xfff8f8f5);

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
  static final _shadowColor =
      MaterialStatePropertyAll(Colors.grey.shade500.withOpacity(0.5));
  static const _elevation = MaterialStatePropertyAll<double>(2.2);
  static const _colorSchemeSeed = Color(0xff0850B9);
  static final _txtTheme =
      GoogleFonts.alegreyaTextTheme().merge(GoogleFonts.comfortaaTextTheme());
  static final _buttonTheme = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      const RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
  );
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      elevation: _elevation,
      shadowColor: _shadowColor,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorSchemeSeed: _colorSchemeSeed,
    typography: Typography.material2021(),
    brightness: Brightness.light,
    textTheme: _txtTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    filledButtonTheme: FilledButtonThemeData(style: _buttonTheme),
    textButtonTheme: TextButtonThemeData(style: _buttonTheme),
    outlinedButtonTheme: OutlinedButtonThemeData(style: _buttonTheme),
    segmentedButtonTheme: SegmentedButtonThemeData(style: _buttonTheme),
  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    colorSchemeSeed: _colorSchemeSeed, // const Color(0xff00b4d8),
    typography: Typography.material2021(colorScheme: const ColorScheme.dark()),
    brightness: Brightness.dark,
    textTheme: _txtTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    filledButtonTheme: FilledButtonThemeData(style: _buttonTheme),
    textButtonTheme: TextButtonThemeData(style: _buttonTheme),
    outlinedButtonTheme: OutlinedButtonThemeData(style: _buttonTheme),
    segmentedButtonTheme: SegmentedButtonThemeData(style: _buttonTheme),
  );
}
