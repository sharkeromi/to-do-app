import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/model/noteModel.dart';

const keyNote = 'notes';

class SP {
  
  getList() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var noteList = await spref.getString(keyNote);
    print(noteList);
    if (noteList == null) {
      print('1');
      await spref.setString(keyNote, json.encode([]));
      return [];
    } else {
      print("2");
      // NoteController noteController = Get.find<NoteController>();

      var source = json.decode(noteList);
      // List<Map<String, dynamic>> newNoteList = List.from(source);
      // noteController.notes.value =
      //     newNoteList.map((e) => Note.ofJson(e)).toList();

      return source;
    }
  }

  setList(Note notes) async {
    var oldList = await getList();
    var data = {
      'id': notes.id,
      'title': notes.title,
      'notedTask': notes.notedTask
    };
    print(oldList);
    oldList.add(data);
    print(oldList);
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.setString(keyNote, json.encode(oldList));
    var temp = await spref.getString(keyNote);
    print(temp);
  }

  remove() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.remove(keyNote);
  }
}