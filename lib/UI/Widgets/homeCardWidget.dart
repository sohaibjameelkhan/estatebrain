import 'package:flutter/material.dart';

import '../../res.dart';

class HomeCardWidget extends StatefulWidget {
  final String orders;
  final String image;

  HomeCardWidget({
    required this.orders,
    required this.image,
  });

  @override
  _HomeCardWidgetState createState() => _HomeCardWidgetState();
}

class _HomeCardWidgetState extends State<HomeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Image.asset(widget.image),
          SizedBox(
            width: 20,
          ),
          Text(
            widget.orders,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
