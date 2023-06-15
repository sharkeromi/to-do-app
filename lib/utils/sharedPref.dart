import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/model/noteModel.dart';

class DB extends GetxController {
  DB._();
  static DB get instance => DB._();

  final RxString key = 'notes'.obs;

  SharedPreferences? pref;

  reset() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
  }

  Future<List<Note>> get future async {
    // await reset();
    print("1");
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(key.value) == null) {
      print("1");
      await pref.setString(key.value, jsonEncode([]));
      print("1");
      // await reset();
    }
    String? source = pref.getString(key.value);
    print("1");
    List<Map<String, dynamic>> maplist = List.from(jsonDecode(source ?? '[]'));
    print("1");
    print(maplist);
    return maplist.map((e) => Note.ofJson(e)).toList();
  }

  updateAll(List<Note> notes) async {
    await reset();
    await pref?.setString(
        key.value, jsonEncode(notes.map((e) => e.json).toList()));
    update();
  }

  insert(Note note) async {
    final notes = await future;
    notes.add(note);
    await updateAll(notes);
    update();
  }

  updateNote(Note note) async {
    final notes = await future;
    int ind = notes.indexWhere((e) => e.id == note.id);
    if (ind >= 0) {
      notes[ind] = note;
      await updateAll(notes);
    }
    update();
  }

  delete(Note note) async {
    final notes = await future;
    int ind = notes.indexWhere((e) => e.id == note.id);
    if (ind >= 0) {
      notes.removeAt(ind);
      await updateAll(notes);
    }
    update();
  }
}
