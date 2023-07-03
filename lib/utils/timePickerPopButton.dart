import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/controllers/timePickerSpinnerController.dart';

Widget TimePickerButton(width, buttonText, startorEnd) {
  NoteController noteController = Get.find();
  TimePickerSpinnerController timePickerSpinnerController =
      Get.put(TimePickerSpinnerController());
  return TextButton(
    style: TextButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      //backgroundColor: Colors.amber,
      shape: buttonText == "Cancel"
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
              ),
            )
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
              ),
            ),
    ),
    onPressed: () {
      buttonText == "Cancel"
          ? Get.back()
          : startorEnd == "Start Time"
              ? timePickerSpinnerController.setStartHourMin()
              : timePickerSpinnerController.timeValidation();
    },
    child: SizedBox(
      height: 50,
      width: (width - 71) / 2,
      child: Center(
        child: Text(buttonText,
            style: buttonText == "Cancel"
                ? TextStyle(
                    fontFamily: 'Euclid Regular',
                    fontSize: 16,
                    color: Colors.red)
                : TextStyle(fontFamily: 'Euclid', fontSize: 16)),
      ),
    ),
  );
}

