import 'package:flutter/material.dart';
import 'package:note_app/functions/alert_dialog_functions.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../pages/home_page.dart';
import '../providers/note_provider.dart';
import '../providers/read_only_note_provider.dart';
import '../providers/services_provider.dart';
import '../widgets/alert dialogs/service_alert_dialog.dart';
import '../widgets/snackbars/custom_snackbar.dart';

class NotePageFunctions {
  onBackPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomePage.id,
      (route) => false,
    );
  }

  onSavePressed({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    if (content.isNotEmpty) {
      if (context.read<NoteProvider>().noteModel == null) {
        context.read<ServicesProvider>().addNote(
              id: const Uuid().v4(),
              title: title,
              content: content,
            );
        context.read<ReadOnlyNoteProvider>().readOnly = false;
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.customSnackBar(message: 'Your note is saved'));
      } else {
        showDialog(
          context: context,
          builder: (context) => ServiceAlertDialog(
            title: 'Save changes ?',
            buttonTitle: 'Save',
            onServicePressed: () {
              AlertDialogFuncs().updateTheNote(
                context: context,
                title: title,
                content: content,
              );
            },
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.customSnackBar(
          message: 'The note content is required'));
    }
  }

  onEditPressed({required BuildContext context, required FocusNode focusNode}) {
    context.read<ReadOnlyNoteProvider>().readOnly = false;
    focusNode.requestFocus();
  }
}
