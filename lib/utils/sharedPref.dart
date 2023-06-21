import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/model/noteModel.dart';

class DB extends GetxController {

  static  String key = 'notes';
  SharedPreferences? pref;

  reset() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<List<Note>> get future async {
    await reset();
    var data = pref?.getString(key);
    print("value : " + data.toString());
    if (data == null) {
      await pref?.setString(key, jsonEncode([]));
    }
    String? source = pref?.getString(key);
    print("1" + source.toString());
    List<Map<String, dynamic>> maplist = List.from(jsonDecode(source ?? '[]'));
    print(maplist);
    return maplist.map((e) => Note.ofJson(e)).toList();
  }

  updateAll(List<Note> notes) async {
    await reset();
    await pref?.setString(
        key, jsonEncode(notes.map((e) => e.json).toList()));
  }

  insert(Note note) async {
    final notes = await future;
    notes.add(note);
    print(notes[0].id);
    print(notes[0].title);
    await updateAll(notes);
  }

  updateNote(Note note) async {
    final notes = await future;
    int ind = notes.indexWhere((e) => e.id == note.id);
    if (ind >= 0) {
      notes[ind] = note;
      await updateAll(notes);
    }
  }

  delete(Note note) async {
    final notes = await future;
    int ind = notes.indexWhere((e) => e.id == note.id);
    if (ind >= 0) {
      notes.removeAt(ind);
      await updateAll(notes);
    }
  }
}
