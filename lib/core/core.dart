import 'package:flutter/material.dart';

class Stlyes {
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'SF Pro',
      primarySwatch: Colors.blue,
    );
  }
}

const TextStyle headline = TextStyle(
  fontSize: 28,
  color: Color(0xFFEDEEEF),
  fontWeight: FontWeight.bold,
);

const TextStyle headlineDot = TextStyle(
  fontSize: 30,
  color: Color(0xFF4D60E7),
  fontWeight: FontWeight.bold,
);
const TextStyle headline1 = TextStyle(
  fontSize: 24,
  color: Color(0xFFEDEEEF),
  fontWeight: FontWeight.bold,
);

const TextStyle headline2 = TextStyle(
  fontSize: 14,
  color: Color(0xFFEDEEEF),
  fontWeight: FontWeight.w600,
);
const TextStyle headline3 = TextStyle(
  fontSize: 14,
  color: Color(0xFF5D5F65),
  fontWeight: FontWeight.bold,
);
const TextStyle hintStyle = TextStyle(
  fontSize: 14,
  color: Color(0xFF5D5F65),
  fontWeight: FontWeight.bold,
);

class SpaceVH extends StatelessWidget {
  final double? width;
  final double? height;
  const SpaceVH({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height == null ? 0.0 : height,
      width: width == null ? 0.0 : width,
    );
  }
}

const String splashText = """
 Looking for a reliable and affordable way to explore the city? Look no further than our top-notch car rental service!
 """;

const Color blueButton = Color.fromARGB(255, 84, 104, 255);
const Color blueText = Color(0xFF4D60E7);

const Color grayText = Color(0xFF5D5F65);
const Color whiteText = Color(0xFFEDEEEF);

const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);

const Color blackBG = Color(0xFF181A20);
const Color blackTextFild = Color(0xFF262A34);

const List<Color> gradient = [
  Color.fromRGBO(24, 26, 32, 1),
  Color.fromRGBO(24, 26, 32, 0.9),
  Color.fromRGBO(24, 26, 32, 0.8),
  Color.fromRGBO(24, 26, 32, 0.7),
  Color.fromRGBO(24, 26, 32, 0.6),
  Color.fromRGBO(24, 26, 32, 0.5),
  Color.fromRGBO(24, 26, 32, 0.4),
  Color.fromRGBO(24, 26, 32, 0.0),
];

 List<String> icon = [
    'images/speedo.png',
    'images/wifi.png',
    'images/seat.png',
    'images/sensor.png',
    'images/bluetooth.png',
    'images/cardoor.png',
  ];