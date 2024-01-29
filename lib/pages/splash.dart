import 'package:flutter/material.dart';
import 'package:rentcar/core/core.dart';
import 'package:rentcar/widgets/main_button.dart';
import 'package:get/get.dart';
import 'package:rentcar/routes/routes_name.dart';

class splash extends StatefulWidget {
  splash({Key? key}) : super(key: key);
  static const nameroute = '/splash';

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Container(
            height: height,
            color: const Color(0xFF181A20),
            child: Image.asset(
              'images/3.jpeg',
              height: height,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Hicar',
                        style: headline,
                      ),
                      TextSpan(
                        text: '.',
                        style: headlineDot,
                      ),
                    ]),
                  ),
                  SpaceVH(height: 20.0),
                  Text(
                    splashText,
                    textAlign: TextAlign.center,
                    style: headline2,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Mainbutton(
                      onTap: () {
                        Get.toNamed(RouteName.loginScreen);
                      },
                      btnColor: blueButton,
                      text: 'Get Started',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
