import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/dateController.dart';
import 'package:to_do_app/controllers/noteController.dart';

class TimePickerSpinnerController extends GetxController {
  DateController dateTimeHandler = Get.put(DateController());
  NoteController noteController = Get.find();

  var hour = 0.obs;
  var min = 0.obs;

  var presentHour = DateTime.now().hour.obs;
  var presentMin = DateTime.now().minute.obs;

  var endHour = 0.obs;
  var endMin = 0.obs;

  displayStartHour() {
    if (noteController.startTime.value == '') {
      print("here");
      if (noteController.startDate.value ==
          formatDate(DateTime.now(), [dd, ".", " ", MM, " ", yyyy])) {
        //noteController.tempStartHour.value = DateTime.now().hour;
        return presentHour.value;
      } else {
        return noteController.tempStartHour.value;
      }
    } else {
      print("here2");
      return noteController.tempStartHour.value;
    }
  }

  displayStarMin() {
    if (noteController.startTime.value == '') {
      if (noteController.startDate.value ==
          formatDate(DateTime.now(), [dd, ".", " ", MM, " ", yyyy])) {
        //noteController.tempStartMin.value = presentMin.value;
        return presentMin.value;
      } else {
        return noteController.tempStartMin.value;
      }
    } else {
      return noteController.tempStartMin.value;
    }
  }

  setStartHourMin() {
    if (noteController.startDate.value ==
        formatDate(DateTime.now(), [dd, ".", " ", MM, " ", yyyy])) {
      var initialTime = DateTime.now().hour + (DateTime.now().minute / 60);
      var selecetedTime = noteController.tempStartHour.value +
          (noteController.tempStartMin.value / 60);
      if (selecetedTime - initialTime < 0.0) {
        dateTimeHandler.startTime.value = '';
        print(selecetedTime);
        print(initialTime);
        return Get.snackbar(
          "Incorrect Time!",
          "Please enter a valid starting time.",
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF007BEC),
        );
      } else {
        print("AW");
        print(noteController.tempStartHour.value);
        noteController.tempStartHour.value = presentHour.value;
        noteController.tempStartMin.value = presentMin.value;
        dateTimeHandler.startTime.value =
            "${noteController.tempStartHour.value.toString().padLeft(2, '0')}:${noteController.tempStartMin.value.toString().padLeft(2, '0')}";
      }
    } else {
      dateTimeHandler.startTime.value =
          "${noteController.tempStartHour.value.toString().padLeft(2, '0')}:${noteController.tempStartMin.value.toString().padLeft(2, '0')}";
    }
    noteController.startTime.value = dateTimeHandler.startTime.value;
    Get.back();
  }

  setEndHourMin() {
    if (noteController.startDate.value == noteController.endDate.value ||
        noteController.endDate.value == '') {
      var forTodayDate = presentHour.value + (presentMin.value / 60);
      var forfutureDate = noteController.tempStartHour.value +
          (noteController.tempStartMin.value / 60);
      var forEndTime = noteController.tempEndHour.value +
          (noteController.tempEndMin.value / 60);
      if (forEndTime - forfutureDate < 0.0 || forEndTime - forTodayDate < 0.0) {
        dateTimeHandler.endTime.value = '';
        return Get.snackbar(
          "Incorrect Time!",
          "Please enter a valid ending time.",
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
          icon: const Icon(Icons.warning, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF007BEC),
        );
      } else {
        // noteController.tempEndHour = endHour;
        // noteController.tempEndMin = endMin;
        dateTimeHandler.endTime.value =
            "${noteController.tempEndHour.value.toString().padLeft(2, '0')}:${noteController.tempEndMin.value.toString().padLeft(2, '0')}";
      }
    } else {
      //noteController.tempEndHour = endHour;
      //noteController.tempEndMin = endMin;
      dateTimeHandler.endTime.value =
          "${noteController.tempEndHour.value.toString().padLeft(2, '0')}:${noteController.tempEndMin.value.toString().padLeft(2, '0')}";
    }
    noteController.endTime.value = dateTimeHandler.endTime.value;
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
        margin: const EdgeInsets.all(10),
        colorText: Colors.white,
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else {
      setEndHourMin();
    }
  }
}
