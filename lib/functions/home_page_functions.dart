import 'package:flutter/material.dart';
import 'package:note_app/functions/alert_dialog_functions.dart';
import 'package:provider/provider.dart';
import '../pages/note_page.dart';
import '../pages/search_page.dart';
import '../providers/note_provider.dart';
import '../providers/read_only_note_provider.dart';
import '../providers/services_provider.dart';
import '../widgets/alert dialogs/info_alert_dialog.dart';
import '../widgets/alert dialogs/service_alert_dialog.dart';

class HomePageFuncs {
  onDeleteAllNotesPressed({
    required BuildContext context,
    required ValueNotifier valueNotifier,
  }) {
    showDialog(
      context: context,
      builder: (context) => ServiceAlertDialog(
          title: 'Are you sure you want to delete all notes ?',
          buttonTitle: 'Delete',
          onServicePressed: () {
            AlertDialogFuncs().deleteAllNotes(
              context: context,
              valueNotifier: valueNotifier,
            );
          }),
    );
  }

  onSearchPressed(BuildContext context) {
    context.read<ServicesProvider>().searchForNotes('');
    Navigator.pushReplacementNamed(context, SearchPage.id);
  }

  onInfoButtonPressed(context) {
    showDialog(
      context: context,
      builder: (context) => const InfoAlertDialog(),
    );
  }

  onFloatingButtonPressed(
      {required context, required ValueNotifier valueNotifier}) async {
    if (valueNotifier.value) {
      valueNotifier.value = false;
      await Future.delayed(const Duration(milliseconds: 1100));
    }
    Provider.of<NoteProvider>(context, listen: false).noteModel = null;
    Provider.of<ReadOnlyNoteProvider>(context, listen: false).readOnly = false;
    Navigator.pushNamed(context, NotePage.id);
  }
}
