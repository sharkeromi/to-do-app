import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/sp_class.dart';
import 'package:to_do_app/model/noteModel.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class NoteController extends GetxController {
  //SplashScreenController splashScreenController = Get.find();
  final SP sp = SP();
  RxBool isLoading = RxBool(false);
  RxBool initialDataExistence = RxBool(false);
  //var uniqueID = UniqueKey().hashCode;
  Note noteModel = Note();
  DB db = Get.put(DB());
  //final Note? note;
  RxList<Note> notes = RxList([]);
  //RxInt note=0.obs;

  TextEditingController titleTextEditor = TextEditingController();
  TextEditingController noteTextEditor = TextEditingController();

  RxString id = "".obs;
  RxString startDate = "".obs;
  //Rx<DateTime> startDate = Rx<DateTime>(DateTime.now());
  //Rx<DateTime> endDate = Rx<DateTime>(DateTime.now());
  RxString endDate = "".obs;
  RxString startTime = "".obs;
  RxString endTime = "".obs;

  // showNote(Note note)async {
  //   Get.to(()=>NoteView(note: note));
  // }

  loadData() async {
    //await Future.delayed(Duration(seconds: 2), () {});
    SP sp = SP();
    var source = await sp.getList();
    print('load' + source.toString());
    isLoading.value = false;
  }

  deleteNote(Note note) async {
    await db.delete(note);
    update();
  }

  saveNote(noteID) async {
    // print(noteID);
    isLoading.value = true;
    // print(noteModel.id);
    final note = Note(
        id: noteID,
        title: titleTextEditor.text.trim(),
        notedTask: noteTextEditor.text.trim(),
        startDate: startDate.value,
        endDate: endDate.value,
        startTime: startTime.value,
        endTime: endTime.value);
    if (noteID == '') {
      //await insert(note);

      await sp.setList(note);
    } else {
      updateExisitingNote(note);
    }
    update();
  }

  insert(Note note) async {
    // print(noteModel.title);
    await db.insert(note);
    update();
  }

  updateExisitingNote(note) async {
    db.updateNote(note);
    update();
  }

  delete(note) async {
    db.delete(note);
    update();
  }

   void clearData() {
    titleTextEditor.clear();
    noteTextEditor.clear();
    startDate.value = '';
    endDate.value = '';
    startTime.value = '';
    endTime.value = '';
    update();
  }
}
