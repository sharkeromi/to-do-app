import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/dateController.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/utils/customTimePickerSpinner.dart';

class CustomTimePicker extends StatelessWidget {
  var boxTextString;
  var timePicker;

  CustomTimePicker({super.key, required this.boxTextString, required this.timePicker});
  DateController dateController = Get.put(DateController());
  NoteController noteController = Get.find();
  CustomSpinnerTimePickerPopUP customSpinnerTimePickerPopUP = CustomSpinnerTimePickerPopUP();
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
      onPressed: () {
        //time picker popup
        customSpinnerTimePickerPopUP.timePickerPopUP(context, boxTextString);
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
    if (timePicker.value == "") {
      return Text(boxTextString,
          style: const TextStyle(
            fontFamily: 'Euclid Regular', color: Colors.black54),
      );
    } else {
      return Text(
        timePicker.value,
       style:
            const TextStyle(fontFamily: 'Euclid Regular', color: Colors.black),
      );
    }
  }
}
