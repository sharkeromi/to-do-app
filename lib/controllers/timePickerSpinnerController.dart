import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/dateController.dart';
import 'package:to_do_app/controllers/noteController.dart';

class TimePickerSpinnerController extends GetxController {
  DateController dateTimeHandler = Get.put(DateController());
  NoteController noteController = Get.find();
  var hour = 0.obs;
  var min = 0.obs;

  int presentHour = DateTime.now().hour;
  int presentMin = DateTime.now().minute;

  var endHour = 0.obs;
  var endMin = 0.obs;

  void setStartHourMin() {
    dateTimeHandler.startTime.value =
        "${hour.value.toString().padLeft(2, '0')}:${min.value.toString().padLeft(2, '0')}";
    noteController.startTime.value = dateTimeHandler.startTime.value;
    // dateTimeHandler.addDateTime(dateTimeHandler.startTime);
    Get.back();
  }

  void setEndHourMin() {
    dateTimeHandler.endTime.value =
        "${endHour.value.toString().padLeft(2, '0')}:${endMin.value.toString().padLeft(2, '0')}";
    noteController.endTime.value = dateTimeHandler.endTime.value;
    // dateTimeHandler.addDateTime(dateTimeHandler.endTime);
    Get.back();
  }

  void timeValidation() {
    var et = endHour.value + (endMin.value / 60);
    var st = hour.value + (min.value / 60);
    if (noteController.startDate == noteController.endDate && (et - st) < 0) {
      noteController.endTime.value = '';
      Get.snackbar(
        "Validation Error!",
        "Please enter a valid time.",
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else {
      setEndHourMin();
    }
  }
}
