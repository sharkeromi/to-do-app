import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/model/noteModel.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class NoteController extends GetxController{
   //DB db = Get.put(DB());
  //final Note? note;
  RxList notes = RxList([]);
  //RxInt note=0.obs;

  TextEditingController titleTextEditor = TextEditingController();
  TextEditingController noteTextEditor = TextEditingController();

  RxString id= "".obs;
  Rx<DateTime>  startDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime>  endDate = Rx<DateTime>(DateTime.now());
  RxString startTime = "".obs;
  RxString endTime = "".obs;

  // showNote(Note note)async {
  //   Get.to(()=>NoteView(note: note));
  // }

  deleteNote(Note note) async {
    await DB.instance.delete(note);
    update();
  }

  saveNote() async {
    final note = Note(
      id : id.value,
      title: titleTextEditor.text.trim(),
      notedTask: noteTextEditor.text.trim(),
      startDate: startDate.value,
      endDate: endDate.value,
      startTime: startTime.value,
      endTime: endTime.value
    );
    if(id.value == ''){
      insert(note);
    }else{
      updateExisitingNote(note);
    }
    update();
  }

  insert(Note note) async {
    await DB.instance.insert(note);
    update();
  }

  updateExisitingNote(note) async {
    DB.instance.update(note);
    update();
  }

  delete(note) async {
    DB.instance.delete(note);
    update();
  }
}