import 'package:flutter/material.dart';
import 'package:note_app/functions/alert_dialog_functions.dart';
import 'package:provider/provider.dart';
import '../models/note_model.dart';
import '../pages/note_page.dart';
import '../providers/note_provider.dart';
import '../providers/read_only_note_provider.dart';
import '../widgets/alert dialogs/service_alert_dialog.dart';

class ListItemFunctions {
  onDeleteNotePressed({
    required BuildContext context,
    required ValueNotifier? valueNotifier,
    required String id,
    required int length,
  }) {
    showDialog(
      context: context,
      builder: (context) => ServiceAlertDialog(
        title: 'Are you sure you want to delete this note ?',
        buttonTitle: 'Delete',
        onServicePressed: () {
          AlertDialogFuncs().deleteTheNote(
            context: context,
            valueNotifier: valueNotifier,
            id: id,
            length: length,
          );
        },
      ),
    );
  }

  onListItemLongPressed({required ValueNotifier? valueNotifier}) {
    if (valueNotifier != null) {
      valueNotifier.value = true;
    }
  }

  onListItemPressed(
      {required BuildContext context,
      required bool value,
      required ValueNotifier? valueNotifier,
      required NoteModel noteModel}) {
    if (!value) {
      context.read<NoteProvider>().noteModel = noteModel;
      context.read<ReadOnlyNoteProvider>().readOnly = true;
      Navigator.pushNamed(context, NotePage.id);
    } else {
      if (valueNotifier != null) {
        valueNotifier.value = false;
      }
    }
  }
}
