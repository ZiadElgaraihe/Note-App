import 'package:flutter/material.dart';

class ReadOnlyNoteProvider extends ChangeNotifier {
  //controll the note page state either it's read only or not
  bool _readOnly = false;

  set readOnly(bool readOnly) {
    _readOnly = readOnly;
    notifyListeners();
  }

  bool get readOnly {
    return _readOnly;
  }
}
