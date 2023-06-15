import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextField extends StatelessWidget {
  var controller;

  String hintText;

  CustomTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: hintText == "Write a Task Title" ? 1 : null,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(12, 6, 10, 12),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontFamily: 'Euclid Regular', color: Colors.black54),
        border: InputBorder.none,
        fillColor: Colors.black,
      ),
    );
  }
}
