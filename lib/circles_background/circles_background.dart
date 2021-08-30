import 'package:flutter/material.dart';

class CircleInfo {
  ///Sized of the item
  final Size size;

  ///Turns - could be from 0.0 to 1.0
  final double turns;

  ///Alignment in the screen
  final Alignment alignment;

  ///Shape of the item
  final BorderRadiusGeometry? borderRadius;

  ///Gradient or color - cannot be both
  final Gradient? gradient;
  final Color? color;

  CircleInfo({
    required this.size,
    this.turns = 0,
    this.alignment = Alignment.topCenter,
    this.borderRadius = const BorderRadius.all(Radius.circular(250)),
    this.gradient,
    this.color,
  });
}

class CirclesBackground extends StatelessWidget {
  ///Child to be above the items
  final Widget? child;

  ///List of [CircleInfo] to be made
  final List<CircleInfo> circles;

  const CirclesBackground({Key? key, required this.circles, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Stack(
              children: List.generate(
                  circles.length, (index) => buildCircle(circles[index])),
            ),
            Theme.of(context).brightness == Brightness.dark
                ? Container(
                    color: Colors.black.withOpacity(0.6),
                  )
                : const SizedBox(),
          ],
        ),
        child ?? const SizedBox(),
      ],
    );
  }

  ///Creates each item
  Widget buildCircle(CircleInfo circle) => Align(
        ///Alignment in the screen
        alignment: circle.alignment,
        child: RotationTransition(
          ///Turns with the class [RotationTransition]
          turns: AlwaysStoppedAnimation(circle.turns),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: circle.borderRadius,

              ///Color or gradient must of them must be null
              gradient: circle.gradient,
              color: circle.color,
            ),

            ///The width and the height of the item can be over the screen size
            width: circle.size.width,
            height: circle.size.height,
          ),
        ),
      );
}
