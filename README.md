# Circles Background

[![pub package](https://img.shields.io/pub/v/circles_background.svg)](https://pub.dev/packages/circles_background)
[![pub points](https://img.shields.io/pub/points/circles_background)](https://pub.dev/packages/circles_background/score)
[![likes](https://img.shields.io/pub/likes/circles_background)](https://pub.dev/packages/circles_background/score)
[![license](https://img.shields.io/badge/license-BSD--3--Clause-blue.svg)](https://github.com/dtkdt100/circles_background/blob/main/LICENSE)

Beautiful circle and shape backgrounds for your Flutter screens. Use the
ready-made design in one line, or build your own from any mix of shapes,
colors and gradients.

| `GradientColor.blue` | `GradientColor.red` | `GradientColor.custom` | `CirclesBackground` |
| :---: | :---: | :---: | :---: |
| ![Blue preset](https://raw.githubusercontent.com/dtkdt100/circles_background/main/screenshots/1.jpg) | ![Red preset](https://raw.githubusercontent.com/dtkdt100/circles_background/main/screenshots/2.jpg) | ![Custom colors preset](https://raw.githubusercontent.com/dtkdt100/circles_background/main/screenshots/3.jpg) | ![Custom shapes](https://raw.githubusercontent.com/dtkdt100/circles_background/main/screenshots/4.jpg) |

## Features

- **Ready-made design:** `ThreeCirclesBackground` gives you a polished background in one line.
- **Fully customizable:** `CirclesBackground` draws any list of shapes you describe with `CircleInfo`.
- **Gradients or solid colors,** with any size, rotation, alignment and corner radius.
- **Dark mode aware:** the background dims automatically when the app uses a dark theme.
- **Works everywhere:** Android, iOS, web, Windows, macOS and Linux, with no dependencies besides Flutter.

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  circles_background: ^0.0.4
```

Then import it:

```dart
import 'package:circles_background/circles_background.dart';
```

## Usage

### Ready-made design

Wrap your screen content with `ThreeCirclesBackground`:

```dart
Scaffold(
  body: ThreeCirclesBackground(
    sizeOfScreen: MediaQuery.sizeOf(context),
    gradientColor: GradientColor.blue, // or GradientColor.red
    child: const Text('Hello world!'),
  ),
)
```

To use your own colors, set `gradientColor` to `GradientColor.custom` and pass
`customColors`: exactly 3 lists (one per circle), each with at least two colors
for the gradient.

```dart
ThreeCirclesBackground(
  sizeOfScreen: MediaQuery.sizeOf(context),
  gradientColor: GradientColor.custom,
  customColors: [
    [Colors.pink[700]!, Colors.pink[400]!],
    [Colors.pink[700]!, Colors.pink[400]!],
    [Colors.pink[700]!, Colors.pink[400]!],
  ],
  child: const Text('Hello world!'),
)
```

### Your own shapes

Use `CirclesBackground` and describe each shape with a `CircleInfo`:

```dart
CirclesBackground(
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
  child: const Text('Hello world!'),
)
```

Shapes are painted in list order, so later shapes are drawn on top of earlier ones.

## API

### `CircleInfo`

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `Size` | required | Width and height of the shape. It may be larger than the screen. |
| `alignment` | `Alignment` | `Alignment.topCenter` | Where the shape is placed on the screen. |
| `borderRadius` | `BorderRadiusGeometry?` | `BorderRadius.all(Radius.circular(250))` | Corner radius that gives the shape its form. |
| `color` | `Color?` | `null` | Solid fill color. Don't combine with `gradient`. |
| `gradient` | `Gradient?` | `null` | Gradient fill. Don't combine with `color`. |
| `turns` | `double` | `0` | Rotation, from `0.0` to `1.0` (a full turn). |

### `ThreeCirclesBackground`

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `sizeOfScreen` | `Size` | required | Screen size, usually `MediaQuery.sizeOf(context)`. |
| `gradientColor` | `GradientColor` | `GradientColor.blue` | `blue`, `red` or `custom`. |
| `customColors` | `List<List<Color>>?` | `null` | Required when `gradientColor` is `custom`: 3 lists of colors. |
| `child` | `Widget?` | `null` | Content drawn on top of the background. |

## Example app

The [example](https://github.com/dtkdt100/circles_background/tree/main/example)
app is a gallery of background styles. Tap one to see it full screen, swipe
between styles, switch to dark mode, and copy the code for any style.

```sh
cd example
flutter run
```

## Contributing

Issues and pull requests are welcome on
[GitHub](https://github.com/dtkdt100/circles_background).
