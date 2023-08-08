import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'dart:math';

const double circularBorderValue = 25;

const BorderRadius borderRadius = BorderRadius.all(
  Radius.circular(circularBorderValue),
);

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.compact,
    primarySwatch: materialColor,
    typography: Typography.material2021(),
    brightness: Brightness.light,
    // fontFamily: 'Nunito',
    // textTheme: const TextTheme(
    //   bodySmall: TextStyle(
    //     color: Colors.white,
    //   ),
    //   bodyMedium: TextStyle(
    //     color: Colors.white,
    //   ),
    // ),
    textTheme: GoogleFonts.montserratTextTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: materialColor,
    brightness: Brightness.dark,
    // fontFamily: 'Nunito',
    appBarTheme: const AppBarTheme(),
    // textTheme: const TextTheme(
    //   bodySmall: TextStyle(
    //     color: Colors.grey,
    //   ),
    //   bodyMedium: TextStyle(
    //     color: Colors.white,
    //   ),
    //   bodyLarge: TextStyle(
    //     color: Colors.white,
    //   ),
    // ),
    textTheme: GoogleFonts.montserratTextTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
  );
}
// Gives a purple theme for some reason

// const MaterialColor materialColor = MaterialColor(
//   0xff00b4d8,
//   <int, Color>{
//     50: Color(0xff80ffdb),
//     100: Color(0xff72efdd),
//     200: Color(0xff64dfdf),
//     300: Color(0xff56cfe1),
//     400: Color(0xff48cae4),
//     500: Color(0xff00b4d8),
//     600: Color(0xff0096c7),
//     700: Color(0xff0077b6),
//     800: Color(0xff023e8a),
//     900: Color(0xff03045e),
//   },
// );

// Gives a purple theme

const MaterialColor materialColor = MaterialColor(
  0xff4c9bf5,
  <int, Color>{
    50: Color(0xff9fccfa),
    100: Color(0xff8ec2f9),
    200: Color(0xff7eb8f8),
    300: Color(0xff6daff7),
    400: Color(0xff5ca5f6),
    500: Color(0xff4c9bf5),
    600: Color(0xff3b91f4),
    700: Color(0xff2a88f3),
    800: Color(0xff1a7ef2),
    900: Color(0xff0974f1),
  },
);

// const MaterialColor materialColor = MaterialColor(
//   0xff4893c6,
//   <int, Color>{
//     50: Color(0xffe2eff6),
//     100: Color(0xffb7d7ea),
//     200: Color(0xff8dbedc),
//     300: Color(0xff83c9f4),
//     400: Color(0xff64a4ce),
//     500: Color(0xff4893c6),
//     600: Color(0xff2d82bd),
//     700: Color(0xff2476b1),
//     800: Color(0xff1965a0),
//     900: Color(0xff0f558f),
//   },
// );

// final MaterialColor materialColor =
//     generateMaterialColor(const Color(0xff00a8e8));
// MaterialColor generateMaterialColor(Color color) {
//   return MaterialColor(color.value, {
//     50: tintColor(color, 0.9),
//     100: tintColor(color, 0.8),
//     200: tintColor(color, 0.6),
//     300: tintColor(color, 0.4),
//     400: tintColor(color, 0.2),
//     500: color,
//     600: shadeColor(color, 0.1),
//     700: shadeColor(color, 0.2),
//     800: shadeColor(color, 0.3),
//     900: shadeColor(color, 0.4),
//   });
// }

// int tintValue(int value, double factor) =>
//     max(0, min((value + ((255 - value) * factor)).round(), 255));

// Color tintColor(Color color, double factor) => Color.fromRGBO(
//     tintValue(color.red, factor),
//     tintValue(color.green, factor),
//     tintValue(color.blue, factor),
//     1);

// int shadeValue(int value, double factor) =>
//     max(0, min(value - (value * factor).round(), 255));

// Color shadeColor(Color color, double factor) => Color.fromRGBO(
//     shadeValue(color.red, factor),
//     shadeValue(color.green, factor),
//     shadeValue(color.blue, factor),
//     1);
