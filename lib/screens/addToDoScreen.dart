import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/utils/customButton.dart';
import 'package:to_do_app/utils/customDatePicker.dart';
import 'package:to_do_app/utils/customTextField.dart';
import 'package:to_do_app/utils/customTimePicker.dart';

class AddToDo extends StatelessWidget {
  var noteID;

  AddToDo({Key? key, required this.noteID}) : super(key: key);
  //NoteController noteController = Get.put(NoteController());
  NoteController noteController = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      // top: false,
      // bottom: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Add ToDo",
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
                  color: Colors.black45,
                ),
                const SizedBox(height: 25),
                Container(
                  height: 45,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  // Task Title Here
                  child: CustomTextField(
                    hintText: 'Write a Task Title',
                    controller: noteController.titleTextEditor,
                  ),
                  // HERE
                ),
                const SizedBox(height: 25),
                Container(
                  height: 150,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  // Task Note Here
                  child: CustomTextField(
                    hintText: 'Write a Task Note',
                    controller: noteController.noteTextEditor,
                  ),
                  // HERE
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDatePicker(
                      boxTextString: "Start Date",
                    ),
                    CustomTimePicker(
                      boxTextString: "Start Time",
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDatePicker(
                      boxTextString: "End Date",
                    ),
                    CustomTimePicker(
                      boxTextString: "End Time",
                    )
                  ],
                ),
                const SizedBox(height: 40),
                CustomButton(
                    text: "Add",
                    height: 45,
                    width: 150,
                    navigation: () async {
                      noteController.isLoading.value = true;
                      //  print(noteController.noteTextEditor.text);

                      await noteController.saveNote(noteID);
                      await noteController.loadData();
                      //noteController.isLoading.value= false;
                     Get.back();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
