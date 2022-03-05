import 'dart:async';

import 'package:estatebrain/UI/Screens/homeScreen.dart';
import 'package:estatebrain/UI/Widgets/button_widget.dart';
import 'package:estatebrain/Utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../res.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  snackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

//pincode flutter package usage
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 700,
                width: 500,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 5),
                    Container(
                      height: 120,
                      width: 140,
                      decoration: BoxDecoration(),
                      child: Center(
                        child: Image.asset(
                          Res.transparentLogo,
                          height: 150,
                          width: 170,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Please Enter Verification",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Code sent to +92384746456",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 55),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 4,
                            obscureText: false,
                            //obscuringCharacter: '*',
                            // obscuringWidget: FlutterLogo(
                            //   size: 24,
                            // ),
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              // if (v!.length < 3) {
                              //   return "I'm from validator";
                              // } else {
                              //   return null;
                              // }
                            },
                            pinTheme: PinTheme(
                              inactiveFillColor: Colors.white70,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(7),
                              borderWidth: 2,
                              fieldHeight: 50,
                              selectedColor: Colors.black87,
                              fieldWidth: 48,
                              selectedFillColor: Colors.white10,
                              inactiveColor: Color(0xffF2F2F2),
                              activeColor: Colors.white70,
                              activeFillColor: Colors.black12,
                            ),
                            cursorColor: Colors.black38,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            // backgroundColor: Colors.red,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,

                            onCompleted: (v) {
                              print("Completed");
                            },

                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        hasError
                            ? "*Please fill up all the cells properly"
                            : "",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Resend Code in 00:30",
                          style: TextStyle(
                              color: Colors.black26,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 40),
                        height: 45,
                        width: double.infinity,
                        child: ButtonTheme(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => OnBoardingPage())
                              //);
                            },
                            child: Center(
                                child: Text(
                              "Edit Number",
                              style: TextStyle(
                                  color: MyAppColors.pink,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            border:
                                Border.all(width: 2, color: MyAppColors.pink),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: []),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: buttonWidget(
                          buttonwidth: double.infinity,
                          showborder: false,
                          text: "Finish",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          textColor: Colors.white,
                          bacgroundcolor: MyAppColors.pink),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
