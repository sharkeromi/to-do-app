import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/sp_class.dart';
import 'package:to_do_app/model/noteModel.dart';

class NoteController extends GetxController {
  final SP sp = SP();
  RxBool isLoading = RxBool(false);
  RxBool initialDataExistence = RxBool(false);
  Note noteModel = Note();
  RxList<Note> notes = RxList([]);

  TextEditingController titleTextEditor = TextEditingController();
  TextEditingController noteTextEditor = TextEditingController();

  Rx<DateTime> selectedStartDate = Rx<DateTime>(DateTime.now());

  RxString id = "".obs;
  RxString startDate = "".obs;
  Rx<DateTime> tempStartDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> tempEndDate = Rx<DateTime>(DateTime.now());

  RxInt tempStartHour = 0.obs;
  RxInt tempStartMin = 0.obs;
  RxInt tempEndHour = 0.obs;
  RxInt tempEndMin = 0.obs;
  RxInt titleWordCount = 0.obs;
  RxInt noteWordCount = 0.obs;
  RxString endDate = "".obs;
  RxString startTime = "".obs;
  RxString endTime = "".obs;

  loadData() async {
    SP sp = SP();
    var source = await sp.getList();
    isLoading.value = false;
  }

  saveNote(noteID) async {
    //print(noteID);
    isLoading.value = true;
    final note = Note(
        id: noteID,
        title: titleTextEditor.text.trim(),
        notedTask: noteTextEditor.text.trim(),
        startDate: startDate.value,
        tempStartDate: tempStartDate.value.toString(),
        endDate: endDate.value,
        tempEndDate: tempEndDate.value.toString(),
        startTime: startTime.value,
        tempStartHour: tempStartHour.value,
        tempStartMin: tempStartMin.value,
        tempEndHour: tempEndHour.value,
        tempEndMin: tempEndMin.value,
        endTime: endTime.value);
    if (noteID == '') {
      print("entering setlist");
      await sp.setList(note);
    } else {
      await sp.editNote(note);
    }
    update();
  }

  updateExisitingNote(note) async {
    await sp.editNote(note);
    update();
  }

  delete(note) async {
    await sp.deleteNote(note);
    update();
  }

  void clearData() {
    titleTextEditor.clear();
    noteTextEditor.clear();
    startDate.value = '';
    tempStartDate.value = DateTime.now();
    endDate.value = '';
    tempEndDate.value = DateTime.now();
    startTime.value = '';
    endTime.value = '';
    titleWordCount = 0.obs;
    noteWordCount = 0.obs;
    update();
  }

  editNoteChecker(id, title, text, s_Date, ts_Date, e_Date, te_Date, s_Time,
      e_Time, ts_Hour, ts_min, te_Hour, te_Min) {
    if (id == "") {
      titleTextEditor.text = '';
      noteTextEditor.text = '';
      startDate.value = '';
      tempStartDate.value = DateTime.now();
      endDate.value = '';
      tempEndDate.value = DateTime.now();
      startTime.value = '';
      tempStartHour.value = 0;
      tempEndHour.value = 0;
      tempStartMin.value = 0;
      tempEndMin.value = 0;
      endTime.value = '';
    } else {
      DateTime tempSD = DateTime.parse(ts_Date);
      DateTime tempED = DateTime.parse(te_Date);
      titleTextEditor.text = title ?? '';
      noteTextEditor.text = text ?? '';
      noteWordCount.value = noteTextEditor.text.length;
      startDate.value = s_Date ?? '';
      tempStartDate.value = tempSD;
      endDate.value = e_Date ?? '';
      tempEndDate.value = tempED;
      startTime.value = s_Time ?? '';
      tempStartHour.value = ts_Hour ?? 0;
      tempStartMin.value = ts_min ?? 0;
      endTime.value = e_Time ?? '';
      tempEndHour.value = te_Hour ?? 0;
      tempEndMin.value = te_Min ?? 0;
    }
  }
}
