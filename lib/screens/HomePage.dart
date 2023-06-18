import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/model/noteModel.dart';
import 'package:to_do_app/screens/addToDoScreen.dart';
import 'package:to_do_app/utils/customButton.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:to_do_app/utils/noteWidget.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    ? const SizedBox()
                    : FutureBuilder<List<Note>>(
                        future: DB.instance.future,
                        builder: (context, snapshot) {
                          noteController.notes.value = snapshot.data ?? [];
                          // if (!snapshot.hasData)
                          //   return const Center(
                          //       child: SpinKitPouringHourGlass(
                          //           size: 25, color: Color(0xFF007BEC)));

                          // print(2);
                          // print(snapshot.data);
                          // print(3);

                          // print(noteController.notes.value);
                          // print(4);
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: noteController.notes.length,
                            itemBuilder: (context, index) {
                              DB.instance.future;
                              // print(noteController.notes.value.length);
                              print("kurse");
                              //var note = noteController.notes[index];
                              return NoteWidget(
                                  id: noteController.notes[index].id,
                                  title: noteController.notes[index].title,
                                  notedTask:
                                      noteController.notes[index].notedTask
                                  //note: noteController.id.value,
                                  //onPressed: (){showNote(noteController.note.value)}
                                  );
                            },
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
