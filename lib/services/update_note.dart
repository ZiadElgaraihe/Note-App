import 'package:note_app/helpers/logic.dart';

class UpdateNote {
  final List<dynamic> _listOfNotes = Logic().getFromPrefs();
  final Logic _logic = Logic();

  void updateNote({
    required String id,
    required String title,
    required String content,
    required int color,
  }) {
    //remove the note from the previous index and add it to the top
    _listOfNotes.removeWhere((element) => element['id'] == id);
    _listOfNotes.insert(0, {
      'id': id,
      'title': (title.isNotEmpty)
          ? title
          : content.split(' ').take(10).join(' '),
      'content': content,
      'color': color,
    });
    _logic.addToPrefs(_listOfNotes);
  }
}
