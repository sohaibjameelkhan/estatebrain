import 'dart:async';

import 'package:estatebrain/UI/Screens/loginScreen.dart';
import 'package:estatebrain/UI/Widgets/auth_textfield_widget.dart';
import 'package:estatebrain/UI/Widgets/button_widget.dart';
import 'package:estatebrain/Utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../res.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<UpdatePassword> {
  bool isvisible = true;
  bool isvisible1 = true;
  //TextEditingController textEditingController = TextEditingController();
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
              height: 30,
            ),

//pincode flutter package usage
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 700,
                width: 500,
                child: ListView(
                  children: <Widget>[
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
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Reset Password Token",
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
                          "has been sent to you ",
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
                          "Sucessfully",
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
                            //  obscuringCharacter: '*',
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
                              selectedColor: MyAppColors.pink,
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
                         //   controller: textEditingController,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          authtextfieldWidget(
                         //   obsecuretext: true,
                            containerheght: 45,
                            heading: "",
                            onPwdTap: () {
                              setState(() {
                                isvisible = !isvisible;
                              });
                            },
                            visible: isvisible,
                            isPasswordField: true,
                            suffixIcon2: Icons.visibility_off,
                            suffixIcon: Icons.email,
                            showsuffix: true,
                            maxlength: 30,
                            keyboardtype: TextInputType.emailAddress,
                            //  authcontroller: _emailController,
                            showImage: false,
                            suffixImage: "",
                            text: "New Password",
                            validator: (value) {
                              if (value.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return "";
                              } else if (value.length <= 2) return "";
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          authtextfieldWidget(
                          //  obsecuretext: true,
                            containerheght: 45,
                            heading: "",
                            onPwdTap: () {
                              setState(() {
                                isvisible1 = !isvisible1;
                              });
                            },
                            visible: isvisible1,
                            isPasswordField: true,
                            suffixIcon2: Icons.visibility_off,
                            suffixIcon: Icons.email,
                            showsuffix: true,
                            maxlength: 30,
                            keyboardtype: TextInputType.emailAddress,
                            //  authcontroller: _emailController,
                            showImage: false,
                            suffixImage: "",
                            text: "Confirm Password",
                            validator: (value) {
                              if (value.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return "";
                              } else if (value.length <= 2) return "";
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: buttonWidget(
                          buttonwidth: double.infinity,
                          showborder: false,
                          text: "Update Password",
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
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
