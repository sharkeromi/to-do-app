import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';

class CustomTextField extends StatelessWidget {
  var controller;

  NoteController noteController = Get.put(NoteController());

  String hintText;

  CustomTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
