import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class authtextfieldWidget extends StatefulWidget {
 // final bool obsecuretext;
  final double containerheght;
  final int maxlength;
  final String heading;
  final TextInputType keyboardtype;
  final String text;
  final String suffixImage;
  final bool showImage;

  final bool showsuffix;
  final IconData suffixIcon;
  final IconData suffixIcon2;
  final Function(String) validator;
  final VoidCallback onPwdTap;
  final bool isPasswordField;
  final bool visible;

  //final bool showSuffix;
  authtextfieldWidget(
      {
       // required this.obsecuretext,
        required this.containerheght,
        required this.heading,
        this.visible = false,
      this.isPasswordField = false,
      required this.suffixIcon2,
      required this.maxlength,
      required this.keyboardtype,
      required this.text,
      required this.suffixImage,
      required this.showsuffix,
      required this.showImage,
      required this.validator,
      required this.suffixIcon,
      required this.onPwdTap});

  @override
  _authtextfieldWidgetState createState() => _authtextfieldWidgetState();
}

class _authtextfieldWidgetState extends State<authtextfieldWidget> {
  // bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.heading,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        SizedBox(
          height: 2,
        ),
        Container(
          height: widget.containerheght,
          width: 300,
          child: TextFormField(
            obscureText: widget.visible,
            keyboardType: widget.keyboardtype,
            // controller: widget.authcontroller,
            validator: (val) => widget.validator(val!),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 5, left: 15),
              border: OutlineInputBorder(),
              // suffix: Icon(Icons.remove_red_eye_sharp),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 10,
              ),
              hintText: widget.text,
              suffixIcon: widget.isPasswordField
                  ? InkWell(
                      onTap: () => widget.onPwdTap(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 19.0, top: 15, bottom: 40, right: 10),
                        child: widget.visible
                            ? Icon(
                                CupertinoIcons.eye_slash,
                                size: 20,
                              )
                            : Icon(
                                CupertinoIcons.eye,
                                size: 20,
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
