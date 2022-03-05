import 'dart:async';

import 'package:estatebrain/Utils/constants.dart';
import 'package:flutter/material.dart';

import '../../res.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // void initState() {
  //   super.initState();
  //   Timer(
  //       Duration(seconds: 3),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => LoginScreen())));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 140,
              width: 170,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage("Assets/Images/background.png"))
                //
              ),
              child: Center(
                child: Image.asset(
                  Res.transparentLogo,
                  height: 180,
                  width: 180,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  height: 38,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: MyAppColors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  child: Center(
                    child: Text(
                        'Get Started', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
