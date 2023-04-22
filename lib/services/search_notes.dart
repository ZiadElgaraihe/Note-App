import 'package:note_app/helpers/logic.dart';
import 'package:note_app/models/note_model.dart';

class SearchNotes {
  final List<NoteModel> _notes = [];

  void searchNotes(String value) {
    final List<dynamic> data = Logic().getFromPrefs();
    _notes.clear();
    for (int i = 0; i < data.length; i++) {
      //if the note title or content contain the searched value add it to the list
      if (data[i]['title'].toLowerCase().contains(value.toLowerCase()) ||
          data[i]['content'].toLowerCase().contains(value.toLowerCase())) {
        _notes.add(NoteModel.fromJson(data[i]));
      }
    }
  }

  List<NoteModel> getSearchedNotes() {
    return _notes;
  }
}
