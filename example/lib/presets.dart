import 'package:circles_background/circles_background.dart';
import 'package:flutter/material.dart';

/// A background style shown in the gallery.
class Preset {
  const Preset({
    required this.name,
    required this.description,
    required this.accent,
    required this.code,
    required this.builder,
  });

  final String name;
  final String description;
  final Color accent;

  /// Snippet shown in the "view code" sheet.
  final String code;

  /// Builds the background for a screen of the given [size].
  final Widget Function(Size size, Widget? child) builder;
}

final List<Preset> presets = [
  Preset(
    name: 'Ocean',
    description: 'The built-in three circles preset in blue.',
    accent: Colors.blue,
    code: '''ThreeCirclesBackground(
  sizeOfScreen: MediaQuery.sizeOf(context),
  gradientColor: GradientColor.blue,
  child: const YourContent(),
)''',
    builder: (size, child) => ThreeCirclesBackground(
      sizeOfScreen: size,
      gradientColor: GradientColor.blue,
      child: child,
    ),
  ),
  Preset(
    name: 'Sunset',
    description: 'The same preset with the red gradient.',
    accent: Colors.red,
    code: '''ThreeCirclesBackground(
  sizeOfScreen: MediaQuery.sizeOf(context),
  gradientColor: GradientColor.red,
  child: const YourContent(),
)''',
    builder: (size, child) => ThreeCirclesBackground(
      sizeOfScreen: size,
      gradientColor: GradientColor.red,
      child: child,
    ),
  ),
  Preset(
    name: 'Blossom',
    description: 'The three circles preset with your own colors.',
    accent: Colors.pink,
    code: '''ThreeCirclesBackground(
  sizeOfScreen: MediaQuery.sizeOf(context),
  gradientColor: GradientColor.custom,
  customColors: [
    [Colors.pink[700]!, Colors.pink[400]!],
    [Colors.pink[700]!, Colors.pink[400]!],
    [Colors.pink[700]!, Colors.pink[400]!],
  ],
  child: const YourContent(),
)''',
    builder: (size, child) => ThreeCirclesBackground(
      sizeOfScreen: size,
      gradientColor: GradientColor.custom,
      customColors: [
        [Colors.pink[700]!, Colors.pink[400]!],
        [Colors.pink[700]!, Colors.pink[400]!],
        [Colors.pink[700]!, Colors.pink[400]!],
      ],
      child: child,
    ),
  ),
  Preset(
    name: 'Forest',
    description: 'Fully custom shapes built with CircleInfo.',
    accent: Colors.green,
    code: '''CirclesBackground(
  circles: [
    CircleInfo(
      size: const Size(300, 500),
      color: Colors.green,
      alignment: Alignment.topRight,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(200),
      ),
    ),
    CircleInfo(
      size: const Size(300, 1000),
      alignment: Alignment.topLeft,
      borderRadius: BorderRadius.zero,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.green[800]!, Colors.green],
      ),
    ),
    CircleInfo(
      size: const Size(200, 500),
      alignment: Alignment.bottomRight,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        topLeft: Radius.circular(150),
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.green[800]!, Colors.green],
      ),
    ),
  ],
  child: const YourContent(),
)''',
    builder: (size, child) => CirclesBackground(
      circles: [
        CircleInfo(
          size: const Size(300, 500),
          color: Colors.green,
          alignment: Alignment.topRight,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(200),
          ),
        ),
        CircleInfo(
          size: const Size(300, 1000),
          alignment: Alignment.topLeft,
          borderRadius: BorderRadius.zero,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[800]!, Colors.green],
          ),
        ),
        CircleInfo(
          size: const Size(200, 500),
          alignment: Alignment.bottomRight,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topLeft: Radius.circular(150),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[800]!, Colors.green],
          ),
        ),
      ],
      child: child,
    ),
  ),
  Preset(
    name: 'Aurora',
    description: 'Mix gradients, solid colors and any alignment.',
    accent: Colors.deepPurple,
    code: '''final size = MediaQuery.sizeOf(context);

CirclesBackground(
  circles: [
    CircleInfo(
      size: Size(size.width, size.height * 0.55),
      alignment: Alignment.topLeft,
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(400),
      ),
      gradient: const LinearGradient(
        colors: [Colors.deepPurple, Colors.indigo],
      ),
    ),
    CircleInfo(
      size: const Size(260, 260),
      alignment: Alignment.bottomRight,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(260),
      ),
      gradient: const LinearGradient(
        colors: [Colors.teal, Colors.cyan],
      ),
    ),
    CircleInfo(
      size: const Size(120, 120),
      alignment: const Alignment(0.9, 0.1),
      color: Colors.pinkAccent,
    ),
  ],
  child: const YourContent(),
)''',
    builder: (size, child) => CirclesBackground(
      circles: [
        CircleInfo(
          size: Size(size.width, size.height * 0.55),
          alignment: Alignment.topLeft,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(400),
          ),
          gradient: const LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
          ),
        ),
        CircleInfo(
          size: const Size(260, 260),
          alignment: Alignment.bottomRight,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(260)),
          gradient: const LinearGradient(colors: [Colors.teal, Colors.cyan]),
        ),
        CircleInfo(
          size: const Size(120, 120),
          alignment: const Alignment(0.9, 0.1),
          color: Colors.pinkAccent,
        ),
      ],
      child: child,
    ),
  ),
];
