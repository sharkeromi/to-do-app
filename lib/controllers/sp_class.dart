import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/model/noteModel.dart';

const keyNote = 'notes';

class SP {
  //NoteController noteController = Get.find<NoteController>();
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
        // print("2");
        noteController.initialDataExistence.value = true;
      } else {
        // print("3");

        noteController.initialDataExistence.value = false;
      }
      // var source = json.decode(noteList);
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
    } else {
      id = (oldList.length + 1).toString();
      notes.id = id;
    }
    var data = {
      'id': notes.id,
      'title': notes.title,
      'notedTask': notes.notedTask,
      'startDate': notes.startDate,
      'endDate': notes.endDate,
      'startTime': notes.startTime,
      'endTime': notes.endTime
    };
    //print(data);
    // print(oldList);
    oldList.add(data);
    // print(oldList);
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.setString(keyNote, json.encode(oldList));
    var temp = await spref.getString(keyNote);
    print('after save' + temp.toString());
  }

  editNote(Note notes) async {
    var oldList = await getList();
    NoteController noteController = Get.find<NoteController>();
    for (int index = 0; index < oldList.length; index++) {
      print("id" + notes.id!);
      if (oldList[index]['id'].toString() == notes.id) {
        print("index" + index.toString());

        oldList[index]['title'] = notes.title;
        oldList[index]['notedTask'] = notes.notedTask;
        oldList[index]['startDate'] = notes.startDate;
        oldList[index]['startTime'] = notes.startTime;
        oldList[index]['endDate'] = notes.endDate;
        oldList[index]['endTime'] = notes.endTime;
        // var data = {
        //   'id': notes.id,
        //   'title': notes.title,
        //   'notedTask': notes.notedTask,
        //   'startDate': notes.startDate,
        //   'endDate': notes.endDate,
        //   'startTime': notes.startTime,
        //   'endTime': notes.endTime
        // };
        //oldList.add(data);
        print(oldList);
      }
    }
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.setString(keyNote, json.encode(oldList));
    var temp = await spref.getString(keyNote);
    //print('after save' + temp.toString());
  }

  deleteNote(Note note) async {
    var oldList = await getList();
    int ind = oldList.indexWhere((e) => e.id == note.id);
    if (ind >= 0) {
      oldList.removeAt(ind);
    }
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.setString(keyNote, json.encode(oldList));
  }

  remove() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.remove(keyNote);
  }
}
