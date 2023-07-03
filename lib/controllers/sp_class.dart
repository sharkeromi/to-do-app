import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/model/noteModel.dart';

const keyNote = 'notes';

class SP {
  getList() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var noteList = await spref.getString(keyNote);
    NoteController noteController = Get.find<NoteController>();
    //print(noteList);
    if (noteList == null) {
      noteController.initialDataExistence.value = true;
      //print('1');
      await spref.setString(keyNote, json.encode([]));
      return [];
    } else {
      // print('1');
      var source = json.decode(noteList);
      if (source.isEmpty) {
        noteController.initialDataExistence.value = true;
      } else {
        noteController.initialDataExistence.value = false;
      }
      List<Map<String, dynamic>> newNoteList = List.from(source);
      noteController.notes.value =
          newNoteList.map((e) => Note.ofJson(e)).toList();
      return source;
    }
  }

  setList(Note notes) async {
    var oldList = await getList();
    var id;
    if (oldList.isEmpty) {
      id = "1";
      notes.id = id;
      print(id);
    } else {
      id = (oldList.length + 1).toString();
      notes.id = id;
    }
    var data = {
      'id': notes.id,
      'title': notes.title,
      'notedTask': notes.notedTask,
      'startDate': notes.startDate,
      'tempStartDate': notes.tempStartDate,
      'endDate': notes.endDate,
      'tempEndDate': notes.tempEndDate,
      'startTime': notes.startTime,
      'tempStartHour': notes.tempStartHour,
      'tempStartMin': notes.tempStartMin,
      'endTime': notes.endTime,
      'tempEndHour': notes.tempEndHour,
      'tempEndMin': notes.tempEndMin
    };
    oldList.add(data);
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.setString(keyNote, json.encode(oldList));
    var temp = await spref.getString(keyNote);
    print('after save' + temp.toString());
  }

  editNote(Note notes) async {
    var oldList = await getList();
    NoteController noteController = Get.find<NoteController>();
    for (int index = 0; index < oldList.length; index++) {
      print("id" + notes.id!.toString());
      if (oldList[index]['id'].toString() == notes.id) {
        print("index" + index.toString());

        oldList[index]['title'] = notes.title;
        oldList[index]['notedTask'] = notes.notedTask;
        oldList[index]['startDate'] = notes.startDate;
        oldList[index]['startTime'] = notes.startTime;
        oldList[index]['tempStartHour'] = notes.tempStartHour;
        oldList[index]['tempStartMin'] = notes.tempStartMin;
        oldList[index]['tempStartDate'] = notes.tempStartDate;
        oldList[index]['endDate'] = notes.endDate;
        oldList[index]['tempEndDate'] = notes.tempEndDate;
        oldList[index]['endTime'] = notes.endTime;
        oldList[index]['tempEndHour'] = notes.tempEndHour;
        oldList[index]['tempEndMin'] = notes.tempEndMin;
        print(oldList);
      }
    }
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.setString(keyNote, json.encode(oldList));
    var temp = await spref.getString(keyNote);
    //print('after save' + temp.toString());
  }

  deleteNote(noteID) async {
    var oldList = await getList();
    oldList.removeWhere((element) => element['id'] == noteID);
    NoteController noteController = Get.find<NoteController>();
    for (int index = 0; index < oldList.length; index++) {
      if (oldList[index]['id'].toString() != index.toString()) {
        oldList[index]['id'] = index.toString();
      }
    }
    print(oldList);
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.setString(keyNote, json.encode(oldList));
  }

  remove() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.remove(keyNote);
  }
}
