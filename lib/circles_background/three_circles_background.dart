import 'dart:math';

import 'package:flutter/material.dart';
import 'circles_background.dart';

enum GradientColor {
  red,
  blue,
  custom,
}

class ThreeCirclesBackground extends CirclesBackground {
  final List<List<Color>>? customColors;

  ThreeCirclesBackground({Key? key,
    required Size sizeOfScreen,
    GradientColor gradientColor = GradientColor.blue,
    Widget? child,
    this.customColors,
  })  : assert(gradientColor == GradientColor.blue ||
            gradientColor == GradientColor.red ||
            (gradientColor == GradientColor.custom && customColors != null && customColors.length == 3)),
        super(key: key,
          circles:
              sampleData(sizeOfScreen, getColor(gradientColor, customColors)),
          child: child,
        );

  static List<List<Color>> sampleRedColors = [
    [Colors.red[600]!, Colors.red[400]!],
    [Colors.red[600]!, Colors.red[400]!],
    [Colors.red[600]!, Colors.red[400]!],
  ];

  static List<List<Color>> sampleBlueColors = [
    [Colors.blue, Colors.blue[400]!],
    [Colors.blue, Colors.blue[400]!],
    [Colors.blue, Colors.blue[400]!],
  ];

  static List<CircleInfo> sampleData(Size sizeOfScreen, List<List<Color>> colors) => [
        CircleInfo(
          size: const Size(175, 175),
          turns: 180 / 360,
          alignment: Alignment.topRight,
          gradient: LinearGradient(
            colors: colors[0],
          ),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(100)),
        ),
        CircleInfo(
          size: Size(sizeOfScreen.width, sizeOfScreen.height / 1.25),
          alignment: Alignment.topRight,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: colors[1],
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(min(sizeOfScreen.width, sizeOfScreen.height)*1),
            topRight: const Radius.circular(175),
          ),
        ),
        CircleInfo(
          size: const Size(250, 250),
          turns: 90 / 360,
          alignment: Alignment.topLeft,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: colors[2],
          ),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(250)),
        ),
      ];

  static List<List<Color>> getColor(GradientColor gradientColor, customGradients) {
    switch(gradientColor) {
      case GradientColor.red:
        return sampleRedColors;
      case GradientColor.blue:
        return sampleBlueColors;
      case GradientColor.custom:
        return customGradients!;
    }
  }
}
