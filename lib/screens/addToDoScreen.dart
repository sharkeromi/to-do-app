import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/controllers/sp_class.dart';
import 'package:to_do_app/utils/customButton.dart';
import 'package:to_do_app/utils/customDatePicker.dart';
import 'package:to_do_app/utils/customTextField.dart';
import 'package:to_do_app/utils/customTimePicker.dart';

class AddToDo extends StatelessWidget {
  var noteID;

  AddToDo({
    Key? key,
    required this.noteID,
  }) : super(key: key);
  //NoteController noteController = Get.put(NoteController());
  NoteController noteController = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      // bottom: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: noteID == ""
                ? Text(
                    "Add ToDo",
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Euclid Regular',
                        fontWeight: FontWeight.bold),
                  )
                : Text(
                    "Edit ToDo",
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Euclid Regular',
                        fontWeight: FontWeight.bold),
                  ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    // width: width - 16,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 60,
                    width: width,

                    // Task Title Here
                    child: CustomTextField(
                      onChanged: (value) {
                        noteController.titleWordCount.value = value.length;
                      },
                      hintText: 'Write a Task Title',
                      controller: noteController.titleTextEditor,
                      counterText: null,
                      maxLines: 1,
                      maxLength: null,
                    ),
                    // HERE
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 150,
                    width: width,

                    // Task Note Here
                    child: Obx(() => CustomTextField(
                          onChanged: (value) {
                            print(value);

                            noteController.noteWordCount.value = value.length;
                            print(noteController.noteWordCount.value);
                          },
                          counterText:
                              '${noteController.noteWordCount.value.toString()}/256',
                          hintText: 'Write a Task Note',
                          controller: noteController.noteTextEditor,
                          maxLines: 7,
                          maxLength: 256,
                        )),
                    // HERE
                  ),
                  const SizedBox(height: 10),
                  // Obx(
                  //   () => Container(
                  //     alignment: Alignment.centerRight,
                  //     height: 25,
                  //     width: width - 60,
                  //     child: Text('${noteController.noteWordCount}/256'),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDatePicker(
                        boxTextString: "Start Date",
                        tempDate: noteController.tempStartDate.value,
                        datePicker: noteController.startDate,
                      ),
                      CustomTimePicker(
                        boxTextString: "Start Time",
                        timePicker: noteController.startTime,
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDatePicker(
                        boxTextString: "End Date",
                        tempDate: noteController.tempEndDate.value,
                        datePicker: noteController.endDate,
                      ),
                      CustomTimePicker(
                        boxTextString: "End Time",
                        timePicker: noteController.endTime,
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: noteID == '' ? "Add" : "Update",
                    height: 45,
                    width: 150,
                    navigation: () async {
                      await validation();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validation() async {
    if (noteController.titleTextEditor.text.trim() == '' &&
        noteController.noteTextEditor.text.trim() == '' &&
        noteController.startDate == '' &&
        noteController.startTime == '') {
      Get.snackbar(
        "Required fields are empty!",
        "Please fill all the required fields.",
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else if (noteController.titleTextEditor.text.trim() == '') {
      Get.snackbar(
        "Required field is empty.",
        "Please fill title ",
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else if (noteController.noteTextEditor.text.trim() == '') {
      Get.snackbar(
        "Required field is empty.",
        "Please fill title ",
        margin: EdgeInsets.all(10),
        colorText: Colors.white,
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else if (noteController.titleTextEditor.text.trim() == '' &&
        noteController.noteTextEditor.text.trim() == '') {
      Get.snackbar(
        "Required fields are empty.",
        "Please fill title and note ",
        colorText: Colors.white,
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else if (noteController.startDate == '' &&
        noteController.startTime == '') {
      Get.snackbar(
        "Required fields are empty!",
        "Please fill Start Date and and Start Time",
        colorText: Colors.white,
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else if (noteController.startDate == '') {
      Get.snackbar(
        "Required field is empty!",
        "Please fill Start Date.",
        colorText: Colors.white,
        margin: EdgeInsets.all(10),
        icon: Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else if (noteController.startTime == '') {
      Get.snackbar(
        "Required fields is empty!",
        "Please fill Start Time",
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF007BEC),
      );
    } else {
      noteController.isLoading.value = true;
      await noteController.saveNote(noteID);
      //print(noteID);
      await noteController.loadData();
      noteController.clearData();
      Get.back();
    }
  }

  // updateNote()async{
  //   await noteController.
  // }
}
