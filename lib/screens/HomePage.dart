import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/model/noteModel.dart';
import 'package:to_do_app/screens/addToDoScreen.dart';
import 'package:to_do_app/utils/customButton.dart';
import 'package:to_do_app/utils/noteWidget.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  NoteController noteController = Get.find<NoteController>();
  DB db = Get.find<DB>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        // top: false,
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Obx(
              () => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        text: "Add ToDo",
                        height: 45,
                        width: 120,
                        navigation: () {
                          Get.to(() => AddToDo(
                                noteID: '',
                              ));
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
                      : SizedBox(
                          height: MediaQuery.of(context).size.height -
                              55 -
                              MediaQuery.of(context).padding.top,
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: noteController.notes.length,
                              itemBuilder: (context, index) {
                                // db.future;
                                // print(noteController.notes.value.length);

                                //var note = noteController.notes[index];
                                return Obx(
                                  () => NoteWidget(
                                      id: noteController.notes[index].id,
                                      title: noteController.notes[index].title,
                                      notedTask:
                                          noteController.notes[index].notedTask
                                      //note: noteController.id.value,
                                      //onPressed: (){showNote(noteController.note.value)}
                                      ),
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
