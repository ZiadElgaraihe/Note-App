import 'package:note_app/helpers/logic.dart';
import 'package:note_app/models/note_model.dart';

class GetNotes {
  List<dynamic> getNotes() {
    //get the notes to update it after
      List<dynamic> data = Logic().getFromPrefs();
      List<NoteModel> notes = [];
      for (int i = 0; i < data.length; i++) {
        //get the notes as a noteModel
        notes.add(NoteModel.fromJson(data[i]));
      }
      return notes;
  }
}
