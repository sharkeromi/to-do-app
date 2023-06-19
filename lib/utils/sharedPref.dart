import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/model/noteModel.dart';

class DB extends GetxController {
  // DB._();
  // static DB get instance => DB._();

  static  String key = 'notes';

  SharedPreferences? pref;

  reset() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<List<Note>> get future async {
    await reset();
    print("key :" + key);
    // print("1");
    var data = pref?.getString(key);
    print("value :" + data.toString());
    //SharedPreferences pref = await SharedPreferences.getInstance();
    if (data == null) {
      // print("1");
      await pref?.setString(key, jsonEncode([]));
      // print("1");
      // await reset();
    }
    String? source = pref?.getString(key);
    print("1" + source.toString());
    // print("1");
    List<Map<String, dynamic>> maplist = List.from(jsonDecode(source ?? '[]'));
    // print("1");
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
