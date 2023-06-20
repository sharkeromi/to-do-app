import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/timePickerSpinnerController.dart';

Widget TimePickerButton(width, buttonText, startorEnd) {
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
              : timePickerSpinnerController.setEndHourMin();
    },
    child: SizedBox(
      height: 60,
      width: (width - 41) / 2,
      child: Center(
        child: Text(buttonText,
            style: const TextStyle(fontFamily: 'Euclid Regular', fontSize: 16)),
      ),
    ),
  );
}
