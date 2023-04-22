import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/note_provider.dart';
import '../providers/read_only_note_provider.dart';
import '../providers/services_provider.dart';
import '../widgets/snackbars/custom_snackbar.dart';

class AlertDialogFuncs {
  deleteAllNotes({required BuildContext context, required ValueNotifier valueNotifier}) {
    context.read<ServicesProvider>().deleteAllNotes();
    valueNotifier.value = false;
    Navigator.pop(context);
  }

  deleteTheNote(
      {required BuildContext context,
      required ValueNotifier? valueNotifier,
      required String id,
      required int length}) {
    if (valueNotifier != null) {
      context.read<ServicesProvider>().deleteNote(id);
      if (length == 1) {
        valueNotifier.value = false;
      }
      Navigator.pop(context);
    }
  }

  updateTheNote(
      {required BuildContext context, required String title, required String content}) {
    context.read<ServicesProvider>().updateNote(
          title: title,
          content: content,
          color: context.read<NoteProvider>().noteModel!.backgroundColor,
          id: context.read<NoteProvider>().noteModel!.id,
        );
    context.read<ReadOnlyNoteProvider>().readOnly = true;
    ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar.customSnackBar(message: 'Your changes is saved'));
    Navigator.pop(context);
  }
}
