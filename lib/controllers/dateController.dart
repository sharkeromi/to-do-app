import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';

class DateController extends GetxController {
  NoteController noteController = Get.find();

  Rx<DateTime> selectedStartDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> selectedEndDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime?> firstDateforEndDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedEndTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> selectedStartTime = Rx<TimeOfDay?>(null);

  //time is store temporarily from popup in here
  RxString startTime = "".obs;
  RxString endTime = "".obs;

  void starDateChecker(context) async {
    // DateTime temp = DateTime.parse(noteController.startDate.value);

    DateTime? pickStartDate = await showDatePicker(
        context: context,
        initialDate: noteController.startDate.value == ""
            ? selectedStartDate.value
            : noteController.tempStartDate.value,
        firstDate: DateTime.now(),
        //firstDateforEndDate.value ?? DateTime.now(),
        lastDate: DateTime(2101));
    if (pickStartDate != null) {
      selectedStartDate.value = pickStartDate;
      noteController.tempStartDate.value = pickStartDate;
      noteController.startDate.value =
          formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
      if (pickStartDate.isAfter(selectedEndDate.value)) {
        noteController.endDate.value = '';
      }
    }
    update();
  }

  void endDateChecker(context) async {
    DateTime? pickStartDate = await showDatePicker(
        context: context,
        initialDate: selectedEndDate.value.isAfter(selectedStartDate.value)
            ? (noteController.endDate.value == ""
                ? selectedEndDate.value
                : noteController.tempEndDate.value)
            : selectedStartDate.value,
        firstDate: selectedStartDate.value,
        lastDate: DateTime(2101));
    if (pickStartDate != null) {
      selectedEndDate.value = pickStartDate;
      noteController.tempEndDate.value = pickStartDate;
      noteController.endDate.value =
          formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
    }
    update();
  }
}
