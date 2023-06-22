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

  //RxString startDate = "".obs;
  //RxString endDate = "".obs;
  //time is store temporarily from popup in here
  RxString startTime = "".obs;
  RxString endTime = "".obs;

  void starDateChecker(context) async {
    DateTime? pickStartDate = await showDatePicker(
        context: context,
        initialDate: selectedStartDate.value,
        firstDate: firstDateforEndDate.value ?? DateTime.now(),
        lastDate: DateTime(2101));
    if (pickStartDate != null) {
      selectedStartDate.value = pickStartDate;
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
            ? selectedEndDate.value
            : selectedStartDate.value,
        firstDate: selectedStartDate.value,
        lastDate: DateTime(2101));
    if (pickStartDate != null) {
      selectedEndDate.value = pickStartDate;
      noteController.endDate.value =
          formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
    }
    update();
  }

  void startTimeChecker(context) async {
    TimeOfDay? pickTime = await showTimePicker(
        context: context,
        initialTime: selectedStartDate.value.isBefore(DateTime.now())
            ? TimeOfDay.now()
            : selectedStartTime.value ?? const TimeOfDay(hour: 12, minute: 00));
    if (pickTime != null) {
      selectedStartTime.value = pickTime;
      startTime.value =
          '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
    }
    update();
  }

  void endTimeChecker(context) async {
    TimeOfDay? pickTime = await showTimePicker(
        context: context,
        initialTime: selectedStartDate.value.isBefore(DateTime.now())
            ? selectedStartTime.value ?? TimeOfDay.now()
            : selectedEndTime.value ?? const TimeOfDay(hour: 12, minute: 00));
    if (pickTime != null) {
      selectedEndTime.value = pickTime;
      endTime.value =
          '${pickTime.hour.toString()}:${pickTime.minute.toString()}';
      // addDateTime(endTime);
    }
    update();
  }
}
