import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';

class CustomTextField extends StatelessWidget {
  var controller;

  String hintText;

  CustomTextField(
      {super.key, required this.hintText, required this.controller});

  NoteController noteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        hintText == "Write a Task Title"
            ?noteController.titleWordCount.value = value.length:noteController.noteWordCount.value = value.length;
      },
      inputFormatters: [
        hintText == "Write a Task Title"
            ? LengthLimitingTextInputFormatter(50)
            : LengthLimitingTextInputFormatter(256),
      ],
      textInputAction: hintText == "Write a Task Title"
          ? TextInputAction.next
          : TextInputAction.done,
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: hintText == "Write a Task Title" ? 1 : 7,
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
