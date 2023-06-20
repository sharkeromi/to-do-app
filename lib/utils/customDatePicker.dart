import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/dateController.dart';
import 'package:to_do_app/controllers/noteController.dart';

class CustomDatePicker extends StatelessWidget {
  var boxTextString;

  var datePicker;

  CustomDatePicker(
      {super.key, required this.boxTextString, required this.datePicker});
  DateController dateController = Get.put(DateController());
  NoteController noteController = Get.find();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
      ),
      onPressed: () async {
        //date picker popup
        boxTextString == "Start Date"
            ? dateController.starDateChecker(context)
            : dateController.endDateChecker(context);
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          height: 45,
          width: (width - 60) / 2,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          // Task Note Here
          child: Obx(() => boxText())
          // HERE
          ),
    );
  }

  boxText() {
    if (datePicker.value == "") {
      return Text(
        boxTextString,
        style: const TextStyle(
            fontFamily: 'Euclid Regular', color: Colors.black54),
      );
    } else {
      return Text(
        datePicker.value,
        style:
            const TextStyle(fontFamily: 'Euclid Regular', color: Colors.black),
      );
    }
  }
}
