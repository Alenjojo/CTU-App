import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Wrapper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var color = "Orange";

  orangeSplashScreen() {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset("assets/image/White_Logo.svg"),
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset("assets/image/White_Name.svg"),
        ],
      )),
      backgroundColor: Color(0xFFFD8F6E),
    );
  }

  whiteSplashScreen() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            duration: 150,
            splash: Image.asset(
              'assets/images/logo.png',
              height: 500,
              width: 500,
            ),
            nextScreen: AnimatedSplashScreen(
                duration: 150,
                splash: Text(
                  "Career begins here",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                nextScreen: Wrapper(),
                // StreamProvider<UserDetails>.value(
                //     value: AuthService().user, child: Wrapper()),
                splashTransition: SplashTransition.decoratedBoxTransition,
                backgroundColor: Colors.white),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color(0xffffffff)));
  }
}
