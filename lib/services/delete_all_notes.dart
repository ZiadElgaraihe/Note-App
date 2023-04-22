import 'package:note_app/helpers/logic.dart';

class DeleteAllNotes {
  final Logic _logic = Logic();

  deleteAllNotes() {
    _logic.removePrefs();
  }
}
