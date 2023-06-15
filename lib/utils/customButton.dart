import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  double height;
  double width;
  String text;
  final navigation;

  CustomButton(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.navigation});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
      ),
      onPressed: navigation,
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xFF007BEC),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: height,
        width: width,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: 'Euclid Regular'),
        )),
      ),
    );
  }
}
