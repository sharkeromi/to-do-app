import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/model/noteModel.dart';
import 'package:to_do_app/screens/addToDoScreen.dart';
import 'package:to_do_app/utils/customButton.dart';
import 'package:to_do_app/utils/noteWidget.dart';
import 'package:to_do_app/utils/sharedPref.dart';

import '../controllers/sp_class.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  NoteController noteController = Get.find<NoteController>();
  SP sp = SP();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        // top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Obx(
              () => noteController.initialDataExistence.value
                  ? Center(
                      child: CustomButton(
                        text: "Add ToDo",
                        height: 45,
                        width: 120,
                        navigation: () {
                          noteController.clearData();
                          Get.to(
                              () => AddToDo(
                                    noteID: '',
                                  ),
                              duration: Duration(milliseconds: 800),
                              transition: Transition.rightToLeft);
                        },
                      ),
                    )
                  : SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                text: "Add ToDo",
                                height: 45,
                                width: 120,
                                navigation: () {
                                  Get.to(
                                      () => AddToDo(
                                            noteID: '',
                                          ),
                                      duration: Duration(milliseconds: 800),
                                      transition: Transition.rightToLeft);
                                  noteController.clearData();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          noteController.isLoading.value
                              ? SizedBox(
                                  height: 100,
                                  child: const Center(
                                    child: SpinKitPouringHourGlass(
                                        size: 25, color: Color(0xFF007BEC)),
                                  ),
                                )
                              : SingleChildScrollView(
                                  //physics: AlwaysScrollableScrollPhysics(),
                                  child: ListView.builder(
                                    // physics:
                                    //     const AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: noteController.notes.length,
                                    itemBuilder: (context, index) {
                                      // db.future;
                                      // print(noteController.notes.value.length);

                                      //var note = noteController.notes[index];
                                      return Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10.0),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(
                                                  AddToDo(
                                                      noteID: noteController
                                                          .notes[index].id),
                                                  duration: Duration(
                                                      milliseconds: 800),
                                                  transition:
                                                      Transition.rightToLeft);
                                            },
                                            child: NoteWidget(
                                              id: noteController
                                                  .notes[index].id,
                                              title: noteController
                                                  .notes[index].title,
                                              notedTask: noteController
                                                  .notes[index].notedTask,
                                              startDate: noteController
                                                  .notes[index].startDate,
                                              endDate: noteController
                                                  .notes[index].endDate,
                                              startTime: noteController
                                                  .notes[index].startTime,
                                              endTime: noteController
                                                  .notes[index].endTime,
                                              //note: noteController.id.value,
                                              //onPressed: (){showNote(noteController.note.value)}
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
