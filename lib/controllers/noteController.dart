import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/model/noteModel.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class NoteController extends GetxController {
  RxBool isLoading = RxBool(false);
  var uniqueID = UniqueKey().hashCode;
  Note noteModel = Note();
  //DB db = Get.put(DB());
  //final Note? note;
  RxList<Note> notes = RxList([]);
  //RxInt note=0.obs;

  TextEditingController titleTextEditor = TextEditingController();
  TextEditingController noteTextEditor = TextEditingController();

  RxString id = "".obs;
  Rx<DateTime> startDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> endDate = Rx<DateTime>(DateTime.now());
  RxString startTime = "".obs;
  RxString endTime = "".obs;

  // showNote(Note note)async {
  //   Get.to(()=>NoteView(note: note));
  // }

  deleteNote(Note note) async {
    await DB.instance.delete(note);
    update();
  }

  saveNote(noteID) async {
    isLoading.value = true;
    // print(noteModel.id);
    final note = Note(
        id: noteID ?? uniqueID,
        title: titleTextEditor.text.trim(),
        notedTask: noteTextEditor.text.trim(),
        startDate: startDate.value,
        endDate: endDate.value,
        startTime: startTime.value,
        endTime: endTime.value);
    if (noteID == '') {
      await insert(note);
    } else {
      updateExisitingNote(note);
    }
    update();
  }

  insert(Note note) async {
    print(noteModel.title);
    await DB.instance.insert(note);
    update();
  }

  updateExisitingNote(note) async {
    DB.instance.updateNote(note);
    update();
  }

  delete(note) async {
    DB.instance.delete(note);
    update();
  }
}
