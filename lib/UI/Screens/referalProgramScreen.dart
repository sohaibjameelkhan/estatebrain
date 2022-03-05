import 'package:estatebrain/UI/Screens/homeScreen.dart';
import 'package:estatebrain/UI/Widgets/button_widget.dart';
import 'package:estatebrain/Utils/constants.dart';
import 'package:flutter/material.dart';

import '../../res.dart';

class ReferalProgram extends StatelessWidget {
  const ReferalProgram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    icon: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "Referal Program",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyAppColors.pink,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Code",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tap to Copy",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: buttonWidget(
                  buttonwidth: double.infinity,
                  showborder: false,
                  text: "Share Referal Code",
                  onTap: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => HomeScreen()));
                  },
                  textColor: Colors.white,
                  bacgroundcolor: MyAppColors.pink),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: buttonWidget(
                  buttonwidth: double.infinity,
                  showborder: true,
                  text: "View My Refferals",
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  textColor: Colors.black,
                  bacgroundcolor: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Res.questionicon),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      // color is applied to main screen when modal bottom screen is displayed
                      // barrierColor: Colors.greenAccent,
                      //background color for modal bottom screen
                      backgroundColor: Colors.black,
                      //elevates modal bottom screen
                      elevation: 10,
                      // gives rounded corner to modal bottom screen
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Your Friends need your help",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Help your friend save time and get their",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Groceries at their doorstep.you will get",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Rs 100 when they make purchases",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "How it Works ",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
