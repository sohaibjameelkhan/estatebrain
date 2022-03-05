import 'package:estatebrain/Utils/constants.dart';
import 'package:flutter/material.dart';

class buttonWidget extends StatelessWidget {
  final String text;
  final bool showborder;
  final double buttonwidth;
  final Color bacgroundcolor;
  final Color textColor;
  final VoidCallback onTap;

  buttonWidget(
      {required this.text,
      required this.showborder,
      required this.buttonwidth,
      required this.bacgroundcolor,
      required this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 50,
        width: buttonwidth,
        decoration: BoxDecoration(
            border:
                showborder ? Border.all(color: MyAppColors.pink, width: 2) : null,
            color: bacgroundcolor,
            borderRadius: BorderRadius.circular(7)),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w600, fontSize: 17)),
        ),
      ),
    );
  }
}
