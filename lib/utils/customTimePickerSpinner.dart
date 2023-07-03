import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/controllers/timePickerSpinnerController.dart';
import 'package:to_do_app/utils/timePickerPopButton.dart';

class CustomSpinnerTimePickerPopUP {
  NoteController noteController = Get.find();
  TimePickerSpinnerController timePickerSpinnerController =
      Get.put(TimePickerSpinnerController());
  timePickerPopUP(context, boxText) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            height: height * 0.3,
            width: width - 70,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberPicker(
                          minValue: 0,
                          maxValue: 23,
                          value: boxText == "Start Time"
                              ? timePickerSpinnerController.displayStartHour()
                              : noteController.tempEndHour.value,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 80,
                          itemHeight: 45,
                          onChanged: (value) {
                            print(value);
                            if (boxText == "Start Time") {
                              if (noteController.startDate.value ==
                                  formatDate(DateTime.now(),
                                      [dd, ".", " ", MM, " ", yyyy])) {
                                timePickerSpinnerController.presentHour.value =
                                    value;
                                print("1 " +
                                    noteController.tempStartHour.value
                                        .toString());
                                noteController.tempStartHour.value = value;
                                print("1.1 " +
                                    noteController.tempStartHour.value
                                        .toString());
                                return;
                              } else {
                                print("2 " +
                                    noteController.tempStartHour.value
                                        .toString());
                                noteController.tempStartHour.value = value;
                                print("2.2 " +
                                    noteController.tempStartHour.value
                                        .toString());
                              }
                            } else {
                              noteController.tempEndHour.value = value;
                            }
                          },
                          textStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          selectedTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Euclid Regular',
                              fontWeight: FontWeight.bold),
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        NumberPicker(
                          minValue: 0,
                          step: 1,
                          maxValue: 59,
                          value: boxText == "Start Time"
                              ? timePickerSpinnerController.displayStarMin()
                              : noteController.tempEndMin.value,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 80,
                          itemHeight: 45,
                          onChanged: (value) {
                            if (boxText == "Start Time") {
                              if (noteController.startDate.value ==
                                  formatDate(DateTime.now(),
                                      [dd, ".", " ", MM, " ", yyyy])) {
                                timePickerSpinnerController.presentMin.value =
                                    value;
                                noteController.tempStartMin.value = value;
                                return;
                              } else {
                                noteController.tempStartMin.value = value;
                              }
                            } else {
                              noteController.tempEndMin.value = value;
                            }
                            // boxText == "Start Time"
                            //     ? (noteController.startDate.value ==
                            //             formatDate(DateTime.now(),
                            //                 [dd, ".", " ", MM, " ", yyyy])
                            //         ? noteController.tempStartMin.value = value
                            //         : noteController.tempStartMin.value = value)
                            //     : noteController.tempEndMin.value = value;
                          },
                          textStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          selectedTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Euclid Regular',
                              fontWeight: FontWeight.bold),
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.black45,
                  height: 0.8,
                  width: width - 70,
                ),
                Row(
                  children: [
                    TimePickerButton(width, "Cancel", boxText),
                    Container(
                      width: 0.8,
                      height: 50,
                      color: Colors.black45,
                    ),
                    TimePickerButton(width, "Confirm", boxText)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
