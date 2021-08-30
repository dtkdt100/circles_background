import 'package:flutter/material.dart';
import 'package:circles_background/circles_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circles Background',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: CirclesBackgroundPage(),
      //home: const ThreeCirclesBackgroundPage(GradientColor.blue),
      //home: const ThreeCirclesBackgroundPage(GradientColor.red),
      //home: const ThreeCirclesBackgroundPage(GradientColor.custom),
    );
  }
}

class CirclesBackgroundPage extends StatelessWidget {
  CirclesBackgroundPage({Key? key}) : super(key: key);

  final List<CircleInfo> circles = [
    CircleInfo(
        size: const Size(300, 500),
        color: Colors.green,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(200)),
        alignment: Alignment.topRight
    ),
    CircleInfo(
        size: const Size(300, 900),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[800]!, Colors.green]
        ),
        borderRadius: const BorderRadius.only(),
        alignment: Alignment.topLeft
    ),
    CircleInfo(
        size: const Size(200, 500),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[800]!, Colors.green]
        ),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(150)),
        alignment: Alignment.bottomRight
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CirclesBackground(
        circles: circles,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 25),
          child: Text('Hello word!', style: TextStyle(
            color: Colors.white,
            fontSize: 40
          ),),
        ),
      ),

    );
  }
}

class ThreeCirclesBackgroundPage extends StatelessWidget {
  final GradientColor gradientColor;
  const ThreeCirclesBackgroundPage(this.gradientColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThreeCirclesBackground(
        gradientColor: gradientColor,
        customColors: getCustomColors(),
        sizeOfScreen: MediaQuery.of(context).size,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 70, horizontal: 25),
          child: Text('Hello word!', style: TextStyle(
              color: Colors.white,
              fontSize: 40
          ),),
        ),
      ),

    );
  }

  List<List<Color>>? getCustomColors() {
    if (gradientColor == GradientColor.custom) {
      return [
        [Colors.pink[700]!, Colors.pink[900]!],
        [Colors.pink[700]!, Colors.pink[900]!],
        [Colors.pink[700]!, Colors.pink[900]!],
      ];
    }
  }
}


