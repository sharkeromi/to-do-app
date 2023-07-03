import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';

class CustomTextField extends StatelessWidget {
  var controller;
  String hintText;
  var counterText;
  var onChanged;
  var maxLines;
  var maxLength;

  CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.counterText,
      required this.onChanged,
      required this.maxLines,
      required this.maxLength});

  NoteController noteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textInputAction: hintText == "Write a Task Title"
          ? TextInputAction.next
          : TextInputAction.done,
      controller: controller,
      keyboardType: TextInputType.multiline,
      //minLines: ,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10)),

        counterText: counterText,
        //counter: null,
        //counterStyle: const TextStyle(
        //    fontFamily: 'Euclid Regular', color: Colors.black54),
        //counterText: noteController.noteWordCount.value.toString(),
        contentPadding: const EdgeInsets.fromLTRB(12, 6, 10, 12),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontFamily: 'Euclid Regular', color: Colors.black54),
        border: InputBorder.none,
        fillColor: Colors.black,
      ),
    );
  }
}
