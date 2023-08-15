
import 'package:flutter/material.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidthPercentage(BuildContext context, {double percentage = 1.0}) =>
    screenWidth(context) * percentage;
double screenHeightPercentage(BuildContext context,
        {double percentage = 1.0}) =>
    screenHeight(context) * percentage;