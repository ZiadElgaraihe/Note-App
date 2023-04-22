import 'dart:math';
import 'package:note_app/helpers/logic.dart';

class AddNote {
  final List<int> _colors = [
    0xFFFD99FF,
    0xFFFF9E9E,
    0xFF91F48F,
    0xFFFFF599,
    0xFF9EFFFF,
    0xFFB69CFF,
    0xFF94B5FF,
    0xFF3CC0BA,
    0xFFFFA001,
    0xFF316FEA,
    0xFFFF5C63,
  ];

  //get the notes to update it after
  final List<dynamic> _listOfNotes = Logic().getFromPrefs();

  final Logic _logic = Logic();

  //get the note info and add it to the note list with a random color
  void addNote(
      {required String id, required String title, required String content}) {
    //use 'insert' to index 0 to add the new note to the top of notes
    _listOfNotes.insert(0, {
      'id': id,
      'title':
          (title.isNotEmpty) ? title : content.split(' ').take(20).join(' '),
      'content': content,
      'color': _colors[Random().nextInt(_colors.length)],
    });
    _logic.addToPrefs(_listOfNotes);
  }
}
