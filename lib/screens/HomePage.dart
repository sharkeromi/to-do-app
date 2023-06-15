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
  HomePage({super.key});

  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: "Add ToDo",
                    height: 45,
                    width: 120,
                    navigation: () {
                      Get.to(() => const AddToDo());
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: FutureBuilder<List<Note>>(
                      future: DB.instance.future,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          noteController.notes.value = snapshot.data ?? [];
                          return const Center(
                            child: SpinKitPouringHourGlass(
                                size: 25, color: Color(0xFF007BEC)),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: noteController.notes.value.length,
                            itemBuilder: (context, index) {
                              print(noteController.notes.value.length);
                              noteController.id.value =
                                  noteController.notes[index].toString();
                              return NoteWidget(
                                  //note: noteController.id.value,
                                  //onPressed: (){showNote(noteController.note.value)}
                                  );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
