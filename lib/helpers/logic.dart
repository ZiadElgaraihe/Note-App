import 'dart:convert';
import 'package:note_app/main.dart';

class Logic {
  //function that get the saved notes from shared preference
  List<dynamic> getFromPrefs() {
    if (prefs!.getString('notes') != null) {
      return jsonDecode(prefs!.getString('notes')!);
    }
    return [];
  }

  //function that add notes to shared preference
  void addToPrefs(List<dynamic> listOfNotes) {
    prefs!.setString('notes', jsonEncode(listOfNotes));
  }

  //function that remove notes from shared preference
  void removePrefs() {
    prefs!.remove('notes');
  }
}
