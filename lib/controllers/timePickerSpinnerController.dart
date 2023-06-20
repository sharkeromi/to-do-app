import 'package:get/get.dart';
import 'package:to_do_app/controllers/dateController.dart';
import 'package:to_do_app/controllers/noteController.dart';

class TimePickerSpinnerController extends GetxController {
  DateController dateTimeHandler = Get.put(DateController());
  NoteController noteController = Get.find();
  var hour = 0.obs;
  var min = 0.obs;

  void setStartHourMin() {
    dateTimeHandler.startTime.value =
        "${hour.value.toString().padLeft(2, '0')}:${min.value.toString().padLeft(2, '0')}";
    noteController.startTime.value = dateTimeHandler.startTime.value;
    // dateTimeHandler.addDateTime(dateTimeHandler.startTime);
    Get.back();
  }

  void setEndHourMin() {
    dateTimeHandler.endTime.value =
        "${hour.value.toString().padLeft(2, '0')}:${min.value.toString().padLeft(2, '0')}";
    noteController.endTime.value = dateTimeHandler.endTime.value;
    // dateTimeHandler.addDateTime(dateTimeHandler.endTime);
    Get.back();
  }
}
