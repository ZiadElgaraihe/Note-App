import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/services/add_note.dart';
import 'package:note_app/services/delete_all_notes.dart';
import 'package:note_app/services/delete_note.dart';
import 'package:note_app/services/get_notes.dart';
import 'package:note_app/services/search_notes.dart';
import 'package:note_app/services/update_note.dart';

class ServicesProvider extends ChangeNotifier {
  SearchNotes search = SearchNotes();

  List<dynamic> getNotes() {
    return GetNotes().getNotes();
  }

  List<NoteModel> getSearchedNotes() {
    return search.getSearchedNotes();
  }

  void searchForNotes(String value) {
    search.searchNotes(value);
    notifyListeners();
  }

  void addNote(
      {required String id, required String title, required String content}) {
    AddNote().addNote(id: id, title: title, content: content);
    notifyListeners();
  }

  void updateNote({
    required String id,
    required String title,
    required String content,
    required int color,
  }) {
    UpdateNote()
        .updateNote(id: id, title: title, content: content, color: color);
    notifyListeners();
  }

  void deleteNote(String id) {
    DeleteNote().deleteNote(id);
    notifyListeners();
  }

  void deleteAllNotes() {
    DeleteAllNotes().deleteAllNotes();
    notifyListeners();
  }
}
