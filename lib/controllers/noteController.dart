import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/sp_class.dart';
import 'package:to_do_app/model/noteModel.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class NoteController extends GetxController {
  final SP sp = SP();
  RxBool isLoading = RxBool(false);
  RxBool initialDataExistence = RxBool(false);
  Note noteModel = Note();
  DB db = Get.put(DB());
  RxList<Note> notes = RxList([]);

  TextEditingController titleTextEditor = TextEditingController();
  TextEditingController noteTextEditor = TextEditingController();

  RxString id = "".obs;
  RxString startDate = "".obs;
  RxInt titleWordCount = 0.obs;
  RxInt noteWordCount = 0.obs;
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
    // print('load' + source.toString());
    isLoading.value = false;
  }

  deleteNote(Note note) async {
    await db.delete(note);
    update();
  }

  saveNote(noteID) async {
    print(noteID);
    isLoading.value = true;
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
      //print(note.id);
      sp.editNote(note);
      //updateExisitingNote(note);
    }
    update();
  }

  insert(Note note) async {
    // print(noteModel.title);
    await db.insert(note);
    update();
  }

  updateExisitingNote(note) async {
    // print(note.id);
    await sp.editNote(note);
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
    titleWordCount = 0.obs;
    noteWordCount = 0.obs;

    update();
  }

  // findNoteID(noteID, Note note) async{
  //   var oldList = await sp.getList();
  //   int ind = oldList.indexWhere((e) => e.id == noteID);
  //   return oldList[]
  // }

  editNoteChecker(id, title, text, s_Date, e_Date, s_Time, e_Time) {
    if (id == "") {
      titleTextEditor.text = '';
      noteTextEditor.text = '';
      startDate.value = '';
      endDate.value = '';
      startTime.value = '';

      endTime.value = '';
    } else {
      titleTextEditor.text = title ?? '';
      noteTextEditor.text = text ?? '';
      startDate.value = s_Date ?? '';
      endDate.value = e_Date ?? '';
      startTime.value = s_Time ?? '';
      endTime.value = e_Time ?? '';
    }
  }
}
