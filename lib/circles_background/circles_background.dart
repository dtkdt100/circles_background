import 'package:flutter/material.dart';

class CircleInfo {
  CircleInfo({
    required this.size,
    this.turns = 0,
    this.alignment = Alignment.topCenter,
    this.borderRadius = const BorderRadius.all(Radius.circular(250)),
    this.gradient,
    this.color,
  });

  final Size size;
  final double turns;
  final Alignment alignment;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;
  final Color? color;
}

class CirclesBackground extends StatelessWidget {
  const CirclesBackground({Key? key, required this.circles, this.child}) : super(key: key);

  final Widget? child;
  final List<CircleInfo> circles;

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
            Theme.of(context).brightness == Brightness.dark ? Container(
              color: Colors.black.withOpacity(0.6),
            ) : const SizedBox(),
          ],
        ),
        child ?? const SizedBox(),
      ],
    );
  }

  Widget buildCircle(CircleInfo circle) => Align(
        alignment: circle.alignment,
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(circle.turns),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: circle.borderRadius,
              gradient: circle.gradient,
              color: circle.color,
            ),
            width: circle.size.width,
            height: circle.size.height,
          ),
        ),
      );
}
