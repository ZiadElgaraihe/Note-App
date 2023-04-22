import 'package:note_app/helpers/logic.dart';

class DeleteNote {
  //get the notes to update it after
  final List<dynamic> _listOfNotes = Logic().getFromPrefs();

  final Logic _logic = Logic();

  //delete note using id
  void deleteNote(String id) {
    _listOfNotes.removeWhere((element) => element['id'] == id,);
    _logic.addToPrefs(_listOfNotes);
  }
}
